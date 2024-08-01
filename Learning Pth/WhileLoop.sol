// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract WhileLoopp {
    
    // while (condition) {
    //     statement or block
    // }
    uint256[] public cars;

    uint256 public num;

    uint public number = 0;

    function viewLoop() public returns(uint[] memory) {
        while (num < 5) 
        {
            num++;
            cars.push(num);
        }
        return cars;
    }

    function numberLoop() public returns(uint256) {
        while (number < 7) 
        {
            number++;
        }
        return number;
    }
}