pragma solidity ^0.4.0;

contract Calculator{
    Math math = new Math();

    function twoPlusFour() public constant returns(int){
        return math.add(2,4);
    }

    function twoTimesFour() public constant returns(int) {
        return  math.multiply(2,4) ;
    }
}

contract Math {
    function add(int a, int b) public payable returns(int){
        return a + b;
    }
    function multiply(int a, int b) public payable returns(int){
        return a * b;
    }
}
