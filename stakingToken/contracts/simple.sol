pragma solidity ^0.6.10;

contract SimpleStorage {
    uint storedData;

    function set(uint x) {
        storedData = x;
    }

    function get()
    public
    returns(uint)
    {
      return storedData;
    }

}
