// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; // solidity의 버전 지정

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// ERC20을 상속받아서 GLDToken 생성
// ERC20 : 대체 가능한 토큰(fungible token)의 표준
contract GLDToken is ERC20 {
    // 생성자 : 배포될 때 호출됨
    // constructor가 값을 전달 받을 경우 migration.js > deploy 함수에 ,로 구분하여 값을 넣어줌
    constructor(uint256 initialSupply) ERC20("Gold", "GLD"){
        _mint(msg.sender, initialSupply);
    }

    // ERC20에 존재하는 decimals()를 override
    function decimals() public view virtual override returns (uint8){
        // 토큰의 양을 나눌 수 있는 소수 자릿수
        return 16;
    }
}
