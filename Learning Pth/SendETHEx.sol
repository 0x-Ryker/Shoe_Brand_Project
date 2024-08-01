// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Receive_ETH {

    event Log(string message, uint gas);

    receive() external payable { 
        emit Log("tx successful", gasleft());
    } // if msg.data is empty

    fallback() external payable {
        emit Log("tx successful", gasleft());
    } // if msg.data is not empty

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

}


contract Send_Eth {
     // send via call
     function call_(address payable _to) public payable {
        (bool success, bytes memory data) = _to.call{value: msg.value}("");
        require(success, "Failed to send");
     }
    // send via transfer
    function transfer_(address payable _to) public payable {
        _to.transfer(msg.value);
    }
    // send via send
    function send_(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send");
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}