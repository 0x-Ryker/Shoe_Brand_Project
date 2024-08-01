// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract GlobalVar {
    
    address public owner;
    address public Myblockhash;
    uint256 public difficulty;
    uint256 public gasLimit;
    uint256 public number;
    uint256 public timestamp;
    uint256 public value;
    uint256 public nowOn;
    address public origin;
    uint256 public gasPrice;
    bytes public callData;
    bytes4 public firstFour;

    constructor() {
        owner = msg.sender;

        Myblockhash = block.coinbase;
        difficulty = block.difficulty;
        gasLimit = block.gaslimit;
        number = block.number;
        timestamp = block.timestamp;
        gasPrice = tx.gasprice;
        origin = tx.origin;
        callData = msg.data;
        firstFour = msg.sig;
        //value = msg.value;
    }
}