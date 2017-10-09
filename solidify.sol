pragma solidity ^0.4.0;

contract SolidifyKnowledge{

    string word;
    uint number;
    address owner;

    function SolidifyKnowledge(string _word) public{

        word = _word;
        number = 40;
        owner = msg.sender;
    }

    event Changed(address a);

    modifier OnlyOwner{
        require(msg.sender == owner);
        _;
    }

    function getName() public constant returns(string){
        return word;
    }

    function setName(string w) public OnlyOwner{
        word = w;
        Changed(msg.sender);
    }
}
