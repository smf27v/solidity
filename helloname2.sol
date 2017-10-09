pragma solidity ^0.4.0; //Solidity Version

contract HelloNameContract {  //Create a Contract
    string name = 'Hello Sergio';  //Create a variable string
    address owner;

    // internal: keyword to indicate that the function can only be called by the smart contract itself, not externally.
    function HelloNameContract() public{ //Create a function to initialize the contract.
        owner = msg.sender;
    }
    function getName() public constant returns(string){  //Create a function for return the name.  Declare public for all ussers to acces
        return name;
    }

    function setName(string newName) public returns(string){ //Create a function for select the newName.  It is not constant because we are going to modify.
        if(owner != msg.sender){
            return "You aren't the creator of the contract";
        }
        name = newName;
        return "Yes you're the creator of the contract";
    }
}
