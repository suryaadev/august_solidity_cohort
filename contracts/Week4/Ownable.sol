// SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;


import "@openzeppelin/contracts/access/Ownable.sol";

contract Myc is Ownable{
        function nothing() public{
// something will go here
    }

    function specialThing() public onlyOwner {
        // only the owner can call specialThing()!
    }

}