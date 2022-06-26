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
        web3entry.setOperator(characterId, address(17));
        vm.prank(address(17));  
        vm.expectRevert("NotCharacterOwner");
        web3entry.setHandle(characterId, newHandle); 
    }

    function testOperatorCanPostNote() public {
        web3entry = new Web3Entry();
        address _this = address(this);
        address _zero = address(0);
        string memory _handle = "0xcrossbell-eth";
        string memory _uri = "https://raw.githubusercontent.com/Crossbell-Box/Crossbell-Contracts/main/examples/sampleProfile.json";
        bytes memory bs = new bytes(0);
        DataTypes.CreateCharacterData memory characterData = DataTypes.CreateCharacterData(_this, _handle, _uri, _zero, bs);
        web3entry.createCharacter(characterData);
        web3entry.setOperator(characterId, address(17));
        vm.prank(address(17));  

        uint256 _characterId = 1;
        string memory _contentUri = "https://github.com/Crossbell-Box/Crossbell-Contracts/blob/main/examples/sampleContent.json";
        address _linkModule = address(0);
        bytes memory _linkModuleInitData = new bytes(0);
        address _mintModule = address(0);
        bytes memory _mintModuleInitData = new bytes(0);
        bool _locked = false;
        DataTypes.PostNoteData memory postnotedata = DataTypes.PostNoteData(_characterId, _contentUri, _linkModule, _linkModuleInitData, _mintModule, _mintModuleInitData, _locked);
        web3entry.postNote(postnotedata);
    }

}