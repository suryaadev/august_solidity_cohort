// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract sendMoney{

    // struct Funder{
    //     uint amt;
    //     address sender;
    // }

    address[] public funders;

    mapping(address => uint) public addToUint;

    // Funder[] public funders;

    function addMoney() public payable{
        funders.push(msg.sender);
        addToUint[msg.sender] = msg.value;
    }

    function funds() public view returns(uint){
        return address(this).balance;
    }

    function sendAmountTo(uint who)  public payable{
        address payable where = payable(funders[who]);
        where.transfer(1 ether);
    }

    function getAcBalance(uint pos) public view returns(uint){
        return funders[pos].balance;
    }
}