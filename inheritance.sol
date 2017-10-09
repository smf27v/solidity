pragma solidity ^0.4.0;

contract mortal{
    address public owner;

    function mortal() public{
        owner = msg.sender;
    }

    modifier onlyOwner{
        if(msg.sender != owner){
            revert();
        }else{
            _;
        }
    }
    function kill() public onlyOwner{
        selfdestruct(owner);
    }
}

contract User is mortal{

    string public userName;

    function User(string _name) public{
        userName = _name;
    }
}

contract Provider is mortal {
    string public providerName;

    function Provider(string _name) public{
        providerName = _name;
    }
}
