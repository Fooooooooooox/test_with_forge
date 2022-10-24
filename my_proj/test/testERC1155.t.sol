// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/erc1155/FactoryERC1155.sol";
import "../src/erc1155/ERC1155Token.sol";

contract testERC1155 is Test {
    FactoryERC1155 factoryERC1155;
    address alice = address(0x1111);
    address myDiaryContract;

    function setUp() public {
        factoryERC1155 = new FactoryERC1155();
        // deploy a ERC155 contract as a diary 
        uint[] memory ids = new uint[](2);
        ids[0] = 1;
        ids[1] = 2;
        string[] memory names = new string[](2);
        names[0] = "one";
        names[1] = "two";
        myDiaryContract = factoryERC1155.deployERC1155("my_dairy", "https://ipfs/xxx", ids, names);
    }

    function testGetTokenInfo() public {
        string memory tokenName = factoryERC1155.getNameById(0, 1);
        assertEq(tokenName, "one");

        (address _contract, address _owner, string memory _uri, uint _supply) = factoryERC1155.getERC1155byIndexAndId(0, 0);
        assertEq(_contract, myDiaryContract);
        assertEq(_owner, ERC1155Token(myDiaryContract).owner());
        assertEq(_uri, "https://ipfs/xxx0.json");
        assertEq(_supply, 0);
    }

    function testAddNewToken() public {
        address owner = ERC1155Token(myDiaryContract).owner();
        vm.prank(owner);
        ERC1155Token(myDiaryContract).addNewToken("three", 3);
    }

    function testMint() public {
        // mint via factory contract
        factoryERC1155.mintERC1155(0, "one", 1);
        assertEq(1, factoryERC1155.getCountERC1155byName(0, "one"));
        assertEq(1, factoryERC1155.getCountERC1155byIndex(0, 1));

        // mint via original contract
        ERC1155Token(myDiaryContract).mint(alice, 1, 2);
        assertEq(2, ERC1155Token(myDiaryContract).balanceOf(alice, 1));
    }

}