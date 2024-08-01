// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract CrowdFudning_ {
    address public owner; // contract creator
    //address public contributors; // contributors for the crowdfunding
    uint public goal; // the crowdfunding target amount
    uint public deadline; // date when the crowdfunding will end
    string public name; // crowdfunding name
    uint public totalContribution;
    mapping (address => uint) public contributions;
    bool public fundsWithdrawn;
    //uint public startDate;

    constructor(uint _goal, string memory _name) {
        owner = msg.sender;
        goal = _goal;
        name = _name;
       // startDate = block.timestamp;
        deadline = block.timestamp + 7 days;
        fundsWithdrawn = false;
    }

    function isFundingSuccess() public payable returns(bool) {
        uint value = msg.value;
        if (value > 3 && value < 1) {
            return  false;
        } else {
            return true;
        }
    }

    // create a function to let people contribute to the crowdfunding
    function contribute() public payable{
        // contributors cannot contribute after the deadline
        require(block.timestamp < deadline, "deadline has elasped");
        // contributors cannot contribute less than 1 or more than 3 eth
        require(isFundingSuccess() == true, "enter and amount between 1 and 3 ether");
        // contributors cannot contribute twice
        // if the goal is reached, contributors cannot contribute
        require(totalContribution < goal, "goal is reached");

        uint value = msg.value;
        contributions[msg.sender] += value;
        totalContribution += value;


        // deduct contributors amount from their wallet and show their contribution
    }
    // create a function to allow only the owner of the contract to withdraw all the funds
    modifier onlyOwner() {
        require(owner == msg.sender, "only owner can perform this action.");
        _;
    }

    function withdraw() public {
        uint amount = address(this).balance;
        (bool success, ) = owner.call{value: amount}("");
        require(success, "failed to withdraw");
        fundsWithdrawn = true;
        contributions[msg.sender] = 0;
    }
    // create a function for contributors to get refund before the deadline

    function getRefund() public {
        require(block.timestamp < deadline, "deadline has elasped");
        require(contributions[msg.sender] != 0, "you did not contribute to this crowdfunding");
        
        uint contribution = contributions[msg.sender];
        contributions[msg.sender] = 0;
        totalContribution -= contribution;
        //payable(msg.sender).transfer(contribution);

        (bool success, ) = (msg.sender).call{value: contribution}("");
        require(success, "can't get refund");
    }

    // create a function to return the account balance of the contract
    function accountBalance() public view returns(uint){
        return address(this).balance;
    }
}