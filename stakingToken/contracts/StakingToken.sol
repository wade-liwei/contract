pragma solidity ^0.6.10;


import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";
/*import "openzeppelin-solidity/contracts/access/AccessControl.sol";
import "openzeppelin-solidity/contracts/GSN/Context.sol"; */


/**
 * @title Staking Token (STK)
 * @notice Implements a basic ERC20 staking token with incentive distribution.
 */
contract StakingToken is ERC20, Ownable {

    using SafeMath for uint256;
    using SafeERC20 for IERC20;


    /**
     * @notice We usually require to know who are all the stakeholders.
     */
    address[] internal stakeholders;

    /**
     * @notice The stakes for each stakeholder.
     */
    mapping(address => uint256) internal stakes;

    /**
     * @notice The accumulated rewards for each stakeholder.
     */
    mapping(address => uint256) internal rewards;



    address public interest;


    constructor (string memory name, string memory symbol,address  _interest)
        ERC20(name, symbol)
        public
    {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        //_mint(msg.sender, 500000000 * 10 ** uint(decimals()));
        interest = _interest;
    }

    // ---------- STAKES ----------

    /**
     * @notice A method for a stakeholder to create a stake.
     * @param _stake The size of the stake to be created.
     */
    function createStake(uint256 _stake)
        public
    {

      (bool _isStakeholder, ) = isStakeholder(msg.sender);
      if(!_isStakeholder){
        _burn(msg.sender, _stake);
        if(stakes[msg.sender] == 0) addStakeholder(msg.sender);
        stakes[msg.sender] = stakes[msg.sender].add(_stake);
      }
    }

    /**
     * @notice A method for a stakeholder to remove a stake.
     */
    function removeStake()
        public
    {
        //stakes[msg.sender] = stakes[msg.sender].sub(_stake);
        stakes[msg.sender] = stakes[msg.sender].sub(stakes[msg.sender]);
        removeStakeholder(msg.sender);
        _mint(msg.sender, stakes[msg.sender]);
        _withdrawReward();
    }

    /**
     * @notice A method to retrieve the stake for a stakeholder.
     * @param _stakeholder The stakeholder to retrieve the stake for.
     * @return uint256 The amount of wei staked.
     */
    function stakeOf(address _stakeholder)
        public
        view
        returns(uint256)
    {
        return stakes[_stakeholder];
    }


    function GetStakes()
        public
        view
        returns(address[] memory _stakeholders, uint256[] memory _stakes)
    {
      uint256[] memory newstakes = new uint256[](stakeholders.length);
      for (uint256 s = 0; s < stakeholders.length; s += 1){
          newstakes[s]= stakes[stakeholders[s]];
      }
      return (stakeholders,newstakes);
    }

    function GetRewards()
        public
        view
        returns(address[] memory _stakeholders, uint256[] memory _rewards)
    {
      uint256[] memory newrewards = new uint256[](stakeholders.length);
      for (uint256 s = 0; s < stakeholders.length; s += 1){
          newrewards[s]= rewards[stakeholders[s]];
      }
      return (stakeholders,newrewards);
    }





    /**
     * @notice A method to the aggregated stakes from all stakeholders.
     * @return uint256 The aggregated stakes from all stakeholders.
     */
    function totalStakes()
        public
        view
        returns(uint256)
    {
        uint256 _totalStakes = 0;
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            _totalStakes = _totalStakes.add(stakes[stakeholders[s]]);
        }
        return _totalStakes;
    }

    // ---------- STAKEHOLDERS ----------

    /**
     * @notice A method to check if an address is a stakeholder.
     * @param _address The address to verify.
     * @return bool, uint256 Whether the address is a stakeholder,
     * and if so its position in the stakeholders array.
     */
    function isStakeholder(address _address)
        public
        view
        returns(bool, uint256)
    {
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            if (_address == stakeholders[s]) return (true, s);
        }
        return (false, 0);
    }

    /**
     * @notice A method to add a stakeholder.
     * @param _stakeholder The stakeholder to add.
     */
    function addStakeholder(address _stakeholder)
        internal
    {
        (bool _isStakeholder, ) = isStakeholder(_stakeholder);
        if(!_isStakeholder) stakeholders.push(_stakeholder);
    }

    /**
     * @notice A method to remove a stakeholder.
     * @param _stakeholder The stakeholder to remove.
     */
    function removeStakeholder(address _stakeholder)
        internal
    {
        (bool _isStakeholder, uint256 s) = isStakeholder(_stakeholder);
        if(_isStakeholder){
            stakeholders[s] = stakeholders[stakeholders.length - 1];
            stakeholders.pop();
        }
    }

    // ---------- REWARDS ----------

    /**
     * @notice A method to allow a stakeholder to check his rewards.
     * @param _stakeholder The stakeholder to check rewards for.
     */
    function rewardOf(address _stakeholder)
        public
        view
        returns(uint256)
    {
        return rewards[_stakeholder];
    }

    /**
     * @notice A method to the aggregated rewards from all stakeholders.
     * @return uint256 The aggregated rewards from all stakeholders.
     */
    function totalRewards()
        public
        view
        returns(uint256)
    {
        uint256 _totalRewards = 0;
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            _totalRewards = _totalRewards.add(rewards[stakeholders[s]]);
        }
        return _totalRewards;
    }




    function BatchStakeholderAddRewards(address[] memory _stakeholders, uint256[] memory  _rewards)
        public
        onlyOwner
    {

      require(
          _stakeholders.length == _rewards.length,
          "BatchStakeholderAddRewards: _stakeholders.length != _rewards.length"
      );

      for (uint256 s = 0; s < _stakeholders.length; s += 1){
         (bool _isStakeholder, ) = isStakeholder(_stakeholders[s]);
        if(_isStakeholder){
          address stakeholder = _stakeholders[s];
          rewards[stakeholder] = rewards[stakeholder].add(_rewards[s]);
          }
        }
    }

    function BatchStakeholderSubRewards(address[] memory _stakeholders, uint256[] memory  _rewards)
        public
        onlyOwner
    {

      require(
          _stakeholders.length == _rewards.length,
          "BatchStakeholderSubRewards: _stakeholders.length != _rewards.length"
      );

      for (uint256 s = 0; s < _stakeholders.length; s += 1){
        (bool _isStakeholder, ) = isStakeholder(_stakeholders[s]);
       if(_isStakeholder){
          address stakeholder = _stakeholders[s];
          rewards[stakeholder] = rewards[stakeholder].sub(_rewards[s]);
      }
    }
    }

    function Mint(address  recipient, uint256 amount)
        public
        onlyOwner
    {
      _mint(recipient, amount);
    }


    function Burn(uint256 amount)
        public
    {
      _burn(msg.sender, amount);
    }

    /**
     * @notice A method to allow a stakeholder to withdraw his rewards.
     */
    function _withdrawReward()
        internal
    {
        uint256 reward = rewards[msg.sender];
        rewards[msg.sender] = 0;
        //_mint(msg.sender, reward);

        if(reward == 0) return;

        require(
            _doTransferOut(interest, msg.sender, reward),
            "transferFee: Token transfer out of contract failed."
        );
    }


    function _doTransferOut(
        address _token,
        address _to,
        uint256 _amount
    ) internal returns (bool) {
        IERC20 token = IERC20(_token);
        bool result;

        token.transfer(_to, _amount);

        assembly {
            switch returndatasize()
                case 0 {
                    result := not(0)
                }
                case 32 {
                    returndatacopy(0, 0, 32)
                    result := mload(0)
                }
                default {
                    revert(0, 0)
                }
        }
        return result;
    }


    /**
     * @notice A simple method that calculates the rewards for each stakeholder.
     * @param _stakeholder The stakeholder to calculate rewards for.
     */
    function calculateReward(address _stakeholder)
        public
        view
        returns(uint256)
    {
        return stakes[_stakeholder] / 100;
    }


    /**
     * @notice A method to distribute rewards to all stakeholders.
     */
    function distributeRewards()
        public
        onlyOwner
    {
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            address stakeholder = stakeholders[s];
            uint256 reward = calculateReward(stakeholder);
            rewards[stakeholder] = rewards[stakeholder].add(reward);
        }
    }

}
