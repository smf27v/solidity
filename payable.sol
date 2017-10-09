pragma solidity ^0.4.0;

contract PayableContract{
    function PayableContract() public{

    }

    function recieveFunds() public payable{

    }

    function getBalance() public constant returns(uint){
        return this.balance;
    }
}
