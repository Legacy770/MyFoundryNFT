//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {ERC721} from "lib/forge-std/openzeppelin-contracts-master/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint private s_tokenCounter;
    mapping(uint => string) private s_tokenIdToUri;

    constructor() ERC721("DINOSAUR", "DINO") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
