// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import  "../src/Web3Entry.sol";
import "../src/libraries/DataTypes.sol";

contract OperatorAuthorityTest is Test {
    Web3Entry web3entry;

    uint256 public characterId = 1;
    address public creator = address(this);
    address public to = address(this);
    string public handle = "0xcrossbell-eth";
    uint public timestamp = block.timestamp;
    string public newHandle = "_ab2423cea4f1047556e7a14-f1-btc";

    function testOperatorCanNotSetHandle() public {
        web3entry = new Web3Entry();
        address _this = address(this);
        address _zero = address(0);
        string memory _handle = "0xcrossbell-eth";
        string memory _uri = "https://raw.githubusercontent.com/Crossbell-Box/Crossbell-Contracts/main/examples/sampleProfile.json";
        bytes memory bs = new bytes(0);
        DataTypes.CreateCharacterData memory characterData = DataTypes.CreateCharacterData(_this, _handle, _uri, _zero, bs);
        web3entry.createCharacter(characterData);
        vm.prank(address(1337));  
        vm.expectRevert("NotCharacterOwner");
        web3entry.setHandle(characterId, newHandle); 
    }


}