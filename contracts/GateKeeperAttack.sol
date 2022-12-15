//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GatekeeperOne.sol";

import "hardhat/console.sol";

contract GateKeeperOneAttack {
  
    GatekeeperOne public victimContract;

    constructor (address _victimContractAddr) {
        victimContract = GatekeeperOne(_victimContractAddr);
    }

    function attack () public {   
  
    }

}