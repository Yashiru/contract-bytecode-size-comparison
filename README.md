# Contract bytecode size comparison

## Using OZ Ownable full contract to cast

With this contract as code base:

```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Factory.sol";
import "openzeppelin-contracts/access/Ownable.sol";

contract OwnableContract {
    Factory public factory;

    constructor(){
        factory = new Factory();
    }

    function setNumber() public returns (address) {
        return Ownable(address(factory)).owner();
    }
}
```

We get the following result: 

| src/OwnableContract.sol:OwnableContract contract |                 |      |        |      |         |
|--------------------------------------------------|-----------------|------|--------|------|---------|
| Deployment Cost                                  | Deployment Size |      |        |      |         |
| 256213                                           | 1138            |      |        |      |         |
| Function Name                                    | min             | avg  | median | max  | # calls |
| getOwner                                         | 7532            | 7532 | 7532   | 7532 | 1       |

Logs:

```
=== OwnableContract ===
Creation code length:
1138
Runtime code length:
341
```

## Using custom IOwnable interface

With this contract as code base:

```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Factory.sol";
import "./IOwnable.sol";

contract IOwnableContract {
    Factory public factory;

    constructor(){
        factory = new Factory();
    }

    function getOwner() public returns (address) {
        return IOwnable(address(factory)).owner();
    }
}
```

We get the following result: 

| src/IOwnableContract.sol:IOwnableContract contract |                 |      |        |      |         |
|----------------------------------------------------|-----------------|------|--------|------|---------|
| Deployment Cost                                    | Deployment Size |      |        |      |         |
| 256613                                             | 1140            |      |        |      |         |
| Function Name                                      | min             | avg  | median | max  | # calls |
| getOwner                                           | 7535            | 7535 | 7535   | 7535 | 1       |

Logs:

```
=== IOwnableContract ===
Creation code length:
1140
Runtime code length:
343
```


## Run it by your own

### Install foundry

See [foundry installation guide](https://book.getfoundry.sh/getting-started/installation) for more info.

```bash
curl -L https://foundry.paradigm.xyz | bash
```

### Run test with logs and debug

```bash
forge test --gas-report -vvv
```