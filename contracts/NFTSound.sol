// SPDX-License-Identifier: UNLICENSED 
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTSound is ERC721 {
  uint256 public tokenCounter;
  mapping (uint256 => string) private _tokenURIs;
  
  constructor() ERC721("NFTSound", "NFTS") {
        tokenCounter = 0;
  }

  function mint(string memory _tokenURI) public {
    _safeMint(msg.sender, tokenCounter);
    _setTokenURI(tokenCounter, _tokenURI);
    tokenCounter++;
  }

  function _setTokenURI(uint256 _tokenId, string memory _tokenURI) internal virtual {
    require(_ownerOf(_tokenId) != address(0), "ERC721Metadata: URI set of nonexistent token");  // Checks if the tokenId exists
    _tokenURIs[_tokenId] = _tokenURI;
  }

  function tokenURI(uint256 _tokenId) public view virtual override returns(string memory) {
    require(_ownerOf(_tokenId) != address(0), "ERC721Metadata: URI set of nonexistent token");
    return _tokenURIs[_tokenId];
  }

  
}