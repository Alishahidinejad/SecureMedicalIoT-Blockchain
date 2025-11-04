// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureRecordStorage {
    // Struct to store VT values with HPUFR as the key and isRevoked flag
    struct Record {
        uint256 VT;
        bool isRevoked;
    }

    // Mapping to store records
    mapping(uint256 => Record) private records;

    // Mapping to store the addresses of the owners
    mapping(address => bool) private owners;

    // Modifier to restrict access to the owners
    modifier onlyOwner() {
        require(owners[msg.sender], "Not authorized");
        _;
    }

    // Constructor to set the initial owner
    constructor() {
        owners[msg.sender] = true;
    }

    // Function to add a new owner, restricted to existing owners
    function addOwner(address newOwner) public onlyOwner {
        owners[newOwner] = true;
    }

    // Function to remove an owner, restricted to existing owners
    function removeOwner(address owner) public onlyOwner {
        owners[owner] = false;
    }

    // Function to store a record, restricted to the owners
    function storeRecord(uint256 HPUFR, uint256 VT) public onlyOwner {
        records[HPUFR] = Record(VT, false);
    }

    // Function to retrieve a VT value using the HPUFR key
    function retrieveVT(uint256 HPUFR) public view returns (uint256) {
        require(records[HPUFR].VT != 0 && !records[HPUFR].isRevoked, "Record not found or revoked");
        return records[HPUFR].VT;
    }

    // Function to revoke a record, restricted to the owners
    function revokeRecord(uint256 HPUFR) public onlyOwner {
        require(records[HPUFR].VT != 0, "Record not found");
        records[HPUFR].isRevoked = true;
    }
}
