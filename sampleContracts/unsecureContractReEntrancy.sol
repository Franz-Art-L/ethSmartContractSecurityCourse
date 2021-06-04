//Unsecure code, don't use this because this is not secure, this is prone for re-entrency attack

mapping (address => uint) private balances;

function withdrawALL() public {
    
    uint amountToWithdraw = balances[msg.sender];
    require(msg.sender.call.value(amountToWithdraw)());
    balances[msg.sender] = 0;
    
}
