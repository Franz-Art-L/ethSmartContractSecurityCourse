pragma solidity 0.5.1;

import "./storageContract.sol";

contract Dogs is Storage {
    
    function getNumberOfDogs() public view returns(uint256) {
        return Storage.getNumber();
    }
    
    function setNumberOfDogs(uint256 toSet) public {
        Storage.setNumber(toSet +1);
    }
    
}

//this contract is where the logic of the function happens, this is where the functions are instanciated.
//this is the contract where the proxy contract passes the users requests,
// this contract also inherits to the storage so that proxy and also this contract will have the same storage layout
// NOTE: I purposely put a bug in this contract at line 12 so that we can change this contract and upgrade it into a new non buggy contract, and perform the purpose
//of this topic about upgradeability.

//when you try this one on remix, this will be the first contract to be deployed so that we can get the contract address and put it on the proxy contract.
//when you are going to debug this contract, you will deployed this again and copy the new contract address to the proxy contract.