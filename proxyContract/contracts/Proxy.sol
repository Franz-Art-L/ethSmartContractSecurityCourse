pragma solidity 0.5.1;

import "./Storage.sol";

contract Proxy is Storage {

    address currentAddress;

    constructor(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

    function upgrade(address _newAddress) public {
        currentAddress = _newAddress;
        
    }

    //FALLBACK FUNCTION.
    function () payable external {
        //REDIRECT TO currentAddress

        address implemenation = currentAddress;
        require(currentAddress != address(0));
        bytes memory data = msg.data;

        //DELEGATE CALL EVERY FUNCTION CALL.
        //the code below will be a low level function, since solidity does have their own assembly language called 'Yul'. 
        assembly {
            let result := delegatecall(gas, implemenation, add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize
            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)
            switch result
            case 0 {revert(ptr, size)}
            default {return(ptr, size)}
        }

    }

}