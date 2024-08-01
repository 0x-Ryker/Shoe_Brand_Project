// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Base contract
contract Riv {
    string public school;

    constructor(string memory _school) {
        school = _school;
    }
}

contract Bay {
    string public governor;

    constructor(string memory _governor) {
        governor = _governor;
    }
}

contract Awk is Riv("RSUST"), Bay("Timipre Sylva") {
    
}

contract Crs is Riv, Bay {
    constructor(string memory _school, string memory _governor) Riv(_school) Bay(_governor) {
        
    }
}

contract Edo is Riv, Bay {
    constructor() Riv("Uniport") Bay("Niger Delta Uni") {
        
    }
}