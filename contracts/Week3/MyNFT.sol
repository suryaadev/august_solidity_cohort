// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {

    constructor() ERC721("MyNFT", "MN") {
        _mint(msg.sender, 1);
    }
}

// contract address : 0x4155f289De2A491c3B5c3cdfaeDc2CF1671F86Cb