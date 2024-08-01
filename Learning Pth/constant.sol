// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ConstantKey {

    // transaction cost	128609 gas
    // execution cost	70063 gas 
    // address public myAdd = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // transaction cost	102757 gas
    // execution cost	45697 gas
    address public my_Addrs = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // transaction cost	116397 gas 
    // execution cost	58309 gas
    // function getConstant() public pure returns(address) {
    //     return my_Addrs;
    // }

    // transaction cost	148521 gas 
    // execution cost	88681 gas
    function getConstant() public view returns(address) {
        return my_Addrs;
    }
}