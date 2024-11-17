pragma solidity ^0.8.0;

contract ExamplePayableContract {
    event FundsReceived(address indexed sender, uint amount);
    event FundsWithdrawn(address indexed recipient, uint amount);

    function receiveFunds() external payable {
        emit FundsReceived(msg.sender, msg.value);
    }

    function withdrawFunds(address payable recipient, uint amount) external {
        require(amount <= address(this).balance, "Insufficient balance");
        recipient.transfer(amount);
        emit FundsWithdrawn(recipient, amount);
    }
}


