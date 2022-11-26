// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ParticipatedWithBitmap {
    uint256[] public participantsBitmap;

    function setParticipants(uint256[] memory participantsBitmap_) external {
        participantsBitmap = participantsBitmap_;
    }
    
    function hasParticipated(uint256 bitmapIndex, uint256 indexFromRight) external view returns (bool) {
        uint256 bitAtIndex = participantsBitmap[bitmapIndex] & (1 << indexFromRight);
        return bitAtIndex > 0;
    }
}