// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MappingKeyword {
    // Mappin from address to uint
    mapping (address => uint) public myMap;

    function get(address _addr) public view returns(uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // Reset the value to the default
        delete myMap[_addr];
    }
}

// To add a key-value pair to a mapping, 
// we use the key as the index of the mapping and assign a value to it.

contract NestedMapping {
    // mapping from address to another mapping
    mapping (address => mapping (uint => bool)) public nested;

    function get(address _addr, uint i) public view returns(bool) {
        // you can get values from the nested mapping even when it is not initilaized
        return nested[_addr][i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}