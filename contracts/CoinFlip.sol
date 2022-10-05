// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract CoinFlip {


  uint256 public consecutiveWins;
  // @audit - lastHash can be manipulated
  uint256 lastHash;
  // @audit - this is clear for everybody
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) { 
    // @audit - It is easy to guess the blockhash value
    uint256 blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    } 

    lastHash = blockValue;
    // @audit - blockValue / Factor = 0 or 1
    // @audit - If blockValue/FACTO = 1 -> side = true else false
    // @audit - If _guess = side -> consecitiveWinss++
    uint256 coinFlip = (blockValue/FACTOR);
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}