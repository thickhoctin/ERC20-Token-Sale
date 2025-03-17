(async() => {

    const address = "0x0fC5025C764cE34df352757e82f7B5c4Df39A836";
    const abi = [
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "newUint",
				"type": "uint256"
			}
		],
		"name": "setMyUint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];


    let contractInstance = new web3.eth.Contract(abi, address);

    console.log(await contractInstance.methods.myUint().call());
    let accounts = await web3.eth.getAccounts();
	console.log(accounts)
    let txResult = await contractInstance.methods.setMyUint(345).send({from: accounts[0]});
	await contractInstance.methods.setMyUint(345).call()

    console.log(await contractInstance.methods.myUint().call());
	console.log(txResult);
})()