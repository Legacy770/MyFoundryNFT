//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "lib/forge-std/src/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintBasicNft is Script {
    string public constant DINO_URI =
        "https://bafybeie5b5n7h2ioitktooazp24c7ddtu24gwsadohatcjsucgvna46ln4.ipfs.dweb.link?filename=metadata.json";

    function run() external {
        address mostRecentlyDeployedBasicNft = DevOpsTools
            .get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployedBasicNft);
    }

    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        BasicNFT(basicNftAddress).mintNft(DINO_URI);
        vm.stopBroadcast();
    }
}
