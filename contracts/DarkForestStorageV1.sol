// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;
pragma experimental ABIEncoderV2;

// Import base Initializable contract
import "./DarkForestTypes.sol";

contract DarkForestStorageV1 {
    DarkForestTypes.GameStorage public s; // storage slot 1 - slot 0 is used by OZ-initializable internal flags

    // FIRST-LEVEL GETTERS - mirrors the solidity autogenerated toplevel getters, but for GameStorage
    // OMMITTED:
    // - tokens (it's a contract)

    function adminAddress() public view returns (address) {
        return s.adminAddress;
    }

    function paused() public view returns (bool) {
        return s.paused;
    }

    function ADMIN_CAN_ADD_PLANETS() public view returns (bool) {
        return s.ADMIN_CAN_ADD_PLANETS;
    }

    function WORLD_RADIUS_LOCKED() public view returns (bool) {
        return s.WORLD_RADIUS_LOCKED;
    }

    function TOKEN_MINT_END_TIMESTAMP() public view returns (uint256) {
        return s.TOKEN_MINT_END_TIMESTAMP;
    }

    function TARGET4_RADIUS() public view returns (uint256) {
        return s.TARGET4_RADIUS;
    }

    function snarkConstants() public view returns (DarkForestTypes.SnarkConstants memory) {
        return s.snarkConstants;
    }

    function gameConstants() public view returns (DarkForestTypes.GameConstants memory) {
        return s.gameConstants;
    }

    function planetLevelsCount() public view returns (uint256) {
        return s.planetLevelsCount;
    }

    function worldRadius() public view returns (uint256) {
        return s.worldRadius;
    }

    function planetEventsCount() public view returns (uint256) {
        return s.planetEventsCount;
    }

    function planetDefaultStats(uint256 level)
        public
        view
        returns (DarkForestTypes.PlanetDefaultStats memory)
    {
        return s.planetDefaultStats[level];
    }

    function planetIds(uint256 idx) public view returns (uint256) {
        return s.planetIds[idx];
    }

    function revealedPlanetIds(uint256 idx) public view returns (uint256) {
        return s.revealedPlanetIds[idx];
    }

    function playerIds(uint256 idx) public view returns (address) {
        return s.playerIds[idx];
    }

    function planets(uint256 key) public view returns (DarkForestTypes.Planet memory) {
        return s.planets[key];
    }

    function revealedCoords(uint256 key)
        public
        view
        returns (DarkForestTypes.RevealedCoords memory)
    {
        return s.revealedCoords[key];
    }

    function planetsExtendedInfo(uint256 key)
        public
        view
        returns (DarkForestTypes.PlanetExtendedInfo memory)
    {
        return s.planetsExtendedInfo[key];
    }

    function artifactIdToPlanetId(uint256 key) public view returns (uint256) {
        return s.artifactIdToPlanetId[key];
    }

    function artifactIdToVoyageId(uint256 key) public view returns (uint256) {
        return s.artifactIdToVoyageId[key];
    }

    function planetEvents(uint256 key)
        public
        view
        returns (DarkForestTypes.PlanetEventMetadata[] memory)
    {
        return s.planetEvents[key];
    }

    function players(address key) public view returns (DarkForestTypes.Player memory) {
        return s.players[key];
    }

    function planetArrivals(uint256 key) public view returns (DarkForestTypes.ArrivalData memory) {
        return s.planetArrivals[key];
    }

    function planetArtifacts(uint256 key) public view returns (uint256[] memory) {
        return s.planetArtifacts[key];
    }

    // ADDITIONAL UTILITY GETTERS

    function getNPlanets() public view returns (uint256) {
        return s.planetIds.length;
    }

    function getNRevealedPlanets() public view returns (uint256) {
        return s.revealedPlanetIds.length;
    }

    function getNPlayers() public view returns (uint256) {
        return s.playerIds.length;
    }

    function getPlanetEventsCount(uint256 locationId) public view returns (uint256) {
        return s.planetEvents[locationId].length;
    }

    function getPlanetEvent(uint256 locationId, uint256 idx)
        public
        view
        returns (DarkForestTypes.PlanetEventMetadata memory)
    {
        return s.planetEvents[locationId][idx];
    }

    function getPlanetArrival(uint256 arrivalId)
        public
        view
        returns (DarkForestTypes.ArrivalData memory)
    {
        return s.planetArrivals[arrivalId];
    }

    function getRevealedCoords(uint256 locationId)
        public
        view
        returns (DarkForestTypes.RevealedCoords memory)
    {
        return s.revealedCoords[locationId];
    }

    function getUpgrades() public view returns (DarkForestTypes.Upgrade[4][3] memory) {
        return s.upgrades;
    }

    function getTypeWeights() public view returns (uint8[5][10][4] memory) {
        return s.gameConstants.PLANET_TYPE_WEIGHTS;
    }

    function getArtifactPointValues() public view returns (uint256[6] memory) {
        return s.gameConstants.ARTIFACT_POINT_VALUES;
    }

    function getRevealCooldown() public view returns (uint256) {
        return s.gameConstants.LOCATION_REVEAL_COOLDOWN;
    }

    function getDefaultStats() public view returns (DarkForestTypes.PlanetDefaultStats[] memory) {
        return s.planetDefaultStats;
    }

    function getPlanetLevelThresholds() public view returns (uint256[] memory) {
        return s.planetLevelThresholds;
    }

    function getCumulativeRarities() public view returns (uint256[] memory) {
        return s.cumulativeRarities;
    }
}
