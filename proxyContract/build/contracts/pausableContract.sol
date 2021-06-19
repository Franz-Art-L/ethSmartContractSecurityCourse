pragma solidity 0.5.1;

contract Bank {

    mapping(address => uint) balances;

    address owner;

    bool private _paused;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor () internal {
        _paused = false;
    }

    //Allow to execute when contract is not paused
    modifier whenNotPaused() {
        require(!_paused);
        _;
    }

    modifier whenPaused() {
        require(_paused);
        _;
    }

    function pause() public onlyOwner whenNotPaused {
        _paused = true;
    }

    function unPause() public onlyOwner whenPaused {
        _paused = false;       
    }

    function withdrawAll() public whenNotPaused {
        uint amountToWithdraw = balances[msg.sender];
        balances[msg.sender] = 0;
        msg.sender.call.value(amountToWithdraw);
    }
    
    //this function below is just an example if ever you as the owner will decide to have a emergency withdrawall of all the funds
    //when there is a big problem arises and you have to get all the funds back to you, as long as your users knows this and they also support this emergency withdraw function
    function emergencyWithdrawal() public view onlyOwner whenPaused {
        //withdrawal to owner
    }

}