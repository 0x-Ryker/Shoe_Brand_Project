// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Crowd_Funding {
    address public receiver;
    uint public targetAmount;
    uint public totalContribution;
    uint public startDate;
    uint public endDate;
    string public crowdFundingName;
    mapping (address => uint) public funders;
    bool public hasFunded;
    bool public isComplete;

    event hasContributed(address contributor, uint amount);
    event isRefunded(address funder, uint amount);
    event hasWithdrawn(address receiver, uint amount);

    constructor(uint _targetAmount, string memory _crowdFundingName) {
        receiver = msg.sender;
        targetAmount = _targetAmount * 1 ether;
        startDate = block.timestamp;
        endDate = startDate + 7 days;
        crowdFundingName = _crowdFundingName;
        hasFunded = false;
        isComplete = false;
    }


    // allow funders to contribute to crowdfunding
    function contribute() public payable {
        require(startDate < endDate, "crowdfunding has ended");
        require(totalContribution < targetAmount, "the target amount has been reached");

        uint value = msg.value;
        funders[msg.sender] = value;
        totalContribution += value;
        hasFunded = true;

        emit hasContributed(msg.sender, msg.value);
    }

    // allow only receiver to call
    modifier onlyReceiver() {
        require(receiver == msg.sender, "only receiver can call this function");
        _;
    }

    // withdraw funds - only the receiver
    function withdraw() public onlyReceiver {
        require(totalContribution >= targetAmount, "the target amount has not been achieved");
        
        isComplete = true;
        uint value = address(this).balance;
        payable(receiver).transfer(value);

        emit hasWithdrawn(receiver, value);
    }


    // extend deadline
    function extendDeadline() public onlyReceiver{
        endDate += 3 days;
    }

    // get refund
    function getRefund() public {
        require(startDate < endDate, "can't get refund after crowdfunding has ended");
        require(funders[msg.sender] > 0, "you did not participate in the crowdfunding");

        uint amount = funders[msg.sender];
        funders[msg.sender] = 0;
        totalContribution -= amount;
        payable(msg.sender).transfer(amount);

        emit isRefunded(msg.sender, amount);
    }

    // return balance
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}