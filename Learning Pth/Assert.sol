// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract AssertErr {
    bool public output;

    function checkOutput(uint256 _value1, uint256 _value2) public {
        uint256 sum = _value1 + _value2;
        assert(sum >= 255);
        output = true;
    }

    function viewRes() public view returns(string memory) {
        if (output == true) {
            return "more than 255";
        } else {
            return "less than 255";
        }
    }
}