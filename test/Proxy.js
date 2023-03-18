const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { assert } = require("chai");
const { ethers } = require("hardhat");

describe("Proxy", function () {
  async function deployFixture() {
    const Proxy = await ethers.getContractFactory("Proxy");
    const proxy = await Proxy.deploy();

    const Logic1 = await ethers.getContractFactory("Logic1");
    const logic1 = await Logic1.deploy();

    const Logic2 = await ethers.getContractFactory("Logic2");
    const logic2 = await Logic2.deploy();

    return { proxy, logic1, logic2 };
  } 

  it("Should work with logic1", async function () {
    const { lock, unlockTime } = await loadFixture(deployFixture);

    expect(await lock.unlockTime()).to.equal(unlockTime);
  });

  it("Should work with upgrades", async function () {
    const { lock, owner } = await loadFixture(deployFixture);

    expect(await lock.owner()).to.equal(owner.address);
  });
});
