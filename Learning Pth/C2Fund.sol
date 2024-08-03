// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract C_F {
    address public owner;
    uint public goal;
    uint public expiration;
    uint public totalContribution;
    string public projectTitle;
    bool public hasFunded;
    bool public isComplete;
    mapping (address => uint) public participants;

    event hasContributed(address indexed contributor, uint amount, bool indexed isAParticipant);
    event hasWithdrawn(address indexed withdrawer, uint indexed value, bool indexed isSuccess);
    event hasRefunded(address indexed refundee, uint indexed value, bool indexed isSuccess);

    constructor(uint _goal, string memory _projectTitle) {
        owner = msg.sender;
        goal = _goal * 1 ether;
        expiration = block.timestamp + 7 days;
        projectTitle = _projectTitle;
        hasFunded = false;
        isComplete = false;
    }

    function contribute() public payable {
        uint contributedAmount = msg.value;
        participants[msg.sender] = contributedAmount;
        require(block.timestamp < expiration, "the funding has elapsed.");
        require(totalContribution < goal, "can't contribute: the goal has been reached.");
        require(participants[msg.sender] > 0 ether, "enter an amount bigger than zero.");
        totalContribution += contributedAmount;
        hasFunded = true;
        if (totalContribution >= goal) {
            isComplete = true;
        }
        emit hasContributed(msg.sender, contributedAmount, true);
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "only owner can perform this action.");
        _;
    }

    function withdraw() public onlyOwner {
        require(totalContribution >= goal, "unable to withdraw: goal has not been met.");
        uint amountToWithdraw = address(this).balance;
        (bool success, ) = (owner).call{value: amountToWithdraw}("");
        require(success, "can't withdraw.");
        amountToWithdraw = 0;
        emit hasWithdrawn(owner, amountToWithdraw, true);
    }

    function reFund() public {
        require(totalContribution < goal, "can't withdraw after goal is met.");
        require(block.timestamp < expiration, "refund is only allowed when the project is active.");
        require(participants[msg.sender] > 0, " you've gotten refund or did not participate.");
        uint amountToReceive = participants[msg.sender];
        totalContribution -= amountToReceive;
        participants[msg.sender] = 0;
        (bool success, ) = (msg.sender).call{value: amountToReceive}("data");
        require(success, "can't get refund.");
        emit hasRefunded(msg.sender, amountToReceive, true);
    }

    function extendExpiration() public {
        expiration += 2 days;
    }

    function viewBalance() public view returns(uint) {
        uint accountBalance = address(this).balance;
        return accountBalance;
    }
}