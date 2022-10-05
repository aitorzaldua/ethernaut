const hre = require("hardhat");

async function main() {

  const CoinFlipAttack = await hre.ethers.getContractFactory("CoinFlipAttack");
  const coinFlipAttack = await CoinFlipAttack.deploy();

  await coinFlipAttack.deployed();

  console.log("CoinFlipAttack deployed to:", coinFlipAttack.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });