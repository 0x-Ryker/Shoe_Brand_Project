// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PureKey {
    // uint256 num1 = 4;
    // uint256 num2 = 10;

    function getData() public pure returns(uint256, uint256) {
        uint256 num1 = 4;
    uint256 num2 = 10;
    return (num1 *2, num2 + 7);
    }
}