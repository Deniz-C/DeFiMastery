ragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract TokenOpenZeppelin1 is ERC20 {
  constructor() ERC20('Token Name', 'TICKER') {}
}

contract TokenOpenZeppelin2 is ERC20 {
  constructor() ERC20('Token Name', 'TICKER') {
    _mint(msg.sender, 100000);
  }
}

contract TokenOpenZeppelin3 is ERC20 {
  address public admin;

  constructor() ERC20('Token Name', 'TICKER') {
    admin = msg.sender;

  }

  function mint(address to, uint amount) external {
    require(msg.sender == admin, 'only admin');
    _mint(to, 100000);
  }
}

contract TokenOpenZeppelin4 is ERC20 {
  constructor() ERC20('Token Name', 'TICKER') {
  }

  function faucet(address to, uint amount) external {
    _mint(to, amount);    
  }
}
