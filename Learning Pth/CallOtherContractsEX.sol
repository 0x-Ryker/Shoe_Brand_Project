// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Callee {
    uint public num;
    uint public value;

    function setNum(uint _num) public returns(uint) {
        num = _num;
        return num;
    }

    function setNumAndSendEther(uint _num) public payable returns(uint, uint) {
        num = _num;
        value = msg.value;
        return (num, value);
    }
}


contract Caller {
    function setNum(Callee _callee, uint _num) public {
        _callee.setNum(_num);
    }

    function setNumAndSendEther(Callee _callee, uint _num) public payable  {
        _callee.setNumAndSendEther{value: msg.value}(_num);
    }

    function setNumFromAddress(address _addr, uint _num) public {
        Callee callee = Callee(_addr);
        callee.setNum(_num);
    }
}