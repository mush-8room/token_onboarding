// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// ERC721URIStorage 상속 받아 구현
// ERC721URIStorage는 ERC721에서 유연한 메타데이터 저장을 지원하는 확장형 >> 더 많은 가스비 발생
// >> token URI를 별도로 저장할 수 있도록 해줌
// ERC721 = NFT(Non-Fongible Token, 대체 불가능한 토큰)
contract GameItem is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // return_value(ERC721)("name", "symbol")
    constructor() ERC721("GameItem", "ITM") {}

    function awardItem(address player, string memory tokenURI) public returns (uint256){
        // memory : 변수를 저장할 수 있는 공간 -> 임시적으로 변환되는 장소, 함수의 외부 호출이 일어날 때마 초기화
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        _tokenIds.increment();
        return newItemId;
    }
}
