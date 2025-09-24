// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Whale Transfer Trap (Test Only)
/// @notice Detects when a whale moves more than X% of total supply in a single tx
contract WhaleTransferTrap {
    uint256 public thresholdPercent; // e.g. 5 means 5%

    event WhaleTransferDetected(
        address indexed from,
        address indexed to,
        uint256 amount,
        uint256 threshold
    );

    constructor(uint256 _thresholdPercent) {
        thresholdPercent = _thresholdPercent;
    }

    /// @notice Collects transfer data from token contract
    /// @param from Sender
    /// @param to Receiver
    /// @param amount Transfer amount
    /// @param totalSupply Total supply of token
    function collect(
        address from,
        address to,
        uint256 amount,
        uint256 totalSupply
    ) external {
        if (shouldRespond(amount, totalSupply)) {
            emit WhaleTransferDetected(from, to, amount, thresholdPercent);
        }
    }

    /// @notice Returns true if transfer exceeds threshold %
    function shouldRespond(uint256 amount, uint256 totalSupply)
        public
        view
        returns (bool)
    {
        if (totalSupply == 0) return false;
        uint256 percentMoved = (amount * 100) / totalSupply;
        return percentMoved >= thresholdPercent;
    }
}

