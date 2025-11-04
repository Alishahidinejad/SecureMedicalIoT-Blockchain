# SecureMedicalIoT-Blockchain

This repository contains a **Solidity smart contract** implementation for a post-quantum blockchain-assisted authentication protocol for medical IoT systems. The contract, `SecureRecordStorage.sol`, is designed to securely store and manage records associated with medical IoT devices, ensuring privacy, revocability, and access control.

## Features

- **Secure Storage**: Stores VT values mapped to unique HPUFR keys.
- **Access Control**: Only authorized owners can add/remove owners and manage records.
- **Record Revocation**: Records can be safely revoked without affecting other records.
- **Privacy-Preserving**: Supports secure retrieval without exposing other data.
- **Quantum-Resilient Integration**: Designed to be part of a system leveraging NIST-compliant post-quantum cryptography and blockchain.

## Contract Overview

### Structs

- `Record`: Stores the VT value and a revocation flag (`isRevoked`).

### Mappings

- `records`: Maps HPUFR keys to `Record` structs.
- `owners`: Tracks addresses with permission to manage records.

### Functions

- `addOwner(address newOwner)`: Adds a new owner (restricted to existing owners).
- `removeOwner(address owner)`: Removes an owner (restricted to existing owners).
- `storeRecord(uint256 HPUFR, uint256 VT)`: Stores a new record (owners only).
- `retrieveVT(uint256 HPUFR)`: Retrieves the VT value if the record exists and is not revoked.
- `revokeRecord(uint256 HPUFR)`: Marks a record as revoked (owners only).

## Usage

1. Deploy the contract to an Ethereum-compatible blockchain.
2. Add authorized owners using `addOwner`.
3. Store device records with `storeRecord`.
4. Retrieve values with `retrieveVT`.
5. Revoke records with `revokeRecord` when necessary.

## License

This project is licensed under the MIT License.

