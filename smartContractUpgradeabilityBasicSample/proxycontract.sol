pragma solidity 0.5.1;

import "./storageContract.sol";

contract ProxyDog is Storage {
    
    address  public currentAddress;
    
    constructor(address _currentAddress) public {
        currentAddress = _currentAddress;
        
    }
    
    function upgrade(address _currentAddress) public {
        currentAddress = _currentAddress;
    }
    
    function getNumberOfDogs() public returns (bool, bytes memory) {
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("getNumberOfDogs()"))));
        return (res, data);
    }
    
    function setNumberOfDogs(uint256 _number) public returns (bool, bytes memory) {
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("setNumberOfDogs(uint256)")), _number ));
        return (res, data);
    }

}

//this contract is where the user will interact and this contract will pass the users functional request to the functional contract for the logic and execution of the transactions,
//the code from the line 7 to line is the 16 is the one part of the proxy functionality that stores the functional contract address and to be able to replace it.
//and the remaining part of this contract from line 18 to line 26 is to redirect the users request and pass it to the functional contract by delegating the calls to the address that we input right here
// on the constructor.
