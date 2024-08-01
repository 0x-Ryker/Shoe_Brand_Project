// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyFirstContract {

    // string public hey = "Trump";
    // uint256 public num = 2024;

    string public name;
    uint256 public number;

    // constructor(string memory _name, uint _number) {
    //     name = _name;
    //     number = _number;
    // }

    function nameNum(string memory _name, uint _number) public {
        name = _name;
        number = _number;
    }
    
}