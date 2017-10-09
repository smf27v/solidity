pragma solidity ^0.4.0;

contract Functions {

    string public text = '';
    int numberOfChanges = 0;

    function changeToName() public{
        numberOfChanges += 1;
        text = "Hello Sergio";
    }

    function callChangeToName() public{
        changeToName();
        if(numberOfChanges == 3){
            changeToBye();
        }
    }

    function changeToBye() public{
        numberOfChanges += 1;
        text = 'Bye Sergio';
    }
}
