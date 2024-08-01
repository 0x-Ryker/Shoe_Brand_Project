// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Enum {
    enum Status {Active, Inactive, Unknown}

    // uint public name;
    Status public status;

    function set(Status _status) public {
        status = _status;
    }

    function get() public view returns(Status) {
        return status;
    }

    function unknown() public {
        status = Status.Unknown;
    }

    function reset() public {
        delete status;
    }
}