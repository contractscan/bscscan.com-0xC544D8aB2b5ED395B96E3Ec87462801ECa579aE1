// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./SafeMath.sol";
import "./ERC20.sol";
import "./ERC20Burnable.sol";
import "./Pausable.sol";
import "./Ownable.sol";

contract Starfishos is ERC20, ERC20Burnable, Pausable, Ownable {

    using SafeMath for uint256;
    uint256 private max = 1000000000 * 10 ** decimals();

    constructor() ERC20("starfishos", "SFO") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply().add(amount) <= max,"SFO:limit max");
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
    internal
    whenNotPaused
    override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}