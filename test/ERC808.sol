pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ERC808.sol";

contract TestERC808 {
  ERC808 erc;
  
  function beforeAll() public {
    erc = ERC808(DeployedAddresses.ERC808());
    
    erc.addAvailabilities(1, 1, 2, ERC808.BookingStatus.REQUESTED, 1, 1500000, 1000000, 2000000, "http://www.lolcat.com");
    erc.addAvailabilities(2, 1, 8, ERC808.BookingStatus.REJECTED, 1, 1500000, 1000000, 2000000, "http://www.lolipop.com");
    erc.addAvailabilities(3, 1, 12, ERC808.BookingStatus.CANCELLED, 1, 1500000, 1000000, 2000000, "http://www.puppies.com");
  }

  function testGetMetadata() public {
    bytes32 expected = "http://www.puppies.com";
    bytes32 meta = bytes32(erc.getMetadata(3));
    
    Assert.equal(meta, expected, "Meta is not correct!");
  }

  /*function testGetAvailability() public {
    ERC808.Availability storage expected = (1, 1, 2, ERC808.BookingStatus.REQUESTED, 1, 1500000, 1000000, 2000000, "http://www.lolcat.com");
    
    Assert.equal(erc.getAvailability(1), expected, "Get Availability has a problem");
  }
  
(  
)  function testGetAvailabilities() public {
    ERC808.Availability[] storage expected = [
      (1, 1, 2, ERC808.BookingStatus.REQUESTED, 1, 1500000, 1000000, 2000000, "http://www.lolcat.com"),
      (2, 1, 8, ERC808.BookingStatus.REJECTED, 1, 1500000, 1000000, 2000000, "http://www.lolipop.com"),
      (3, 1, 12, ERC808.BookingStatus.CANCELLED, 1, 1500000, 1000000, 2000000, "http://www.puppies.com")
    ];
    
    Assert.equal(erc.getAvailabilities(), expected, "Get Availabilities has a problem");
  }*/
}
