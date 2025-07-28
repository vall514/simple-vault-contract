# Simple Solidity Vault System 🔐

This project is a basic Ethereum smart contract that allows users to deposit and withdraw Ether.

## Features

- 📚 Uses a math library for safe addition/subtraction
- 🔁 Emits events for deposit and withdrawal
- 🔒 Prevents 0 ETH deposits and over-withdrawals using `require()`
- 🧱 Demonstrates Solidity inheritance (`VaultBase` → `VaultManager`)

## Structure

- `VaultBase` - stores user balances
- `VaultManager` - implements deposit/withdraw logic

## Deployment

You can test this contract on [Remix IDE](https://remix.ethereum.org).

1. Paste code into Remix
2. Compile with Solidity ^0.8.0
3. Deploy `VaultManager`
4. Use functions:
   - `deposit()` (send ETH)
   - `withdraw(amount)`
   - `getMyBalance()`

## Author

Valentine Achieng — @valentineachieng
