// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "hardhat/console.sol";

contract LoggingStuff{

    uint num = 10;
    
    function showNumber() public view{
        console.log(num);
    }
}