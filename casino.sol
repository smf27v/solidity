pragma solidity ^0.4.0;

contract CoinFlip{
    address owner;
    uint payPercentaje = 90;

    event Status(string _msg, address user, uint amount);

    function CoinFlip() public payable{
        owner = msg.sender;
    }

    function FlipCoin() public payable{
        if((block.timestamp % 2) == 0){
            if(this.balance < ((msg.value*payPercentaje)/100)){
                Status('Congratulations, You are the , but Sorry, we didn´t have enought money, we will deposit everithing we have!!', msg.sender, this.balance);
                msg.sender.transfer(this.balance);
            }else{
                Status('Congratulations, You won!', msg.sender, msg.value * (100 + payPercentaje)/100);
                msg.sender.transfer(msg.value * (100 + payPercentaje)/100);
            }
        }else{
            Status('We are sorry, you lose, try again to recover your money', msg.sender, msg.value);
        }
    }

    modifier onlyOwner{
        if(msg.sender != owner){
            revert();
        }else{
            _;
        }
    }
}
