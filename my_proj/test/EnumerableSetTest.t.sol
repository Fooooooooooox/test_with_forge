// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import "../src/MyAddressSet.sol";

contract EnumerableSetTest is Test {

    // Add the library methods
    using EnumerableSet for EnumerableSet.AddressSet;

    // Declare a set state variable
    EnumerableSet.AddressSet private mySet;
    
    function setUp() public {
    }

    function testAddmyset() public {
        mySet.add(address(0x1));
        mySet.add(address(0x2));
        bool exists = mySet.contains(address(0x1));
        assert(exists);
        mySet.remove(address(0x1));
        exists = mySet.contains(address(0x1));
        assert(!exists);
    }

}
