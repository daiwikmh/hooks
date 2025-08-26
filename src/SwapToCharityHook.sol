// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;


import {BaseHook} from "v4-periphery/src/utils/BaseHook.sol";
import {IPoolManager} from "v4-core/interfaces/IPoolManager.sol";
import {Hooks} from "v4-core/libraries/Hooks.sol";
import {PoolKey} from "v4-core/types/PoolKey.sol";
import {BalanceDelta} from "v4-core/types/BalanceDelta.sol";
import {LPFeeLibrary} from "v4-core/libraries/LPFeeLibrary.sol";
import {BeforeSwapDelta, BeforeSwapDeltaLibrary} from "v4-core/types/BeforeSwapDelta.sol";
import {SwapParams} from "v4-core/types/PoolOperation.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";



contract Charity is BaseHook {
    using LPFeeLibrary for uint24;
    uint128 public charityAmount;

    error MustUseDynamicFee();

    // The default base fees we will charge
    uint24 public constant BASE_FEE = 5000; // denominated in pips (one-hundredth bps) 0.5%

    error CharityExceededMax();

    // Initialize BaseHook parent contract in the constructor
    constructor(IPoolManager _poolManager) BaseHook(_poolManager) {}

    // Required override function for BaseHook to let the PoolManager know which hooks are implemented
    function getHookPermissions()
        public
        pure
        override
        returns (Hooks.Permissions memory)
    {
        return
            Hooks.Permissions({
                beforeInitialize: false,
                afterInitialize: false,
                beforeAddLiquidity: false,
                beforeRemoveLiquidity: false,
                afterAddLiquidity: false,
                afterRemoveLiquidity: false,
                beforeSwap: true,
                afterSwap: true,
                beforeDonate: false,
                afterDonate: false,
                beforeSwapReturnDelta: false,
                afterSwapReturnDelta: false,
                afterAddLiquidityReturnDelta: false,
                afterRemoveLiquidityReturnDelta: false
            });
    }


     function _afterSwap(
        address sender,
        PoolKey calldata,
        SwapParams calldata,
        BalanceDelta delta,
        bytes calldata hookData
    ) internal override returns (bytes4, int128) {        
        return (this.afterSwap.selector, 0);
    }

    function charityCalculation(uint128 charityFee) internal returns(uint128){

    }

    
    



}