// We reference the smart contract Election.sol as Election
var Election = artifacts.require("./Election.sol");

// Adds Election to the manifest of deployed contracts to ensure deployment when we run migrations
module.exports = function(deployer) {
  deployer.deploy(Election);
};