// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "forge-std/Test.sol";

error Unauthorized();

contract OwnerUpOnly {
    address public immutable owner;
    uint256 public count;

    constructor() {
        owner = msg.sender;
    }

    function increment() external {
        if (msg.sender != owner) {
            revert Unauthorized();
        }
        count++;
    }
}


contract OwnerUpOnlyTest is Test {
    OwnerUpOnly upOnly;

    function setUp() public {
        upOnly = new OwnerUpOnly();
    }

    function testIncrementAsOwner() public {
        assertEq(upOnly.count(), 0);
        upOnly.increment();
        assertEq(upOnly.count(), 1);
    }

    // vm.prank(address(0)) change our identity to zero address for the next call
    // testFail is considered an anti-pattern since it does not tell us anything about why upOnly.increment() reverted.
    // how to turn traces on?
    // use this command: forge test -vvvv --match-test testFailIncrementAsNotOwner
    function testFailIncrementAsNotOwner() public {
        vm.prank(address(0));
        upOnly.increment();
    }
    
    // Notice that we replaced `testFail` with `test`
    function testIncrementAsNotOwner() public {
        vm.expectRevert(Unauthorized.selector);
        vm.prank(address(0));
        upOnly.increment();
    }
}