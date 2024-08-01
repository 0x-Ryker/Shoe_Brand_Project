// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract CrowdFunding {

    address public owner;
    uint public deadline;
    uint public startDate;
    bool public isFunded;
    bool public isComplete;
    mapping (address => uint) public contributions;
    uint public totalContribution;
    uint public goal;

    constructor(uint _goal) {
        owner = msg.sender;
        startDate = block.timestamp;
        deadline = block.timestamp + 7 days;
        isComplete = false;
        isFunded = false;
        goal = _goal;
    }

    // add function for people to contribute
    function contribute() public payable {
        require(startDate < deadline, "deadline reached");
        require(!isComplete, "crowdfunding is over");

        uint value = msg.value;
        contributions[msg.sender] += value;
        totalContribution += value;

        if (totalContribution >= goal) {
            isFunded = true;
        } 
    }
    
    // add modifier only contract owner can withdraw
    modifier onlyOwner() {
        require(owner == msg.sender, "only owner can perform this action.");
        _;
    }

    // add function for owner to withdraw
    function withdraw() onlyOwner public {
        require(deadline > startDate, "deadline not over");
        require(!isComplete, "crowdfunding is over");

        isComplete = true;
        payable(owner).transfer(address(this).balance);
    }

    // add function for get refund
    function getRefund() public payable {
        require(startDate >= deadline, "can't get refund after deadline");
        require(!isFunded, "goal is reached");
        require(contributions[msg.sender] > 0, "no contribution to refund");

        uint value = contributions[msg.sender];
        contributions[msg.sender] = 0;
        totalContribution -= value;
        payable(msg.sender).transfer(value);
    }

    // return balance
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // extend deadline
    function extendDeadline() public {
        deadline += 2 days;
    }
    // add function when fundingGoal is reached, nobody can contribute again
    // add function to extend the deadline when the fundingGoal is not reached
    // add function so that nobody can contribute more or less than the max/min 
    // add function to return the account balance
}