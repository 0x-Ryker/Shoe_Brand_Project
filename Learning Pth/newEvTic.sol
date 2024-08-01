// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EventTic {
    uint public numOfTicket;
    uint public price;
    uint public totalAmount;
    uint public startAt;
    uint public endAt;
    uint public timeRange;
    string public message = "BUY YOUR TICKET";

    constructor(uint _price) {
        price = _price;
        startAt = block.timestamp;
        endAt = block.timestamp + 7 days;
        timeRange = (endAt - startAt) / 60 / 60 / 24;
    }

    function buyTicket() public returns(uint _ticketId){
        numOfTicket++;
        totalAmount += price;
        _ticketId = numOfTicket;
    }
}