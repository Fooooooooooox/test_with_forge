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

    // you can't use struct in mappings(EnumerableSet is struct)
    // mapping(uint256 => EnumerableSet.AddressSet) internal _operatorListByCharacter;
    
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
        // _operatorListByCharacter[0] = new EnumerableSet.AddressSet;
        // exists = _operatorListByCharacter[0].contains(address(0x1));
        // assert(exists);
        
        address[] memory myArr = new address[](2);
        myArr[0] = address(0x0);
        myArr[1] = address(0x1);
        myArr[1] = address(0x0);
        console.log(myArr.length);

        
    }

}
