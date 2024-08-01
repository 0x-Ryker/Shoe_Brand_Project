// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Base1 {
    event Log(string text);

    function test_1() public virtual {
        emit Log("Base One, Test One");
    }

    function test_2() public virtual {
        emit Log("Base One, Test Two");
    }
}

contract Base2 is Base1 {
    function test_1()public virtual override {
        emit Log("Base Two, Test One");
        Base1.test_1();
    }

    function test_2() public virtual override {
        emit Log("Base Two, Test Two");
        super.test_2();
    }
}
