// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.26;

import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CoffeToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    event CoffePurchased(address indexed receiver, address indexed buyer);

    constructor() ERC20("CoffeToken", "CFE") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

//tu no gui 1 coffe den chinh no
    function buyOneCoffe() public 
    {
        _burn(_msgSender(), 1);
        emit CoffePurchased(_msgSender(), _msgSender());
    }

    function buyOneCoffeFrom(address account) public {
        _spendAllowance(account, _msgSender(),1);
        _burn(account,1);
        emit CoffePurchased(_msgSender(), account);
    }
}
