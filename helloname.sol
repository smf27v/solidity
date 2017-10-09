pragma solidity ^0.4.0; //Solidity Version

contract HelloWorldContract {  //Create a Contract
    string name = 'Hello Sergio';  //Create a variable string

    function getName() public constant returns(string){  //Create a function for return the name.  Declare public for all ussers to acces
        return name;
    }

    function setName(string newName) public returns(string){ //Create a function for select the newName.  It is not constant because we are going to modify.
        name = newName;
        return name;
    }
}
