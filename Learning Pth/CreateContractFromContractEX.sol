// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Creator {
    address public owner;
    address public cityAddr;
    string public city;

    constructor(address _owner, string memory _city) payable {
        owner = _owner;
        cityAddr = address(this);
        city = _city;
    }
}

contract CityCreation {
    Creator[] public cities;

    function create(address _owner, string memory _city) public {
        Creator creator = new Creator(_owner, _city);
        cities.push(creator);
    }

    function createAndSendEther(address _owner, string memory _city) public payable {
        Creator creator = (new Creator){value: msg.value}(_owner, _city);
        cities.push(creator);
    }

    function getCities(uint _index) public view returns(address owner, address cityAddr, string memory city, uint balance) {
        Creator creator =  cities[_index];
        return (creator.owner(), creator.cityAddr(), creator.city(), address(creator).balance);
    }
}