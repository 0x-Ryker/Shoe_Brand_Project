// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract LocalVar {

    uint256 public myState;

    function localVar(uint256 _x, uint256 _y) public returns(uint256, uint256, address){
        uint256 i = _x + _y;
        myState = i;
        i += 85;
        address myAddr = address(1);
        return (myState, i, myAddr);
    }
}