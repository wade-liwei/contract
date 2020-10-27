pragma solidity ^0.6.10;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/payment/escrow/Escrow.sol";
import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol"
//import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Yield is Escrow {
    Escrow private _escrow;
    ERC20  private _interest;
    IERC20 private _token;

    event DoneStuff(address from);

    constructor (IERC20 token,string memory name, string memory symbol)
        //ERC20(name, symbol)
        public
        //internal
    {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        //_mint(msg.sender, 500000000 * 10 ** uint(decimals()));
        _token = token;
        _escrow = new Escrow();
        _interest = new ERC20(name, symbol);
    }

    function withdrawUnderlyingToken(address payable payee) public virtual {
        _escrow.withdraw(payee);
    }


    function UnderlyingToken(address dest) public view returns (uint256) {
        return _escrow.depositsOf(dest);
    }

    function depositUnderlyingToken(uint256 amount) internal virtual {
      address from = msg.sender;
      _token.transferFrom(from, address(this), 1000);
      emit DoneStuff(from);
      _escrow.deposit{ value: amount }(from);
    }
}
