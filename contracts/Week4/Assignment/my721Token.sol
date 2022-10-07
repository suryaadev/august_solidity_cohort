// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyERC20 is ERC20{

    constructor() ERC20("Titanium", "TI"){
        _mint(msg.sender, 1000);
    }
}

interface ICount{
    function transferFrom(
        address to,
        address from,
        uint256 amount
    ) external returns (bool);
    
    function balanceOf(address account) external view returns (uint256);
    function totalSupply() external view returns (uint256);

}


contract My721Token is ERC721{

    address private contractAddr;
    uint public supply;
    uint public tokenid;
    address[] public Minters;

    constructor() ERC721("Titanium_Army", "TA"){}
    
    function updateAddress(address _addr) public {
        contractAddr = _addr;
    }

    function setSupply(uint _supply) public {
        supply = _supply;
    }

    function MintNFT(address _to) public {
        require (supply != 0 , "Not avaible to mint");
        for(uint i; i<Minters.length; i++ ){
            require(Minters[i] != _to, "Already minted");
        }
         _safeMint(_to, tokenid);
         Minters.push(_to);
         supply = supply - 1;
         tokenid+=1;  
    }

    function ERC20Drop() public{
        // uint amount = ICount(contractAddr).totalSupply() / Minters.length;
        require(supply==0, "NFTs are in stock");
        for(uint i; i<Minters.length; i++){
            ICount(contractAddr).transferFrom(address(this),Minters[i], 10);
        }
        
    }

    function checkBalance(address _addr) public view returns(uint){
        return ICount(contractAddr).balanceOf(_addr);
    }

    function checkContractBalance() public view returns(uint){
        return ICount(contractAddr).balanceOf(address(this));
    }
    function tt() public{
        ICount(contractAddr).transferFrom(address(this), msg.sender, 1);
    }

}
