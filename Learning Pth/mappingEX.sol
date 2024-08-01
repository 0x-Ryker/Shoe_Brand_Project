// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Mappin {
    // mapping (key => value)
    mapping (address => uint) public oneMap;

    function set(address _addr, uint _i) public {
        oneMap[_addr] = _i;
    }

    function get(address _addr) public view returns(uint) {
        return oneMap[_addr];
    }

    function remove(address _addr) public {
        delete oneMap[_addr];
    }
}

contract Nested_Mapping {
    // mapping (key => mapping (key => value))
    mapping (address => mapping (uint => bool)) public nestedMap;

    function set(address _addr1, uint _in, bool _bool) public {
        nestedMap[_addr1][_in] = _bool;
    }

    function get(address _addr1, uint _in) public view returns(bool) {
        return nestedMap[_addr1][_in];
    }

    function remove(address _addr1, uint _in) public {
        delete nestedMap[_addr1][_in];
    }
}