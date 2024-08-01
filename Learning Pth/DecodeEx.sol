// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EncodeDecode {
    
    function Encode(address addr, uint amount) external pure returns(bytes memory) {
        return abi.encode(addr, amount);
    }

    function Decode(bytes calldata data) external pure returns(address addr, uint amount) {
        (addr, amount) = abi.decode(data, (address, uint));
    }
}