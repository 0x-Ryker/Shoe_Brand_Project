// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IERC20 {
    function transfer(address, uint) external;
}

contract Coin {
    function transfer(address, uint) external {
        
    }
}

contract AbiEncode_ {
    function test(address _to, bytes calldata data) external {
        (bool success, ) = _to.call(data);
        require(success, "transaction failed");
    }

    function AbiEncodeWithSignature(address _to, uint _amount) external pure returns(bytes memory) {
        return abi.encodeWithSignature("transfer(address,uint256)", _to, _amount);
    }

    function AbiEncodeWithSelector(address _to, uint _amount) external pure returns(bytes memory) {
        return abi.encodeWithSelector(IERC20.transfer.selector, _to, _amount);
    }

    function AbiEncodeWithCall(address _to, uint _amount) external pure returns(bytes memory) {
        return abi.encodeCall(IERC20.transfer, (_to, _amount));
    }
}