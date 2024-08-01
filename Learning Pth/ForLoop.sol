// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ForLoop {
    uint256[] public arrays;

    function Loop1() public returns(uint256[] memory) {
        for (uint256 i; i < 5; i++) 
    {
        arrays.push(i);
    }
        return arrays;
    }
    
}