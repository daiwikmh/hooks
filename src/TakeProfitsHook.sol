// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import {BaseHook} from "v4-periphery/src/utils/BaseHook.sol";
// import {IPoolManager} from "v4-core/interfaces/IPoolManager.sol";
// import {Hooks} from "v4-core/libraries/Hooks.sol";
// import {PoolKey} from "v4-core/types/PoolKey.sol";
// import {BalanceDelta} from "v4-core/types/BalanceDelta.sol";
// import {LPFeeLibrary} from "v4-core/libraries/LPFeeLibrary.sol";
// import {BeforeSwapDelta, BeforeSwapDeltaLibrary} from "v4-core/types/BeforeSwapDelta.sol";
// import {SwapParams} from "v4-core/types/PoolOperation.sol";
// import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

// contract TakeProfitsHook is BaseHook, ERC1155 {
   


//     using StateLibrary for IPoolManager;
//     using FixedPointMathLib for int24;
    

//     error InvalidOrder();
//     error NothingToClaim();
//     error NotEnoughToClaim();


//     //Poolid => Tick => Zeroforone /oneforzero

//     mapping(Poolid _poolId => 
//             mapping(int24 tickToSellAt => 
//                 mapping(bool zeroForOne => uint256 inputAmount))) public pendingorders;
       
    
//     // Initialize BaseHook parent contract in the constructor
//     constructor(IPoolManager _poolManager, string memory uri) BaseHook(_poolManager)     ERC1155(uri) {
//         updateMovingAverage();
//     }

//     // Required override function for BaseHook to let the PoolManager know which hooks are implemented
//     function getHookPermissions()
//         public
//         pure
//         override
//         returns (Hooks.Permissions memory)
//     {
//         return
//             Hooks.Permissions({
//                 beforeInitialize: true,
//                 afterInitialize: false,
//                 beforeAddLiquidity: false,
//                 beforeRemoveLiquidity: false,
//                 afterAddLiquidity: false,
//                 afterRemoveLiquidity: false,
//                 beforeSwap: true,
//                 afterSwap: true,
//                 beforeDonate: false,
//                 afterDonate: false,
//                 beforeSwapReturnDelta: false,
//                 afterSwapReturnDelta: false,
//                 afterAddLiquidityReturnDelta: false,
//                 afterRemoveLiquidityReturnDelta: false
//             });
//     }

//     function _beforeInitialize(
//         address,
//         PoolKey calldata key,
//         BalanceDelta calldata,
//         BeforeSwapDelta calldata
//     ) internal override {
//         // Custom logic for before initialization can be added here
//         return this.beforeInitialize.selector;
//     }

//     function _beforeSwap(
//         address,
//         PoolKey calldata key,
//         BalanceDelta calldata,
//         BeforeSwapDelta calldata beforeSwapDelta,
//         SwapParams calldata
//     ) internal override {
//         // Custom logic for before swap can be added here
//         // For example, you could implement logic to take profits based on certain conditions
//         return this.beforeSwap.selector;
    
//     }


//     function _afterSwap(
//         address,
//         PoolKey calldata key,
//         BalanceDelta calldata,
//         BeforeSwapDelta calldata beforeSwapDelta,
//         SwapParams calldata
//     ) internal override {
//         // Custom logic for after swap can be added here
//         // This could include actions like updating state or triggering events
//     return this.afterSwap.selector;
//     }
// }

// /*
// users to specify in the pool that
// at which tick transfer is happening
// how many tokens 
// which direction (in or out) Assume we always round down


// 2. if the tick spacing is not one then ideantify its spacing

// 3.save their order into onchain storage

// 4.mint the user their claim tokens which will represent their order

// 5.transfer the input tokens from their wallet to the hook contract 
// */


// mapping(uint orderId => uint claimSupply) claimTokenSupply;

// function getOrderId(
//     PoolKey calldata key,
//     int24 tickToSellAt,
//     bool zeroForOne
// ) internal pure returns (uint) {
//     // Generate a unique order ID based on the pool key, tick, and direction
//     return uint(keccak256(abi.encode(key, tickToSellAt, zeroForOne)));
// }




// function getLowerUsableTick(
//         int24 _tick,
//         int24 _tickSpacing
//     ) internal view returns (int24) {
//         // Calculate the lower usable tick based on the pool key and current tick
//         int24 intervals = _tick / _tickSpacing;
//         if(_tick < 0 && _tick % _tickSpacing != 0) {
//             --intervals; // Adjust for negative ticks

//         //actual usable tick is intervals * tickSpacing
//         //example: -2* 60 = -120
        
//         return intervals * _tickSpacing;

    
//         }

// }
