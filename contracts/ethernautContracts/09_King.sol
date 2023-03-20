// SPDX-License-Identifier: MIT
// @audit-issue - version 0.6 too old. Recommended 0.8.0 or higher
// @audit-issue - Don´t use ^ in mainnet.
pragma solidity ^0.8.4;

contract King {

    // @audit-info -> queryable variables.
    address payable king;
    uint public prize;
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
        king = payable(msg.sender);
        prize = msg.value;
    }

    //@note -> If an address send ETH > prize, this address will become king
    //@note -> The contract, previously, will send the previous value of prize
    //@note -> to the previous king(address).
    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        // @audit-issue -> transfer method is dangerous
        king.transfer(msg.value);
        king = payable(msg.sender);
        prize = msg.value;
    }

    function _king() public view returns (address payable) {
        return king;
    }
}
