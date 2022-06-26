// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "../lib/forge-std/src/Test.sol";
import  "../src/Web3Entry.sol";

contract EventTest is Test{
    event CharacterCreated(
    uint256 indexed characterId,
    address indexed creator,
    address indexed to,
    string handle,
    uint256 timestamp
    );

    function testExceptEmit() public {
        ExpectEmit emitter = new ExpectEmit();
        vm.expectEmit(true, true, true, true);
        // define these parameter
        emit CharacterCreated(mockCharacterId, creator, to, handle, timestamp);
        emitter.t();
    }
}

contract ExpectEmit {
    event CharacterCreated(
        uint256 indexed characterId,
        address indexed creator,
        address indexed to,
        string handle,
        uint256 timestamp
    );

    function t() public {
        emit CharacterCreated(msg.sender, address(1337), 1337);
    }  
}