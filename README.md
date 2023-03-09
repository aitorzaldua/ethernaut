# ETHERNAUT

Ethernaut is the CTF challenges created by Open Zeppelin:

https://ethernaut.openzeppelin.com/

The most common networks to work with are Goerly and Mumbai. Recently, Open Zeppelin has added the option to deploy the contracts in any network of your preference.

## ethernautContracts folder

The original contracts. All the contracts in this folder have at least one vulnerability that
makes them susceptibles to attack.

It includes all the contracts that I already hacked.

## ethernautSolutions folder

The attack contracts. By executing this contract you can hack the corresponding contract.

It The address of the original contract, defined in Ethernaut as the instance, is required.

There are several ways to deploy and execute the attack:

1.- Deploy the contract with RemixIDE and execute the function, usually called, attack() 

2.- Deploy the contract by creating a deploy script in scripts folder, verify the code and run the function in etherscan.




