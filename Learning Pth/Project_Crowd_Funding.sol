// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract CrowdFunding {
    address public creator;
    uint public goal;
    uint public deadline;
    mapping (address => uint) public contributions;
    uint public totalContributions;
    bool public isFunded;
    bool isCompleted;

    event GoalReached(uint totalContributions);
    event FundTransfer(address backer, uint amount);
    event DeadlineReached(uint totalContributions);

    constructor(uint fundingGoalInEther, uint durationInMinutes) {
        creator = msg.sender;
        goal = fundingGoalInEther * 1 ether;
        deadline = block.timestamp + durationInMinutes * 1 minutes;
        isFunded = false;
        isCompleted = false;
    }

    modifier onlyCreator(){
        require(msg.sender == creator, "Only the creator can call this function");
        _;
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Funding period has ended");
        require(!isCompleted, "Crowdfunding is already completed");

        uint contribution = msg.value;
        contributions[msg.sender] += contribution;
        totalContributions += contribution;

        if (totalContributions >= goal) {
            isFunded = true;
            emit GoalReached(totalContributions);
        }

        emit FundTransfer(msg.sender, contribution);
    }

    function withdrawFunds() public onlyCreator {
        require(isFunded, "Goal has not been reached");
        require(!isCompleted, "Crowdfunding is already completed");

        isCompleted = true;
        payable (creator).transfer(address(this).balance);
    }

    function getRefund() public {
        require(block.timestamp >= deadline, "Funding period has not ended");
        require(!isFunded, "Goal has been reached");
        require(contributions[msg.sender] > 0, "No contribution to refund");

        uint contribution = contributions[msg.sender];
        contributions[msg.sender] = 0;
        totalContributions -= contribution;
        payable(msg.sender).transfer(contribution);
        emit FundTransfer(msg.sender, contribution);
    }

    function getCurrentBalance() public view returns(uint) {
        return address(this).balance;
    }

    function extendDeadline(uint durationInMinutes) public onlyCreator {
        deadline += durationInMinutes + 1 minutes;
    }
}