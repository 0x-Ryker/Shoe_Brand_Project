// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ArrayRemoveByShifting {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint i = _index; i < arr.length - 1; i++) 
        {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [10, 20, 30, 40, 50];
        remove(4);
        // [1, 2, 4, 5]
        assert(arr[0] == 10);
        assert(arr[1] == 20);
        assert(arr[2] == 30);
        assert(arr[3] == 40);
        assert(arr.length == 4);

        // arr = [1];
        // remove(0);
        // // []
        // assert(arr.length == 0);
    }
}