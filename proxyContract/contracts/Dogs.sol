pragma solidity 0.5.1;

import "./Storage.sol";

contract Dogs is Storage {

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function getNumberOfDogs () public view returns(uint256) {

        return _uintStorage["Dogs"];

    }

/*    function setNumberOfCats(uint256 toSet) public {
        uintStorage["Cats"] = toSet;
    }

    function setNumberOfBirds(uint256 toSet) public {
        uintStorage["Birds"] = toSet;
    }

    function setNumberOfBees(uint256 toSet) public {
        uintStorage["Bees"] = toSet;
    }

    function setNumberOfTigers(uint256 toSet) public {
        uintStorage["Tigers"] = toSet;
    }

    //from line 22 up to line 36 are just examples function to show how important is it that
    //we already have certain mapping on our storage contract, and other mappings as well 
    //to store differemt kinds of variables.

*/

    function setNumberOfDogs(uint256 toSet) public {
        _uintStorage["Dogs"] = toSet;
        
    }

}