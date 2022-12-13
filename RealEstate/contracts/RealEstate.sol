// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract RealEstate {

  struct Estate {
      uint id;
      string name;
      uint quadratmeter;
      string estateAddress;
      address owner;
  }

  Estate[] estate;


  function createEstate(string memory _name, string memory _estateAddress, uint _quadratmeter) public{

      Estate memory newEstate;

      newEstate.id = estate.length;
      newEstate.name = _name;
      newEstate.quadratmeter = _quadratmeter;
      newEstate.estateAddress = _estateAddress;
      newEstate.owner = msg.sender;

      estate.push(newEstate);
  }

  function sellEstate(uint _estateId, address _newOwner) public {
    Estate storage estateSell = estate[_estateId];

    require(estateSell.owner == msg.sender, "Sell not possible, you are not the owner.");

    estateSell.owner = _newOwner;
  }

  function allRealEstates() public view returns (Estate[] memory) {
    Estate[] memory result = new Estate[](estate.length);

      for (uint i = 0; i < estate.length; i++) {
      result[i] = estate[i];
    }

    return result;

  }

  function getRealEstate(uint _id) public view returns (address, string memory, uint, string memory) {
      return (
            estate[_id].owner, 
            estate[_id].name, 
            estate[_id].quadratmeter,
            estate[_id].estateAddress);
  }

}