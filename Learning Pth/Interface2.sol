// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// contract Counter_ {
    
//     uint public count_;

//     function getCount_() external view returns(uint) {
//         return count_;
//     }

//     function inc_Count() external {
//         count_ += 1;
//     }
// }

interface ICounter_ {
    function getCount_() external view returns(uint);
    function inc_Count() external;
}

contract Test_Interface is ICounter_ {
    uint public count;

    function inc_Count() external  {
        count += 1;
    }

    function getCount_() external view returns(uint){
        return count;
    }
}