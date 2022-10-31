// contracts/ERC1155Token.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract MyAddresSet {
    // Add the library methods
    using EnumerableSet for EnumerableSet.AddressSet;

    // Declare a set state variable
    EnumerableSet.AddressSet private mySet;

    function addMyset(address _value) public {
        // EnumerableSet.AddressSet.add(mySet, _value);
        mySet.add(_value);
    }

    function checkMyset(address _value) public returns (bool) {
        bool exists = mySet.contains(_value);
        return exists;
    }
}