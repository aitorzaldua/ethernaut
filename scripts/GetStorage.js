const hre = require("hardhat");

async function main() {

  const GetStorage = await hre.ethers.getContractFactory("GetStorage");
  const getStorage = await GetStorage.deploy();

  await getStorage.deployed();

  console.log("GetStorage deployed to:", getStorage.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });