//Push vs Pull

//Push
//Push funds to user

//Example  function of Push(Bad way of doing)

function play() payable {
    //Game logic

    if(win) {
        player.transfer(prize);
    }
}


//Pull
//let user pull out funds themselves

//Example of Pull (Good way of doing)

mapping(address => uint) prizes;

function play() public {
    //Game logic

    if(win) {
        prizes[player] = prize;
    }
}

function getPrize() public {
    uint prize = prizes[msg.sender];
    prizes[msg.sender] = 0;
    msg.sender.transfer(prize);
}