pragma solidity ^0.4.0;

contract CallerContract{

    CalledContract toBeCalled =  new CalledContract();

    function getNumber() public constant returns (uint){
        return toBeCalled.getNumber();
    }
}

contract CalledContract{
    uint number = 300;

    function getNumber() public constant returns(uint){
        return number;
    }
}
