const GameItem = artifacts.require("GameItem");

module.exports = function (deployer) {
  // constructor가 받는 변수의 값을 ,로 구분하여 넣어줌
  deployer.deploy(GameItem);
};
