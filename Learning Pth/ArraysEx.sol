// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Array_ {
    uint[] public array;
    uint[5] public arr = [1, 2, 3, 4, 5];
    uint[] public arr2 = [10, 20, 30, 40, 50, 60, 70];

    function get() public view returns(uint[] memory) {
        return array;
    }

    function push(uint _in) public {
        array.push(_in);
    }

    function pop() public {
        array.pop();
    }

    function remove(uint _in) public {
        delete array[_in];
    }

    function length() public view returns(uint) {
        return array.length;
    }

    function updateArr() public {
        uint[] memory a = new uint[](5);
    }
}