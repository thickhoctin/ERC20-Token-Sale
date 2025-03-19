// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenSale{

    uint public tokenPriceInWei = 1 ether;
    ERC20 public token;

    address tokenOwner;

    constructor(address _token){
        tokenOwner = msg.sender;
        token = ERC20(_token);
    }

    function purchaseACoffe() public payable{
        require(msg.value >= tokenPriceInWei, "You do not have enough eth.");
        uint tokenToTransfer = msg.value / tokenPriceInWei;
        uint remainder = msg.value - tokenToTransfer * tokenPriceInWei;
        token.transferFrom(tokenOwner, msg.sender, tokenToTransfer * 10 * token.decimals());
        payable(msg.sender).transfer(remainder); // send the rest of money back

    }


}