// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ArrayReplaceFromEnd {
    uint[] public arr;

    function remove(uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4, 5, 6];

        remove(1);
        //[1, 4, 3]
        assert(arr.length == 5);
        assert(arr[0] == 1);
        assert(arr[1] == 6);
        assert(arr[2] ==3);
        assert(arr[3] ==4);
        assert(arr[4] ==5);

        // remove(2);
        // // [1, 4]
        // assert(arr.length == 2);
        // assert(arr[0] == 1);
        // assert(arr[1] == 4);
    }
}