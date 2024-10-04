// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PropertyRegistry {
    struct Property {
        string description;
        address owner;
        bool exists;
    }

    mapping(bytes32 => Property) public properties;

    event PropertyRegistered(bytes32 indexed propertyId, string description, address indexed owner);
    event OwnershipTransferred(bytes32 indexed propertyId, address indexed newOwner);

    function registerProperty(bytes32 propertyId, string memory description) public {
        properties[propertyId] = Property(description, msg.sender, true);
        emit PropertyRegistered(propertyId, description, msg.sender);
    }

    function transferOwnership(bytes32 propertyId, address newOwner) public {
        require(properties[propertyId].exists, "Property does not exist");
        require(properties[propertyId].owner == msg.sender, "Not the owner");

        properties[propertyId].owner = newOwner;
        emit OwnershipTransferred(propertyId, newOwner);
    }

    function getProperty(bytes32 propertyId) public view returns (string memory, address) {
        require(properties[propertyId].exists, "Property does not exist");
        return (properties[propertyId].description, properties[propertyId].owner);
    }
}
