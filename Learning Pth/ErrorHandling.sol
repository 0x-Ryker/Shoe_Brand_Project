// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ErrorHandling {
    uint public data;

    function requiretErr(uint _number1, uint _number2) public pure returns(string memory, uint) {
        uint total = _number1 + _number2;
        require(total >= 255, "it's less than unit256");
        return ("the number is uint256", total);
    }

    function assertErr(uint _numb1, uint _numb2) public pure returns(bool) {
        uint summ = _numb1 + _numb2;
        assert(summ <= 300);
        return true;
    }

    function revertErr(uint _num1, uint _num2) public pure returns(string memory) {
        uint add = _num1 + _num2;
        if (add < 100) {
            revert("number is too small");
        } else {
            return "number is large";
        }
    }
}