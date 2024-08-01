// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract A {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "not a valid address");
        assert(_owner != address(1));
        owner = _owner;
    }

    function myFunction(uint _num) public pure returns(string memory) {
        require(_num != 0, "number must not be zero");
        return "Number is correct";
    }
}

contract B {
    event Log(string text);
    event LogByte(bytes data);

    A public a;

    constructor() {
        a = new A(msg.sender);
    }

    function tryAndCatchNum(uint _number) public {
        try a.myFunction(_number) returns(string memory result) {
            emit Log(result);
        } catch {
            emit Log("couldn't fetch external call data");
        }
    }

    function tryAndCatchAddress(address _addr) public {
        try new A(_addr) returns(A) {
            emit Log("the address is valid");
        } catch Error (string memory reason) {
            emit Log(reason);
        } catch (bytes memory reason) {
            emit LogByte(reason);
        }
    }
}