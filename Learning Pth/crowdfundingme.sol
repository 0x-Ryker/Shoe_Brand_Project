// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdFundingProject {
    uint public targetFunds; // target funds = 35 ether
    address public beneficiary;
    uint public startDate;
    uint public deadline;
    string public crowdFundingTitle;
    uint public totalContribution;
    mapping (address => uint) public contributors;
    uint public maxPrice; // max price per contributor(5 ether)
    uint public minPrice; // min price per contributor(2 ether)

    constructor(uint _targetFunds, string memory _crowdFundingTitle, uint _maxPrice, uint _minPrice) {
        targetFunds = _targetFunds * 1 ether; 
        beneficiary = msg.sender;
        startDate = block.timestamp;
        deadline = startDate + 7 days;
        crowdFundingTitle = _crowdFundingTitle;
        maxPrice = _maxPrice * 1 ether;
        minPrice = _minPrice * 1 ether;
    }

    // Helper's function
    function isSuccess() public view returns(bool) {
        if (startDate < deadline) {
            return true;
        } else {
            return false;
        }
    }

    function maxNminPrice() public payable returns(bool) {
       // uint sentValue = contributors[msg.sender];

        // (sentValue > maxPrice && sentValue < minPrice)

        uint sentValue = msg.value;
        
        if (sentValue > maxPrice && sentValue < minPrice) {
            return false;
        } else {
            return true;
        }
    }

    function isTargetFundAchieved() public view returns(bool) {
        if (totalContribution >= targetFunds) {
            return true;
        } else {
            return false;
        }
    }

    // contribute function
    function contribute() public payable {
        require(isSuccess() == true && maxNminPrice() == true && isTargetFundAchieved() == false, "can't contribute");
        uint fundingAmount = msg.value;
        contributors[msg.sender] += fundingAmount;
        totalContribution += fundingAmount;
    }

    // withdraw function - only owner
    modifier onlyOwner() {
        require(beneficiary == msg.sender, "only beneficiary can call this function");
        _;
    }

    function withdraw() public onlyOwner {
        require(isSuccess() == false && isTargetFundAchieved() == true, "can't withdraw");
        uint amountToWithdraw = address(this).balance;
        (bool success, ) = (beneficiary).call{value: amountToWithdraw}("");
        require(success, "unable to withdraw");
        contributors[msg.sender] = 0;
    }

    // get refund
    function getRefund() public {
        require(isSuccess() == true && isTargetFundAchieved() == true, "you can't get a refund");
        require(contributors[msg.sender] > 0, "you did not contribute to this crowdfunding");
        
        uint contributedAmount = contributors[msg.sender];
        contributors[msg.sender] = 0;
        totalContribution -= contributedAmount;
        (bool success, ) = (msg.sender).call{value: contributedAmount}("");
        require(success, "can't get refund");
    }

    // check balance
    function checkBalance() public view returns(uint) {
        return address(this).balance;
    }

    // extend deadline
    function extendDeadline() public onlyOwner {
        deadline += 3 days;
    }
}