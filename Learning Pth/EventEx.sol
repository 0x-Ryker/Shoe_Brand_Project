// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Event_ {
    
    event Log(address indexed sender, address indexed recipient, uint amount, string message);

    event NewLog();

    function test_() public {
        emit Log(msg.sender, address(0), 2000, "BTC");

        emit NewLog();
    }
}