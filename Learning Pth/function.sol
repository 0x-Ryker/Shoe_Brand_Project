// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract LearnFunction {

    uint public hey;

    // function getInfo() public view returns(uint) {
    //     return hey;
    // }

    // function updateData(uint _hey) public {
    //     hey = _hey;
    // }

    function get(uint256 _a, uint256 _b) public returns(uint) {
        uint256 newNumber = _a + _b;
        hey = newNumber;
        return hey;
    }
    
}