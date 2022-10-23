// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/StdJson.sol";

contract FsTest is Test {
    using stdJson for string;
    
    function setUp() public {}


    function testReadTrie() public {
        string memory root = "../../../../../../../tmp/cannon/";
        string memory path = string.concat(root, "/src/test/fixtures/broadcast.log.json");
    }

}