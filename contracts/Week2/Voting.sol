// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//  I want to write a code for  loyalty points when user pays 
contract count {

    /*
        mapping is for parties and there respective vote count
        it's not set public as anyone can see the couting
    */

    mapping(string => uint) partyToVotes;
 
    // here defined address so that I can use it in modifier
    address internal owner;

// array to store all the voters 
    address[] public voters;

// time added 
    uint deployedTime;

// to store address of deployer as a contract owner 
    constructor(){
         owner = msg.sender;
         deployedTime = block.timestamp;
    }

// to set restrictions on who can call the contract
    modifier onlyOwner(){
     require(msg.sender == owner, "Not an owner");
     _;
    }
/*
    function vote is for voting 
    - for loop checking if voter already voted or not (basically one address can vote only one time)
    - for voting everyon must send exactly 1 ether acheved by payable and msg.value
    - nested if else for casting vote to selected party
    - finally push address in voters array
*/

    function vote(uint _party) public payable{

        for(uint i=0; i< voters.length; i++){
            require(voters[i] != msg.sender, "already voted");
        }
        require(msg.value == 1 ether, "Not enough ether send");
        require(block.timestamp <  (deployedTime + 1 minutes), "Time excedded");

        if(_party == 1){
            partyToVotes["BJP"] += 1;
        }else if(_party == 2){
            partyToVotes["shivsena"]+=1;
        }
        else{
            partyToVotes["NOTA"]+=1;
        }
        voters.push(msg.sender);
    }

// whatever ethers collected by contract not locked in contract they sent to owner with this function
// function can we only called by owner

    function withdrawFund() public payable onlyOwner{
        payable(owner).transfer(address(this).balance);
    }

// Shows how much funds are collected in contract

    function fundsCollected() public view returns(uint){
        return address(this).balance;
    }

//  vote counting and announcement of winner by owner 

     function winner() public view onlyOwner returns(string memory){
        if(partyToVotes["BJP"] > partyToVotes["shivsena"] && partyToVotes["BJP"] > partyToVotes["NOTA"]){
            return "BJP wins";
        }
        else if(partyToVotes["shivsena"] > partyToVotes["BJP"] && partyToVotes["shivsena"] > partyToVotes["NOTA"]){
            return "Shivsena Wins";
        }
        else{
            return "Lokshahi Wins";
        }
    }

    

    
}