/* same as function main(){

}
main();
*/
// doc: https://web3js.readthedocs.io/en/v1.10.0/
(async() => {
    //get number of accounts
    let accounts = await web3.eth.getAccounts();
    console.log(accounts, accounts.length);
    let balance = await web3.eth.getBalance(accounts[0]);
    console.log(balance)
    console.log(await web3.utils.fromWei(balance, "ether"));
})()