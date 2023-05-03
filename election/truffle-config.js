module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    foundry: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, "https://api.foundry.tech/v1/<NETWORK_ID>"),
      network_id: "*",
      gasPrice: 1,
      gas: 2,
   }
    develop: {
      port: 8545
    }
  }
};
