import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const  PropertyRegistryModule = buildModule("PropertyRegistryModule", (m) => {

    const registry = m.contract("PropertyRegistry");

    return { registry };
});

export default  PropertyRegistryModule;
// contract address = 0xeB8c6b381d7Bc355BdD38F8a1bddA6Bf83B01f5e