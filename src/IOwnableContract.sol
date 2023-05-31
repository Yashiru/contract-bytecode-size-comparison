// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Factory.sol";
import "./IOwnable.sol";

contract IOwnableContract {
    Factory public factory;

    constructor(){
        factory = new Factory();
    }

    function getOwner() public returns (address) {
        return IOwnable(address(factory)).owner();
    }
}
