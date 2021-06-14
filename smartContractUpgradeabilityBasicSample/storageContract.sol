pragma solidity 0.5.1;

contract Storage {
    
    uint256 number;
    
    function getNumber() internal view returns (uint) {
        return number;
    }
    
    function setNumber(uint256 _number) internal {
        number = _number;

    }
    
}

//no need to deploy this contract since this contract is already inherited by both the proxy and the functional contract.