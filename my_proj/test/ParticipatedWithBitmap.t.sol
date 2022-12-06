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

        uint notx = ~x;
        console.log(getLastNBits(x, 7)); //6a: 1101010
        console.log(getLastNBits(notx, 7)); // 0010101
        // console.logBytes(toBytes(~x));    

        // read position 
        console.log(x & (1 << 2));
        assertEq(x & (1 << 2),0);
        console.log(x & (1 << 3));
        // assertEq(x & (1 << 3),1);
        console.log(x & (1 << 4));
        assertEq(x & (1 << 4),0);

        bool isset = isBitSet(x, 1);
        assert(isset);

        assert(!isBitSet(x, 0));
        assert(isBitSet(x, 1));
        assert(!isBitSet(x, 2));
        assert(isBitSet(x, 3));
        assert(!isBitSet(x, 4));
        assert(isBitSet(x, 5));
        assert(isBitSet(x, 6));
        assert(isBitSet(x, 7));
    }

    function isBitSet(uint256 b, uint256 pos) public pure returns (bool) {
        return ((b >> pos) & 1) == 1;
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