// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TokenWallet {

    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;

    uint256 public totalSupply = 1000 * 10 ** 18;

    mapping(address => uint256) private balances;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address account)
        public
        view
        returns (uint256)
    {
        return balances[account];
    }

    function transfer(address to, uint256 amount)
        public
        returns (bool)
    {
        require(to != address(0), "Invalid address");
        require(
            balances[msg.sender] >= amount,
            "Insufficient balance"
        );

        balances[msg.sender] -= amount;
        balances[to] += amount;

        return true;
    }
}
