// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract IfElseState {

    string public message;
    string public announce;

    function getR(uint256 _number) public returns(string memory) {
        if (_number == 10) {
            return message = "the number is ten";
        } else if (_number == 20) {
            return message = "the number is twenty";
        } else {
            return message = "the number is neither ten nor twenty";
        }
    }

    function ternaryOp(uint256 _info) public returns(string memory) {
        return _info == 10 ? announce = "the number is ten" : announce = "is not ten";
    }
}