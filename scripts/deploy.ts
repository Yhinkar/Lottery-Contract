import { ethers } from "hardhat";

async function main() {

  const Lottery= await ethers.getContractFactory(
    "Lotterycontract"
  );
  const lottery= await Lottery.deploy(2);
  await lottery.deployed();

  console.log("Lottery contract deployed to: ", lottery.address);

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });