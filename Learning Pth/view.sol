// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ViewKey {

    uint256 BMW = 10;
    uint256 Porsche = 12;
    uint256 Audi = 14;
    uint RollsRoyce = 30;

    function getResult() public view returns(uint256, uint256, uint256, uint256){
        return (BMW, Porsche, Audi, RollsRoyce);
    }

    function gR() public view returns(uint256 multiply, uint256 addition) {
        multiply = BMW * Porsche;
        addition = Audi + RollsRoyce;
    }

    function gRes() public view returns(uint256, uint256) {
        uint256 product = BMW * Porsche;
        uint256 add = Audi + RollsRoyce;
        return (product, add);
    }

    function modState() public returns(uint256, uint256, uint256, uint256) {
         BMW += 55;
         Porsche += 11;
         Audi += 33;
         RollsRoyce +=7;
        return (BMW, Porsche, Audi, RollsRoyce);
    }

}