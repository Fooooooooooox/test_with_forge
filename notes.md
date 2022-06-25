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


