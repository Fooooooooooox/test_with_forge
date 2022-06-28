// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

// there is no longer constructor function
// we need to replace it with initialize!
// solidity ensures that a constructor is called only once in the lifetime of a contract,
// but a regular function can be called many times, so we need to fix our initialize func.
// set a bool 'initialized' to record.
contract MyContract {
    uint256 public x;
    bool private initialized;

    function initialize(uint256 _x) public {
        require(!initialized, "Contract instance has already been initialized");
        initialized = true;
        x = _x;
    }
}

// alright, openzepplin did this for us:
contract MyContract is Initializable {
    uint256 public x;

    function initialize(uint256 _x) public initializer {
        x = _x;
    }
}