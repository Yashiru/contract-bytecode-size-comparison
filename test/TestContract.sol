// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/OwnableContract.sol";
import "../src/IOwnableContract.sol";

contract ContractTest is Test {
    OwnableContract public oSc = new OwnableContract();
    IOwnableContract public ioSc = new IOwnableContract();

    function testWeight() public {
        address owner1 = oSc.getOwner();

        console.log("=== OwnableContract ===");
        console.log("Creation code length:");
        console.log(type(OwnableContract).creationCode.length);
        console.log("Runtime code length:");
        console.log(type(OwnableContract).runtimeCode.length);


        address owner2 = ioSc.getOwner();
        console.log("=== IOwnableContract ===");
        console.log("Creation code length:");
        console.log(type(IOwnableContract).creationCode.length);
        console.log("Runtime code length:");
        console.log(type(IOwnableContract).runtimeCode.length);
    }
}
