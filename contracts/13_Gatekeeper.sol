// SPDX-License-Identifier: MIT
// @audit-issue - Don´t use ^ in mainnet.
pragma solidity ^0.8.0;

contract GatekeeperOne {

  address public entrant;

  // @audit-issue - Sending from a contranct, not an EOA will (...)
  // @audit-issue - (...) overcome this require.
  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  // @audit-info - Looks like, with a loop, we can consume gas (...)
  // @audit-info - (...) until match the require.
  modifier gateTwo() {
    require(gasleft() % 8191 == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}