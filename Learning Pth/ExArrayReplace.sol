// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ReplaceArray {
    uint[] public array;

    function remove(uint _index) public {
        require(_index < array.length, "index out of bound");

        for (uint i = _index; i < array.length - 1; i++) 
        {
            array[i] = array[i + 1];
        }
        array.pop();
    }

    function test_() external {
        array = [15, 35, 85, 95, 105, 205];
        remove(3);
        assert(array[0] == 15);
        assert(array[1] == 35);
        assert(array[2] == 85);
        assert(array[3] == 105);
        assert(array[4] == 205);
        assert(array.length == 5);

        array = [1];
        remove(0);
        
        assert(array.length == 0);
    }
}