// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Factory.sol";
import "openzeppelin-contracts/access/Ownable.sol";

contract OwnableContract {
    Factory public factory;

    constructor(){
        factory = new Factory();
    }

    function getOwner() public returns (address) {
        return Ownable(address(factory)).owner();
    }
}
