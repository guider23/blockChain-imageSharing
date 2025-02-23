const hre = require("hardhat");

async function main() {
  const ImageStorage = await hre.ethers.getContractFactory("ImageStorage");
  const contract = await ImageStorage.deploy();

  await contract.waitForDeployment();
  console.log("Contract deployed to:", await contract.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
