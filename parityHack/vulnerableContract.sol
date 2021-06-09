pragma solidity ^0.4.8;

import "./parityHackLibrary.sol";

contract Fundraiser {
    
    Library lib = Library(0xddaAd340b0f1Ef65169Ae5E41A8b10776a75482d); //this address is just an example, you can copy the contract address when you deploy first the library contract when you play these contracts on remix.
    
    mapping(address => uint) balances;
    
    function contribute() payable {
        balances[msg.sender] += msg.value;
        
    }
    
    function withdraw() {
        if(lib.isNotPositive(balances[msg.sender])){
            throw;
        }
        
        balances[msg.sender] = 0;
        
        msg.sender.call.value(balances[msg.sender])();
    }
    
    function getFunds() returns (uint) {
        return address(this).balance;
    }
    
}