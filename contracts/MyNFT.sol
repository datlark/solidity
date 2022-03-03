// SPDX-License-Identifier: MIT
pragma solidity > 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/ownership/Ownable.sol";
// import "@openzeppelin/contracts/drafts/Counters.sol";
// import "@openzeppelin/contracts/drafts/Strings.sol";
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract MyNFT is  Ownable, ERC721URIStorage  {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

     constructor() ERC721("Ravi NFT1", "Ravi-1") { }

// Mint NFT with a normal URL
    function mintNFT(address receiver, string memory tokenURI) external onlyOwner returns (uint256){

        //Incremetn to
        _tokenIds.increment();
        
        uint256 newNftTokenId = _tokenIds.current();
        _mint(receiver, newNftTokenId);
        
        // This will call the tokenURI implementation to return URI for JPG
        _setTokenURI(newNftTokenId, tokenURI);

        return newNftTokenId;

    }


// Mint NFT with a IPFS link
      function mintIpfsNFT(address receiver, string memory tokenURI) external onlyOwner returns(uint256){

          return 1;

      }



// We only need this if we use more sophisticated URI; that can have different base URI or extension

    //  function tokenURI(uint256 _tokenId) public view override( ERC721URIStorage) returns (string memory) {

    //      return super.tokenURI(_tokenId);
    //  }



}