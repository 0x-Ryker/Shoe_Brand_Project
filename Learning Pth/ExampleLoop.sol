// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Looping {
    uint256[] public data;
    uint256 public num;
    uint256 public count;

    // for loop
    function For_Loop() public returns(uint256[] memory) {
        for (uint256 i = 0; i < 8; i++) 
        {
            data.push(i);
        }
        return data;
    }

    // while loop
    function While_Loop() public returns(uint256[] memory) {
        while (num < 8) 
        {
            num++;
            data.push(num);
        }
        return data;
    }

    // do while loop
    function do_While() public returns(uint256[] memory) {
        do {
            count++;
            data.push(count);
        } 
        while (count < 8);
        return data;
    }
}