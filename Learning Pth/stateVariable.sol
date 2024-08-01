// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract StateVar {
    string public myState;
    uint256 public myNum;

    string public myStr;
    uint256 public myValue;

    string public name = "Josh";
    uint public value = 10;
    uint256[] public array;
    bytes32 public myBytes = "BTC Dashboard!!!";
    bytes32 public myByte1;

    constructor(string memory _myState, uint256 _myNum) {
        myState = _myState;
        myNum = _myNum;
    }

    function update(string memory _text, uint256 _num) public {
        myStr = _text;
        myValue = _num;
    }
    
}