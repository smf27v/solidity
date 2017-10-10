pragma solidity ^0.4.0;

contract LastWill{

    address owner;

    uint256 public lastTouch;

    address[] public childs;

    event Status (string msg, address user, uint256 time);

    function LastWill() public payable{
        owner = msg.sender;
        lastTouch = block.timestamp;
        Status('Last Will Contract Was Created', msg.sender, block.timestamp);
    }

    function depositFunds() public payable{
        Status('Funds Where Deposited', msg.sender, block.timestamp);
    }

    function stillAlive() public onlyOwner{
        lastTouch = block.timestamp;
        Status('I Am still Alive!!', msg.sender, block.timestamp);
    }

    function isDead() public{
        Status('Asking if Dead', msg.sender, block.timestamp);
        if(block.timestamp > (lastTouch + 120)){
            giveMoneyToChilds();
        }else{
            Status('I´m not Dead you Bastard', msg.sender, block.timestamp);
        }
    }


    function giveMoneyToChilds() public{
        Status('I Am dead, Hope you cried, Take My Money!', msg.sender, block.timestamp);
        uint amountPerChild = this.balance/childs.length;
        for(uint i = 0; i < childs.length; i++){
            childs[i].transfer(amountPerChild);
        }
    }

     function addChild(address _address) public onlyOwner{
        Status('New Child added', _address, block.timestamp);
        childs.push(_address);
    }



    modifier onlyOwner{
        if(msg.sender != owner){
            revert();
        }else{
            _;
        }
    }
}
