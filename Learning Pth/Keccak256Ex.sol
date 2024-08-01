// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract HashFunc {
    
    function check(string memory _name, uint _price, address _owner) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_name, _price, _owner));
    }

    // hash collision
    function HashCollision(uint _num1, uint _num2) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_num1, _num2));
    }
}

// Check match
contract GuessWord {
    bytes32 public question = 0x05416460deb76d57af601be17e777b93592d8d4d4a4096c57876a91c84f4a712;

    function getHash(string memory _text) public view returns(bool) {
        return keccak256(abi.encodePacked(_text)) == question;
    }
}