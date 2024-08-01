// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Receiving {
    event Received_(address sender, uint amount, string text);
    fallback() external payable { 
        emit Received_(msg.sender, msg.value, "Fallback is called/triggered");
    }

    receive() external payable { }

    function check(string memory _name, uint _size) public payable returns(uint) {
        emit Received_(msg.sender, msg.value, _name);
        return _size + 10;
    }
}

contract Calling {
    event Feedback(bool success, bytes data);

    function testCheck(address payable _to) public payable {
        (bool success, bytes memory data) = _to.call{value: msg.value, gas: 5000}(
            abi.encodeWithSignature("check(string,uint256)", "check is called", 68000)
        );
        emit Feedback(success, data);
    }

    function testDoesNotExist(address _to) public payable {
        (bool success, bytes memory data) = _to.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist()")
        );
        emit Feedback(success, data);
    }
}