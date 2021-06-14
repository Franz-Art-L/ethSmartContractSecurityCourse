//sample contract for invariant error handling function explanation.

contract Bank {
    
    mapping(address => uint) public balanceOf;
    uint public totalSupply;

    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        totalSupply += msg.value;
        assert(balanceOf[msg.sender] >= msg.value);
    
    }

}

/*the invariant that we set on line 11 at the bottom of the function, this means that everytime we reach at the end of the function should be larger or equal to msg.value
 because msg.value is just the latest number that we add to the balance, but we could have run this function ten times so its not weird if balanceOf is larger than msg.value but
 it should never be smaller than msg.value, because even though msg.sender is 0 to begin with but we added on msg.value */

/* however the invariant on line 11 will only be true if we only put it at the bottom of the function, at the end of the code execution,
because if we were to put this invariant at the top of the function body, this will not be true, so it means it will not be anymore an invariant
because the code -> assert(balanceOf[msg.sender] >= msg.value); will not be anymore true if we will put it at the top of the function body,
since we hadn't added yet the msg.value to the balanceOf msg.sender since the code -> balanceOf[msg.sender] += msg.value written after the invariant,
like for example if the balance of msg.sender before the execution of the deposit function is 0 and then the value of the deposit is 100, so therefore the invariant
that assert on top of function body that says assert(0 >= 100); is a clear false, so it is not a invariant.
And that's why invariant is very helpful in a smart contract because once it will revert or throws an error it means that there is something wrong with our
smart contract because something is not true.
*/