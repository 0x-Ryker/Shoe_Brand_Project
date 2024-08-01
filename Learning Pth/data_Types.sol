// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract DataTypes {
    
    // bool public bool1;
    // bool public bool2 = true;
    // string public name;
    // uint public uint1;
    // address public addr;
    // bytes1 public b1;

    // string public cars;
    // uint public number;
    // address public owner;

    // string public pets;
    // uint public class;
    // address public ownernership;

    // constructor(string memory _cars, uint _number) {
    //     cars = _cars;
    //     number = _number;
    //     owner = msg.sender;
    // }

    // function setPet(string memory _pets, uint _class) public {
    //     pets = _pets;
    //     class = _class;
    //     ownernership = msg.sender;
    // }

    uint public numberOfNFT;
    // view NFT
    function checkNFT() view public returns(uint) {
        return numberOfNFT;
    }
    // increment NFT
    function incrementNFT() public {
        numberOfNFT += 1; //numberOfNFT = numberOfNFT + 1
    }
    // decrement NFT
    function decrementNFT() public {
        numberOfNFT -= 1; //numberOfNFT = numberOfNFT - 1
    }
}