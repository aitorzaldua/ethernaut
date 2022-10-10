// SPDX-License-Identifier: MIT
// @audit-issue - version 0.6.x is too old
// @audit-issue - Do not use ^ in the mainnet
pragma solidity 0.6.0;

contract Telephone {

  address public owner;

  // @audit-info - Consider not creating the constructor as public
  constructor() public {
    // @audit-info - Consider using the Ownable Zeppelin Contract
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
      // @audit-issue - txt.origin IS different to msg.sender
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}