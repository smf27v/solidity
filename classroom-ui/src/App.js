import React, { Component } from 'react';
// import logo from './logo.svg';
import './App.css';
import Web3 from 'web3';
import _ from 'lodash'

var web3Client = new Web3(new Web3.providers.HttpProvider('http://localhost:8550'))

var classroomContract = {
  abi: [{"constant":false,"inputs":[{"name":"_name","type":"bytes32"},{"name":"_surname","type":"bytes32"},{"name":"_age","type":"uint256"}],"name":"addStudent","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"classroom","outputs":[{"name":"name","type":"bytes32"},{"name":"surname","type":"bytes32"},{"name":"age","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getStudents","outputs":[{"name":"","type":"bytes32[]"},{"name":"","type":"bytes32[]"},{"name":"","type":"uint256[]"}],"payable":false,"type":"function"}],
  address: '0xcd555f48ce82b036957383a7863355eac7740949'
}

var classroomContractVar = new web3Client.eth.Contract(classroomContract.abi,classroomContract.address)

class App extends Component {

  constructor(props){
    super(props)
    this.state = {
      names: [],
      surnames: [],
      ages: []
    }
  }

  componentWillMount() {

    classroomContractVar.methods.getStudents().call().then(
      data => {
        this.setState({
          names: String(data[0]).split(','),
          surnames: String(data[1]).split(','),
          ages: String(data[2]).split(',')
         })
      }
    )
  }

  render() {

    var TableRows = []

    _.each(this.state.names, (value, index) =>{

      TableRows.push(
        <tr key={index}>
          <td>{web3Client.utils.hexToAscii(this.state.names[index])}</td>
          <td>{web3Client.utils.hexToAscii(this.state.surnames[index])}</td>
          <td>{this.state.ages[index]}</td>
        </tr>
        )
      })

    return (
      <div className="App">
        <div className="App-header">
        </div>
        <div className ="App-intro">
          <table>
            <thead>
              <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
              </tr>
            </thead>
            <tbody>
            {TableRows}
            </tbody>
          </table>
        </div>
      </div>
    );
  }
}

export default App;
