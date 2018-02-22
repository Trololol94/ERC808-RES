var ConvertLib = artifacts.require("./ConvertLib.sol");
var AvaibilityStruct = artifacts.require("./AvaibilityStruct.sol");

module.exports = function(deployer) {
	deployer.deploy(ConvertLib);
	deployer.link(ConvertLib, AvaibilityStruct);
	deployer.deploy(AvaibilityStruct);
};
