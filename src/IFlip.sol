// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

interface IFlip {
    function flip(bool _guess) external returns (bool);
}
