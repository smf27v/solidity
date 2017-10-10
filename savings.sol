pragma solidity ^0.4.0;

contract Savings{
    address owner;

    event UpdateStatus(string _msg);
    event UserStatus(string _msg, address user, uint amount);

    function Savings() public{
        owner = msg.sender;

    }

    function depositFunds() public payable{
        UserStatus('User has deposited some money', msg.sender, msg.value);
    }

    function kill() public onlyOwner{
        selfdestruct(owner);
    }

    function withdrawFunds(uint amount) public onlyOwner{
        if(owner.send(amount)){
            UpdateStatus('User Withdraw some money');
        }
    }

    function getFunds() onlyOwner public constant returns(uint){
        return this.balance;
    }

    modifier onlyOwner(){
        if(owner != msg.sender){
            revert();
        }else{
            _;
        }
    }
}
