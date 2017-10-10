pragma solidity ^0.4.0;

contract ToothFairy{

    address child = 1;
    address mother = 2;
    address toothFairy = 3;

    bool toothPaid = false;

    enum ToothState {Mouth, WaitingFallenAproval, Fallen}

    ToothState public toothState = ToothState.Mouth;

    function ToothFairy() public payable{
        toothFairy = msg.sender;
    }

    function toothFall() public onlyChild{
        if(toothState == ToothState.Mouth){
            toothState = ToothState.WaitingFallenAproval;
        }else{
            revert();
        }
    }

    function motherAproves() public onlyMother{
        if(toothState == ToothState.WaitingFallenAproval){
            payToChild();
            toothState = ToothState.Fallen;
        }
    }

    function payToChild() public onlyChild{
        if(toothState == ToothState.WaitingFallenAproval && toothPaid == false){
            toothPaid = true;
        }else{
            revert();
        }
    }


     modifier onlyChild{
        if(msg.sender != child){
            revert();
        }else{
            _;
        }
    }

     modifier onlyMother{
        if(msg.sender != mother){
            revert();
        }else{
            _;
        }
    }

     modifier onlytoothFairy{
        if(msg.sender != toothFairy){
            revert();
        }else{
            _;
        }
    }
}
