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
    mapping(uint256 => EnumerableSet.AddressSet) internal _operatorListByCharacter;
    
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
        _operatorListByCharacter[0].add(address(0x1));
        exists = _operatorListByCharacter[0].contains(address(0x1));
        assert(exists);

        _operatorListByCharacter[0].add(address(0x222));
        _operatorListByCharacter[0].add(address(0x3));
        _operatorListByCharacter[0].add(address(0x4));

        address _value = _operatorListByCharacter[0].at(2);
        console.log(_value);

        uint256 _length = _operatorListByCharacter[0].length();
        console.log("hhhh this is length:", _length);

        address[] memory _list = _operatorListByCharacter[0].values();

        for (uint256 index = 0; index < _list.length; index++) {
            _value = _list[index];
            _operatorListByCharacter[0].remove(_value);
        }
        
        assert(!_operatorListByCharacter[0].contains(address(0x1)));
        assert(!_operatorListByCharacter[0].contains(address(0x222)));
        assert(!_operatorListByCharacter[0].contains(address(0x3)));
        assert(!_operatorListByCharacter[0].contains(address(0x4)));

    }

}
