// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RevertErr {
    function checkThis(uint _data1, uint _data2) public pure returns(string memory, uint total) {
        total = _data1 + _data2;

        if (total > 50 || total <= 100) {
            revert("revert this message!");
        } else {
            return ("show this message!", total);
        }
    }
}