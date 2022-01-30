// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "./DarkForestTypes.sol";

contract DarkForestTokens is ERC721EnumerableUpgradeable {
    address coreAddress;
    mapping(uint256 => DarkForestTypes.Artifact) artifacts;
    string artifactBaseURI;

    modifier onlyCore() {
        require(
            msg.sender == coreAddress,
            "Only the Core address can fiddle with artifacts."
        );
        _;
    }

    // initialization functions are only called once during deployment. They are not called during upgrades.
    function initialize(
        address _coreAddress,
        string memory _artifactBaseURI
    ) public initializer {
        coreAddress = _coreAddress;
        artifactBaseURI = _artifactBaseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return artifactBaseURI;
    }

    function createArtifact(DarkForestTypes.DFTCreateArtifactArgs memory args)
        public
        onlyCore
        returns (DarkForestTypes.Artifact memory)
    {
        require(args.tokenId >= 1, "artifact id must be positive");

        _mint(args.owner, args.tokenId);

        DarkForestTypes.Artifact memory newArtifact =
            DarkForestTypes.Artifact(
                true,
                args.tokenId,
                args.planetId,
                args.rarity,
                args.biome,
                block.timestamp,
                args.discoverer,
                args.artifactType,
                0,
                0,
                0
            );

        artifacts[args.tokenId] = newArtifact;

        return newArtifact;
    }

    function getArtifact(uint256 tokenId) public view returns (DarkForestTypes.Artifact memory) {
        return artifacts[tokenId];
    }

    function getArtifactAtIndex(uint256 idx) public view returns (DarkForestTypes.Artifact memory) {
        return artifacts[tokenByIndex(idx)];
    }

    function getPlayerArtifactIds(address playerId) public view returns (uint256[] memory) {
        uint256 balance = balanceOf(playerId);
        uint256[] memory results = new uint256[](balance);

        for (uint256 idx = 0; idx < balance; idx++) {
            results[idx] = tokenOfOwnerByIndex(playerId, idx);
        }

        return results;
    }

    function transferArtifact(uint256 tokenId, address newOwner) public onlyCore {
        if (newOwner == address(0)) {
            _burn(tokenId);
        } else {
            _transfer(ownerOf(tokenId), newOwner, tokenId);
        }
    }

    function updateArtifact(DarkForestTypes.Artifact memory updatedArtifact)
        public
        onlyCore
    {
        require(_exists(updatedArtifact.id), "you cannot update an artifact that doesn't exist");

        artifacts[updatedArtifact.id] = updatedArtifact;
    }

    function doesArtifactExist(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }
}
