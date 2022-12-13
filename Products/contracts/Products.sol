// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Products {

  struct Product {
    string name;
    string purpose;
    uint price;
  }

  Product[] public products;

  string public productName;
  uint256 public price;
  address public currentOwner;
  address public newOwner;

  function addProduct(string memory _name, string memory _purpose, uint _price) public {
    Product memory productIdea = Product(_name, _purpose, _price);
    products.push(productIdea);
  }

  function allProducts() public view returns (Product[] memory) {
    Product[] memory result = new Product[](products.length);

      for (uint i = 0; i < products.length; i++) {
      result[i] = products[i];
    }

    return result;

  }

}