// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.7.0;

import "./HackMeIfYouCan.sol";

contract Proxy {
    HackMeIfYouCan hackMeIfYouCan;

    constructor(address contractAddr) {
        hackMeIfYouCan = HackMeIfYouCan(payable(contractAddr));
    }

    function addPoint() external {
        hackMeIfYouCan.addPoint();
    }
}
