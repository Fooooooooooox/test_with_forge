// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

contract BlackSmith {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    function onlyOwner() public view {
        require(msg.sender == owner, "Not owner!");
    }
}
