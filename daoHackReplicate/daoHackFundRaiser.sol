//just a simple contract how did the famous dao hack had happened, this is not really the exact copied contract this is more of a replication

pragma solidity ^0.4.8;

contract Fundraiser {
    
    mapping(address => uint) balances;

    function contribute() payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() {
        if(balances[msg.sender] == 0) {
            throw;
        }

        if(msg.sender.call.value(balances[msg.sender])()){
            balances[msg.sender] = 0;
        }

        else {
            throw;
        }

    }

}

/*The vulnerability is on line 16, because there will be a tendency that the caller of 
he withdraw function can call recursively while the balance on the smart contract is 
not yet updated since the code that updated the balances
is below that call value */

