pragma solidity ^0.4.13;


contract Classroom {
  Student[] public classroom;

  struct Student {
    bytes32 name;
    bytes32 surname;
    uint age;

  }

  function addStudent(bytes32 _name, bytes32 _surname, uint _age) public returns (bool){

    Student memory newStudent;
    newStudent.name = _name;
    newStudent.surname = _surname;
    newStudent.age = _age;

    classroom.push(newStudent);
  }

  function getStudents() public constant returns(bytes32[], bytes32[], uint[]){

    uint length = classroom.length;

    bytes32[] memory names = new bytes32[](length);
    bytes32[] memory surnames = new bytes32[](length);
    uint[] memory ages = new uint[](length);

    for(uint i = 0; i < length; i++) {
      Student memory currentStudent;
       currentStudent = classroom[i];

       names[i] = currentStudent.name;
       surnames[i] = currentStudent.surname;
       ages[i] = currentStudent.age;
    }
    return (names, surnames, ages);
  }
}
