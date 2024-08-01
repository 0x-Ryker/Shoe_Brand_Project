// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Toy_Company {

    struct Toy{
        string name;
        string desc;
        uint price;
        address owner;
        bool forSale;
    }

    mapping(uint => Toy) public toys;

    uint[] public toyList;

    event ToySold(uint toyId);

    function list_Toy(string memory _name, string memory _desc, uint _price, uint _toyId) public {
        Toy memory toy = Toy({
            name: _name,
            desc: _desc,
            price: _price,
            owner: msg.sender,
            forSale: true
        });

        toys[_toyId] = toy;
        toyList.push(_toyId);
    }

    function buyToy(uint _toyId) public payable {
        Toy storage toy = toys[_toyId];
        require(toy.price <= msg.value, "Enter a higher amount");
        require(toy.forSale, "not for sale");

        toy.owner = msg.sender;
        toy.forSale = false;

        // payable (toy.owner).transfer(toy.price);
        (bool success, ) = (toy.owner).call{value: toy.price}("");
        require(success, "tx failed");

        emit ToySold(_toyId);
    }
}