const hre  = require('hardhat');

async function main() {

    const sound = await hre.ethers.deployContract("NFTSound", hre.ethers.getSigners());

    await sound.waitForDeployment();

    console.log(sound.target);
    
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });