// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ReentrancyAttack {

    function sendEther (address payable _victimContractAddr) public payable {
        (bool success, ) = _victimContractAddr.call{value: msg.value}("");
        require(success, "Transaction Failed");
    }

    receive () external payable {

    }

}