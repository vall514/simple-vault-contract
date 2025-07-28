// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title A simple library for safe math operations
library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "Subtraction overflow");
        return a - b;
    }
}

/// @title Base contract for Vault - holds shared logic and storage
contract VaultBase {
    using SafeMath for uint256;
    mapping(address => uint256) internal balances;
}

/// @title Vault Manager - inherits VaultBase and allows deposits/withdrawals
contract VaultManager is VaultBase {
    using SafeMath for uint256;

    event Deposit(address indexed user, uint amount);
    event Withdraw(address indexed user, uint amount);

    function deposit() public payable {
        require(msg.value > 0, "Cannot deposit 0 ETH");
        balances[msg.sender] = balances[msg.sender].add(msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) public {
        require(amount > 0, "Cannot withdraw 0 ETH");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] = balances[msg.sender].sub(amount);
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }

    function getMyBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
