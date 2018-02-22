<<<<<<< Updated upstream
var ConvertLib = artifacts.require("./ConvertLib.sol");
var AvaibilityStruct = artifacts.require("./AvaibilityStruct.sol");

module.exports = function(deployer) {
	deployer.deploy(ConvertLib);
	deployer.link(ConvertLib, AvaibilityStruct);
	deployer.deploy(AvaibilityStruct);
=======
var ERC20 = artifacts.require("zeppelin-solidity/token/ERC20");
var ERC808 = artifacts.require("./ERC808.sol");

module.exports = function(deployer) {
	deployer.deploy(ERC20);
	deployer.link(ERC20, ERC808);
	deployer.deploy(ERC808);
>>>>>>> Stashed changes
};
