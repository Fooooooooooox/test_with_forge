// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import "../src/blacksmith.sol";

contract User {
    function callOnlyOwner(BlackSmith b) public view {
        b.onlyOwner();
    }
}

contract BlackSmithTest is DSTest {
    BlackSmith blacksmith;
    User user;

    // setup function resets the state of the contract before each test is run.
    function setUp() public {
        // address.this() is the value for construtor
        blacksmith = new BlackSmith(address(this));
        user = new User();
    }

    function testOwner() public {
        // check if the owner is correctly set up:
        assertEq(blacksmith.owner(),address(this));
    }

    // testFail: The inverse of the test prefix - if the function does not revert, the test fails
    function testFailOwner() public view{
        user.callOnlyOwner(blacksmith);
    }
}
