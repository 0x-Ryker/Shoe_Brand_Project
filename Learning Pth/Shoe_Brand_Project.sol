// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Web3_Shoes {
    
    struct Shoe{
        string brandName;
        string shoeType;
        string description;
        uint price;
        bool forSale;
        string size;
        address owner;
    }

    mapping (uint => Shoe) public shoes;
    uint[] public shoe_list;
    event shoeSold(uint shoeId, string text);

    function listShoes(string memory _brandName, string memory _shoeType, string memory _description, 
    string memory _size, uint _price, uint _shoeId) public {
        Shoe memory shoe = Shoe({
            brandName: _brandName,
            shoeType: _shoeType,
            description: _description,
            price: _price,
            forSale: true,
            size: _size,
            owner: msg.sender
        });

        shoes[_shoeId] = shoe;
        shoe_list.push(_shoeId);
    }

    function buyShoe(uint _shoeId) public payable {
        Shoe storage shoe = shoes[_shoeId];
        require(msg.value == shoe.price, "insufficient funds");
        require(shoe.forSale, "shoe is not available");

        shoe.owner = msg.sender;
        shoe.forSale = false;

        (bool success, ) = (shoe.owner).call{value: shoe.price}("");
        require(success, "transaction failed");

        //payable(shoe.owner).transfer(shoe.price);

        emit shoeSold(_shoeId, "shoe sold");
    }
}