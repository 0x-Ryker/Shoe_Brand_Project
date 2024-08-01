// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract NFTCount {
    uint256 public numberOfNFT;

    //view total NFT
    function checkTotalNFT() public view returns(uint256) {
        return numberOfNFT;
    }

    function addNFT() public {
        numberOfNFT += 1;
    }

    function reduceNFT() public {
        numberOfNFT -= 1;
    }
}