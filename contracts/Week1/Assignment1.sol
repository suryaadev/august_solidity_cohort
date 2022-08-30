// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Assignment1{

    event log(uint value);

    // for loop
    function printLoop() public{
        for(uint i=0; i<10; i++){

            if(i==3){
                continue;
            }
            emit log(i);
        }
    }

    // while loop
    function whileLoop() public{
        uint c = 11;

        while(c<15){
            emit log(c);
            c++;
        }
    }

    // operators +|-|*|/
//  add
    function add(uint _a, uint _b) public pure returns(uint){
        return _a + _b;
    }

// substraction
function sub(uint _a, uint _b) public pure returns(uint){
        return _a - _b;
    }
// multiplication
    function multi(uint _a, uint _b) public pure returns(uint){
        return _a * _b;
    }

// division
    function div(uint _a, uint _b) public pure returns(uint){
        return _a / _b;
    }

    // increment
    function inc() public pure returns(uint){
        uint num = 10;
        return num = num + 1;
    }

    // decrement

    function dec() public pure returns(uint){
        uint num = 1;
        return num = num -1;        
    }

    // compare 2 strings

    function compareTwoStrings(string memory _s1, string memory _s2) public pure returns(bool){
        if(keccak256(abi.encodePacked(_s1)) == keccak256(abi.encodePacked(_s2))){
            return true;
        }else{
            return false;
        }
    }

    // return bytes
    function returnByets(string memory something) public pure returns(bytes memory){
        // this will return encode
        // return abi.encode(something);
        // this will return encode packed
        return abi.encodePacked(something);
    }


}