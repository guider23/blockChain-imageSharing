// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ImageStorage {
    struct Image {
        string ipfsHash;
        address owner;
    }

    Image[] public images;
    mapping(string => address) public imageOwners;

    event ImageUploaded(string ipfsHash, address owner);

    function uploadFile(string memory _hash) public {
        require(imageOwners[_hash] == address(0), "Image already uploaded!");
        images.push(Image(_hash, msg.sender)); // Store in array
        imageOwners[_hash] = msg.sender;
        emit ImageUploaded(_hash, msg.sender);
    }

    function getImages() public view returns (Image[] memory) {
        return images;
    }

    function getImageOwner(string memory _hash) public view returns (address) {
        return imageOwners[_hash];
    }
}
