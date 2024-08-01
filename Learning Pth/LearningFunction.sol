// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract LearnFunc {
    string cars;
    uint public value;

    function get() public view returns(string memory) {
        return cars;
    }

    function carName(string memory _cars) public {
        cars = _cars;
    }

    //
    function localVar(uint _x, uint _y) public returns(uint) {
        uint newValue = _x + _y;
        value = newValue;
        return value;
    }
}