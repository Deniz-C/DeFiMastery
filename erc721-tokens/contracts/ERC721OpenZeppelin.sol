pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract ERC721OpenZeppeline1 is ERC721 {
  constructor() ERC721('Token Name', 'Token Symbol') {}
}

contract ERC721OpenZeppeline2 is ERC721 {
  constructor() ERC721('Token Name', 'Token Symbol') {
    _safeMint(msg.sender, 0);
    _safeMint(msg.sender, 1);
  }
}

contract ERC721OpenZeppeline3 is ERC721 {
  address public admin;

  constructor() ERC721('Token Name', 'Token Symbol') {
    admin = msg.sender;
  }

  function mint(address to, uint tokenId) external {
    require(msg.sender == admin, 'only admin');
    _safeMint(msg.sender, tokenId);
  }
}

contract ERC721OpenZeppeline4 is ERC721 {
  address public admin;

  constructor() ERC721('Token Name', 'Token Symbol') {
    admin = msg.sender;
  }

  function mint(address to, uint tokenId) external {
    require(msg.sender == admin, 'only admin');
    _safeMint(msg.sender, tokenId);
  }
}
