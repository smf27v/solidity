pragma solidity ^0.4.0;

contract Seminario {
    struct Person{
        string name;
        uint age;
        bool active;
    }

    uint fee;
    uint loss = 80;

    mapping(address=>Person) public attendants;

    function Register(string _name, uint _age) public payable{
        if(msg.value == fee){
            attendants[msg.sender] = Person({
                name: _name,
                age: _age,
                active: true
            });
        }else{
            revert();
        }}

        function setRegistrationFee(uint256 _fee) public{
            fee = _fee;
        }

        function cancelRegistration() public{
            attendants[msg.sender].active = false;
            msg.sender.transfer((fee*loss)/100);
        }
    }
