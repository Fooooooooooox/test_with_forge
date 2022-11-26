// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "forge-std/Test.sol";
import "../src/ParticipatedWithBitmap.sol";

contract ParticipatedWithBitmapTest is Test {
    ParticipatedWithBitmap public participatedWithBitmap;

    function testParticipate() public {
        participatedWithBitmap = new ParticipatedWithBitmap();

        uint256[] memory bitmap;
        bitmap = new uint256[](1);

        bitmap[0] = 1;
        participatedWithBitmap.setParticipants(bitmap);
        assert(participatedWithBitmap.hasParticipated(0, 0));

        bitmap[0] = 2;
        participatedWithBitmap.setParticipants(bitmap);
        assert(!participatedWithBitmap.hasParticipated(0, 0));
        assert(participatedWithBitmap.hasParticipated(0, 1));
        assert(!participatedWithBitmap.hasParticipated(0, 2));

    }

    function testBitwise() public {
        uint x = 234; // 234： 11101010
        uint last3 = getLastNBits(x, 3); // 010: 2
        console.log(last3);

        uint256 det = ~uint256(0) ;
        console.logBytes(toBytes(det));
        console.logBytes(toBytes(~uint256(0) >> 20));        
    }

    // Get last n bits from x
    function getLastNBits(uint x, uint n) public pure returns (uint) {
        // Example, last 3 bits
        // x        = 1101 = 13
        // mask     = 0111 = 7
        // x & mask = 0101 = 5
        uint mask = (1 << n) - 1;
        return x & mask;
    }

    // Get last n bits from x using mod operator
    function getLastNBitsUsingMod(uint x, uint n) public pure returns (uint) {
        // 1 << n = 2 ** n
        return x % (1 << n);
    }

    function toBytes(uint256 x) public returns (bytes memory b) {
        b = new bytes(32);
        assembly { mstore(add(b, 32), x) }
    }


}