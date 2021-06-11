//Sample contract to explain about how to use modifier from a security perspective.

pragma solidity ^0.4.8;

contract BankTwo {

    mapping(address => uint) public balanceOfTwo;
    uint public totalSupply;

    modifier hasBalance() {
        require(balanceOfTwo[msg.sender] > 0);
        _;
    }

    function deposit() public payable {
        balanceOfTwo[msg.sender] += msg.value;
        totalSupply += msg.value;
        assert(this.balanceOfTwo >= totalSupply);
    }

    function withdrawAll() public hasBalance {
        uint amountToWithdraw = balanceOfTwo[msg.sender];
        balanceOfTwo[msg.sender] = 0;
        msg.sender.transfer(amountToWithdraw);
        assert(balanceOfTwo[msg.sender] == 0);
    }
}

/* the biggest advantage of having a modifier is we can use it to multiple function if we need to use its logic again,
the danger of having a modifier or using a modifier is when sometimes you might make a mistake and include other type of logic
in the modifier than an error checking function like require or assert, 99% we will use require because we are usally checking inputs properties and so on,
but sometimes you might make a mistake and include other functionality.
like for ex: you might make an external call in a modifier that would be dangerous because you would violate the pattern of "checks, effects and interactions"
specially if inside the modifier function we include unnecessary logic and we don't wanna do that because we might be open up for a re entrency attacks, 
second you need to keep this modifiers if you want to use them and you need to keep them simple, you really dont want to make complex functionality in your modifier
you only need to stick to the basic interpretation of the modifier name and you want to make it as clear as possible, because other developers might stumble upon our code
and might want to work with the same project as you, and as you all know the modifier is declared on top and below it is a long lines of code
and then you will put modifier on a function found somewhere in the bottom and you put complex logic on it and the developer will not notice that you have some complex logic
in your modifier which messes up the rest of the code and opens up for a re entrency attacks.
so therefore just keep your modifier just short and simple, so that even people that doesn't read your modifier, will be able to know what is it even just by reading the name,
the name should be very clear and the functionality should be within the specification, that is the sort of standard that we developers should adhere to.*/