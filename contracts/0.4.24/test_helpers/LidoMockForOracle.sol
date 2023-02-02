// SPDX-FileCopyrightText: 2023 Lido <info@lido.fi>

// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.4.24;

/**
 * @dev Only for testing purposes! Lido version with some functions exposed.
 */
contract LidoMockForOracle {
    uint256 private totalPooledEther;

    function totalSupply() external view returns (uint256) {
        return totalPooledEther;
    }

    function handleOracleReport(uint256, uint256 _beaconBalance, uint256, uint256, uint256, uint256)
        external
        returns (uint256, uint256, uint256, uint256)
    {
        totalPooledEther = _beaconBalance;
    }

    function getTotalShares() public pure returns (uint256) {
        return 42;
    }

    function pretendTotalPooledEtherGweiForTest(uint256 _val) public {
        totalPooledEther = _val * 1e9; // gwei to wei
    }
}
