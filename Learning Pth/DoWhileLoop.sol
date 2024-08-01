// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract DoWhileLoopp {

    uint256[] public data;
    uint public j;

    function doWLoop() public returns(uint256[] memory) {
        do {
    j++;
    data.push(j);
   } 
   while (j < 7); 
        return  data;
    }
   
}