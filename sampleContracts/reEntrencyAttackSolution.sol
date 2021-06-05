//Check-Effects-Interactions Pattern

//This code pattern is used to solve the unsecured contract that we did on another file that can be prone for re-entrency attack

mapping (address => uint) private balances;

function withdrawAll() public {
    //Check
    uint amountToWithdraw = balances[msg.sender];
    
    //Effects
    balances[msg.sender] = 0;
    
    //Interaction
    require(msg.sender.call.value(amountToWithdraw)());
     
}