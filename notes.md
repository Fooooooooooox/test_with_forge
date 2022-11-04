## how to import libraries?

install openzeppelin into lib:
```shell
forge install openzeppelin/openzeppelin-contracts
```

import openzepplin in contracts:
```solidity
import "@openzeppelin/contracts/access/Ownable.sol";
```

remap the path:
```shell
touch remappings.txt
//add this line into remappings.txt:
@openzeppelin/=../lib/openzeppelin-contracts/
```

## configure chain state

everytime you run a test, block chain state is set up to blank (a network running on your local pc), but can i configure a specific state for better mocking?

==> that's what forking mode used for: https://book.getfoundry.sh/forge/forking-mode.html

crossbell rpc url: https://rpc.crossbell.io

```shell
forge test --fork-url https://rpc.crossbell.io --fork-block-number 1 --etherscan-api-key
```
(these flags can also be set in foundry.toml, full options can be found here: https://github.com/foundry-rs/foundry/blob/master/config/README.md#all-options)

(idk what is etherscan here for yet.../?todo/)




# husky
(check in foundry-hardhat-template)

```shell
yarn add —save-dev husky 
npx husky install
npx husky -v
```

# lint

```shell
npm init @eslint/config
```