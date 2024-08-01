// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Base {
    
    uint public publicVar = 1;
    uint private privateVar = 2;
    uint internal internalVar = 3;
    // uint external externalVar = 4; can't be defined as a state variable

    // public is accessible in the parent contract and other contracts
    // private is accessible by the parent contract only
    // internal can be accessed by the parent contract and derived contract
    // external is accessible by an external contract only

    function externalFunc() external pure virtual returns(uint) {
        return 12;
    }
}

contract Child is Base {
    
    function test1() public view returns(uint) {
        uint sum = publicVar + internalVar;
        return sum;
    }
    
}


