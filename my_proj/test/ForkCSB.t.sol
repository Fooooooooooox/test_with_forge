// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

contract OperatorTest is Test {
function testCodeFork() public {
    string memory rpc = "https://rpc.crossbell.io"; // or run with:forge test --match-test testCodeFork -vvvvvv --fork-url https://rpc.crossbell.io -w
    uint256 csb = vm.createFork(rpc);
    Web3Entry web3Entry;
    uint256 characterId = 40715;

    web3Entry = Web3Entry(address(0xa6f969045641Cf486a747A2688F3a5A6d43cd0D8));
    console.log("===== the character uri is: ", Web3Entry(address(0xa6f969045641Cf486a747A2688F3a5A6d43cd0D8)).getCharacterUri(40715));

    // address[] memory operatorList = (Web3Entry(address(0xa6f969045641Cf486a747A2688F3a5A6d43cd0D8)).getOperators(characterId));
    // console.log("===== the length of operatorList is:", operatorList.length);
    // for (uint256 i=0; i<operatorList.length; i++) {
    //     console.log("===== operator is ", operatorList[i]);
    // }

    // vm.prank(address(0));
    // uint256 bitmap = web3Entry.getOperatorPermissions(characterId, address(0));
    // console.log("===== the permission is:", bitmap);
  }
}