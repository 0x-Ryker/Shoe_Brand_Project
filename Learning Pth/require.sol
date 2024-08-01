// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RequireErr {
    function checkValue(uint _value) public pure returns(string memory){
        require(_value <= 100, "out of scale!");

        return "the value is equal to or less than 100";
    }

    function checkData(uint _data) public pure returns(bool) {
        require(_data % 2 != 0);

        return true;
    }
}