pragma solidity ^0.6.10;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";


contract STDERC20 is ERC20 {
    constructor (string memory name, string memory symbol)
        ERC20(name, symbol)
        public
    {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        _mint(msg.sender, 500000000 * 10 ** uint(decimals()));
    }
}
