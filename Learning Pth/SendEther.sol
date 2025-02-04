// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ReceiveEther {
    /* 
    Which function is called, fallback() or receive()?

        send Ether
            |
        msg.data is empty?
            /    \
          yes    no
          /       \
receive() exists?  fallback()    
     */

    // Function to receive Ether. msg.data must be empty
    receive() external payable { }

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}


contract sendEther {
    
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
        // Not recommended
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure
        // Not recommended
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure
        // Recommended
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}