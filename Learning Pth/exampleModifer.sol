// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ModifierFunc {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(owner == msg.sender, "not the owner");
        _;
    }

    modifier validateInfo(address _address) {
        require(_address != address(0), "not a valid address");
        _;
    }

    function changeOwner(address _addrs) public onlyOwner validateInfo(_addrs) {
        owner = _addrs;
    }
}