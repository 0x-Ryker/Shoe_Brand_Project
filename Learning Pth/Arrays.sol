// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Arrays {
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // Fixed sized array, all elements initialized to 0
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns(uint) {
        return arr[i];
    }

    // Solidity can return the entire array, but this function must 
    // be avoided for arrays that can grow indefintely in length
    function getArr() public view returns(uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns(uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // Delete does not change the array length. It resets the value
        // at index to it's default value.
        delete arr[index];
    }

    function examples() external {
        // create array in memory, only fixed size can be created
        uint[] memory a = new uint[](5);
    }
}