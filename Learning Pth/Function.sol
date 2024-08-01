// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Function {
    
    // return value without a name
    function returnMany() public pure returns(uint, bool, uint) {
        return (1, true, 2);
    }

    // return values can be named
    function named() public pure returns(uint x, bool b, uint y) {
        return (1, true, 2);
    }

    // retun values can be assigned to their name. the return statment can be omitted
    function assigned() public pure returns(uint x, bool b, uint y){
        x = 1;
        b = true;
        y = 2;
    }

    // use destructuring assignment when calling another
    function destructuringAssignment() public pure returns (uint, bool, uint, uint, uint){
        (uint i, bool b, uint j) = returnMany();

        // values can be left out
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // cannot use map for either input or output
    function arrayInput(uint[] memory _arr) public {
        
    }

    // can use array for output
    uint[] public arr;

    function arrayOutput() public view returns(uint[] memory) {
        return arr;
    }

}


// call function with key-value inputs
contract XYZ {
    function SomeFuncWithManyInputs(uint x, uint y, uint z, address a, bool b, string memory c) 
    public pure returns (uint) {
        
    }

    function callFunc() external pure returns(uint) {
        return SomeFuncWithManyInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns(uint) {
        return SomeFuncWithManyInputs({a: address(0), b: true, c: "c", x: 1, y: 2, z: 3});
    }
}