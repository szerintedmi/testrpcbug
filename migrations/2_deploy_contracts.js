var MathLib = artifacts.require("./MathLib.sol");
var Test = artifacts.require("./Test.sol");

module.exports = function(deployer) {
  deployer.deploy(MathLib);
  deployer.link(MathLib, Test);
  deployer.deploy(Test);
};
