pragma solidity 0.5.1;

//An easyway of updating a functional contract
//Instead of rewriting  every functions from the Dogs contract, we will just inherit from that contract and just add the functions and variables that are not found in that contract by adding it here in this contract.

import "./Dogs.sol";
//since Dogs.sol already inherited the storage contract so it means this contract is also inherited storage as well.

contract DogsUpdatedEasyWay is Dogs { //you can write DogsUpdated in this contract if you will apply this easyway of updating a functional contract in real life, and not anymore deploy the other one.

    constructor() public {
        initialize(msg.sender);
    }

    function initialize(address _owner) public {
        require(!_initialized);
        owner = _owner;
        _initialized = true;
        
    }

}