pragma solidity ^0.7.3;

import './IOracle.sol';

contract Consumer {
  IOracle public oracle;

  constructor(address _orcale) {
    oracle = IOracle(_orcale);
  }

  function foo() external {
    bytes32 key = keccak256(abi.encodePacked('BTC/USD'));

    (bool result, uint timestamp, uint data) = oracle.getData(key);
    require(result == true, 'could not get price');
    require(timestamp >= block.timestamp - 2 minutes, 'price expired');
  }
}
