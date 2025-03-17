// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SampleUnits {
    modifier betweenOneAndTwoEth(){
        require(msg.value>=1 ether && msg.value <= 2 ether, "Between one and two");
        _;
    }

    uint runUntilTimestamp;
    uint startTimestamp;

    constructor(uint startInDays){
        startTimestamp = block.timestamp + (startInDays * 1 days);
        runUntilTimestamp = startTimestamp + 7 days;        
    }

    
}