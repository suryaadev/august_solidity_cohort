// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ArrayOP{

    uint[] public arr = [1,2,3];

    function printArray() public view returns(uint[] memory){
        return arr;
    }

    // add element in array at the end
    function addElement(uint _ele) public {
        return arr.push(_ele);
    }

    // delete element  
    function deleteElement() public {
        return arr.pop();
    }

    // delete array
    function delEle() public{
        delete arr;
    }

    // size of array

    function findSize() public view returns(uint){
        return arr.length;
    }

    // delete last element and place zero
    function lastWitch() public {
        uint pos = arr.length - 1;
        delete arr[pos];
        
    }
    function swap() public{
        uint pos = arr.length - 1;
        uint temp = arr[0];
        arr[0] = arr[pos];
        arr[pos] = temp;
    }
}