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
}