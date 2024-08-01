// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Base1 {
    function func() public pure virtual returns(string memory) {
        return "BASE ONE";
    }
}

contract Base2 {
    function func() public pure virtual returns(string memory) {
        return "BASE TWO";
    }
}

contract Base3 is Base1 {
    function func() public pure virtual override returns(string memory) {
        return "BASE THREE";
    }
}

contract Base4 is Base1,Base2 {
    function func() public pure virtual override(Base1,Base2) returns(string memory) {
        return super.func();
    }
}

contract Base5 is Base3,Base4 {
    function func() public pure override(Base3,Base4) returns(string memory) {
        return super.func();
    }
}