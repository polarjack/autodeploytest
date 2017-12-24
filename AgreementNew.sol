pragma solidity ^0.4.11;

contract Agreement {
  address public admin;
  bool life;

  address public host;
  uint public availableStartTime;
  uint public availableEndTime;
  uint public pricePerDay;

  address public user;
  uint public validStartTime;
  uint public validEndTime;

  modifier onlyadmin() {
    require(admin == msg.sender);
    _;
  }

  modifier onlyhost() {
    require(host == msg.sender);
    _;
  }

  modifier onlyuser() {
    require(user == msg.sender);
    _;
  }

  modifier onlylife() {
    require(life == true);
    _;
  }

  function Agreement(address _host, uint _startTime, uint _endTime, uint _price) public {
    admin = msg.sender;

    host = _host;
    availableStartTime = _startTime;
    availableEndTime = _endTime;
    pricePerDay = _price;
    
    life = true;
  }

  function book(address _user, uint _startTime, uint _endTime) public {
    user = _user;
    validStartTime = _startTime;
    validEndTime = _endTime;
  }

  function disableContract() public onlyadmin{
    life = false;
  }

  function () payable {}
}
