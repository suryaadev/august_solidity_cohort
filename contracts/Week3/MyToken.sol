// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract TitaniumToken is ERC20{
    
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol){
        _mint(msg.sender, 20*10**18);
    }
}

// contract address 0x305101b6fd18d0f2d3c1636547ae4abecd33c704