//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";
contract GetStorage {

    uint private secretNumber;

     constructor() {
        console.log("Deploying correctly");
        secretNumber = block.timestamp;
    }

}