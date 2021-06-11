//sample smart contract with require and assert which are both error handling functions in solidity.

contract Bank(x) {

    mapping(address => uint) public balanceOf;

    function withdrawAll() public {
        
        require(balanceOf[msg.sender] > 0); // to validate inputs, responses that we had from internal contract, state conditions.
        
        uint amountToWithdraw = balanceOf[msg.sender]; //on this 3 lines 11, 12, 13: we perform the withdrawal.
        balanceOf[msg.sender] = 0; 
        msg.sender.transfer(amountToWithdraw);
        
        assert(balanceOf[msg.sender] == 0); // should be used rarely, to check conditions that should never ever happened, and if they happen assert will revert the transaction and consume all of the remaining gas.
                                //assert is use to check for example the overflow and underflow, assert check for invariants, assert also checks what we change from state variable have actually happened.
                                //and assert is usually used at the end of the function

    }
}

//if the assert on line 15 throws, then its a disaster, because we emptied out the account, and now if the balance is not zero, then something has gone very very wrong.
//because line 15 is an invariant. it means that assert function should never revert or else something is wrong.