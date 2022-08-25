//require("@nomiclabs/hardhat-waffle");
import "@nomiclabs/hardhat-ethers";
require("dotenv").config({ path: ".env" });



const API_TOKEN = process.env.API_TOKEN;

module.exports = {
  solidity: "0.8.9",
  network: {
    hardhat: {
      forking: {
        url: "https://ropsten.infura.io/v3/24300274ce3b40698a95581d4e0ec77b",
      }
    }
  
  },
  etherscan: {
    apiKey: API_TOKEN
  }
};
