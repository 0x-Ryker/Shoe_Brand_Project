// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EventTicket {
    uint public numberOfTicket;
    uint public totalAmount;
    uint public price;
    uint public startAt;
    uint public endAt;
    uint public timeRange;

    constructor(uint _price) {
        price = _price;
        startAt = block.timestamp;
        endAt = block.timestamp + 7 days;
        timeRange = (endAt - startAt) / 60 /60 /24;
    }

    function buyTicket(uint _value1) public returns(uint ticketId) {
        numberOfTicket++;
        totalAmount += _value1;
        ticketId = numberOfTicket;
    }

    function getTotalAmount() public view returns(uint) {
        return totalAmount;
    }
}