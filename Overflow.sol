pragma solidity 0.4.10;

contract Overflow {
    
    mapping (address => uint) balances;
    
    function contribute() payable {
        // 1 wei = 1 token
        balances[msg.sender] = msg.value;
    }
    
    function getBalance() constant returns (uint) {
        return balances[msg.sender];
    }
    
    function batchSend( address[] _receivers, uint _value ) {
        // this line Overflows
        uint total = _receivers.length * _value;
        require(balances[msg.sender] >= total);
        
        //subtract from sender
        balances[msg.sender] = balances[msg.sender] - total;
        
        for(uint i = 0; i < _receivers.length; i++) {
            balances[_receivers[i]] = balances[_receivers[i]] + _value;
        }
        
    }
    
}