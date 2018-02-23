const ERC808 = artifacts.require("./ERC808.sol");
let instance;

contract('ERC808', (accounts) => {
  before(async () => {
    instance = await ERC808.deployed();
    
    instance.addAvailabilities(1, 1, 2, 0 /*E*/, 1, 1500000, 1000000, 2000000, "http://www.lolcat.com");
    instance.addAvailabilities(2, 1, 8, 1 /*E*/, 1, 1500000, 1000000, 2000000, "http://www.lolipop.com");
    instance.addAvailabilities(3, 1, 12, 2 /*E*/, 1, 1500000, 1000000, 2000000, "http://www.puppies.com");
  });
  it("should have a correct meta data", async () => {
    const meta = await instance.getMetadata.call(3);
    console.log("test", meta)
    assert.equal(meta.valueOf(), "http://www.puppies.com", "Meta is not correct!");
  });
  it("should be available", async () => {
    const availability = await instance.getAvailability.call(2);
    console.log("test2", availability)
    assert.equal(availability, "http://www.puppies.com", "Meta is not correct!");
  });
  it("should be availabilities", async () => {
    const availabilities = await instance.getListAvailabilities.call();
    console.log("test2", availabilities)
    assert.equal(availabilities, "http://www.puppies.com", "Meta is not correct!");
  });
});

