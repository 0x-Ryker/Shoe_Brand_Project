// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Payable_ {
    
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit_() payable public {
        
    }

    function notPayable_() public {
        
    }

    function withdraw() public {
        uint amount = address(this).balance;
        (bool success_, ) = owner.call{value: amount}("");
        require(success_, "Failed to send");
    }

    function transfer(address payable _to, uint _amount) public {
        (bool success_, ) = _to.call{value: _amount}("");
        require(success_, "Failed to send");
    }
}