// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}


interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}


contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();
    }
}

// Uniswap example
interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns(address pair);
}

interface UniswapV2Pair {
    function getReserves() external view returns(uint112 reserve0, uint112 reserve1, uint32 blockTimeStampLast);
}

contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f ;
    address private dai = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private weth = 0xf164fC0Ec4E93095b804a4795bBe1e041497b92a;

    function getTokenReserves() external view returns(uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1, ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
}