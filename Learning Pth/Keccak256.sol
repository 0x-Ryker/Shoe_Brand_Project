// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract HashFunction {
    
    function hash(string memory _text, uint _num, address _addr) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    // Example of hash collision
    // Hash collision can occur when you pass more than one dynamic data type to abi.encodePacked.
    // In such a case, you should use abi.encode instead.
    function collision(string memory _text, string memory _anotherText) public pure returns(bytes32) {
        // encodePacked(AAA, BBB) -> AAABBB
        // encodePacked(AA, ABBB) -> AAABBB
        return keccak256(abi.encodePacked(_text, _anotherText));
    }
}

contract GuessTheMagicWord {
    bytes32 public answer = 0x05416460deb76d57af601be17e777b93592d8d4d4a4096c57876a91c84f4a712;

    // Magic word is "Solidity"
    function guess(string memory _word) public view returns(bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}