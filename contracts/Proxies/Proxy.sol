// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Proxy {
    address implementation;

    function changeImplementation(address _implementation) external {
        implementation = _implementation;

    }


    fallback() external {
        (bool success, ) = implementation.call(msg.data);
        require(success);
    }

}

contract Logic1 {
    uint public x = 0;

    function changeX(uint _x) external {
        x = _x;
    }

}

contract Logic2 {
    uint public x = 3;

    function changeX(uint _x) external {
        x = _x;
    }
} 