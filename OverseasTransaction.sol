// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OverseasTransaction {

    // State variables
    address public immutable buyer;        // Immutable to save gas
    address public immutable seller;       // Immutable to save gas
    uint public transactionAmount;         // Stores the amount of Ether to be transferred
    bool public goodsReceived;             // Stores the status of goods received

    // Events
    event TransactionCreated(address indexed buyer, address indexed seller, uint amount);
    event FundsDeposited(address indexed buyer, uint amount);
    event GoodsReceived(address indexed buyer);
    event FundsReleased(address indexed seller, uint amount);

    // Modifier to allow only buyer to perform certain actions
    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only the buyer can perform this action.");
        _;
    }

    // Modifier to allow only seller to perform certain actions
    modifier onlySeller() {
        require(msg.sender == seller, "Only the seller can perform this action.");
        _;
    }

    // Constructor - initializes the contract with buyer, seller, and transaction amount
    constructor(address _seller, uint _transactionAmount) payable {
        require(_seller != address(0), "Seller address cannot be zero");
        require(_transactionAmount > 0, "Transaction amount must be greater than zero");

        buyer = msg.sender;                        // Set the buyer as the contract creator
        seller = _seller;                          // Set the seller's address
        transactionAmount = _transactionAmount;    // Set the transaction amount

        emit TransactionCreated(buyer, seller, _transactionAmount);  // Log the creation event
    }

    // Buyer deposits funds into the contract
    function depositFunds() public payable onlyBuyer {
        require(msg.value == transactionAmount, "You must deposit the exact transaction amount.");
        emit FundsDeposited(msg.sender, msg.value);  // Log the deposit event
    }

    // Buyer confirms receipt of goods
    function confirmReceipt() public onlyBuyer {
        require(!goodsReceived, "Goods have already been confirmed received.");
        goodsReceived = true;                  // Update storage with receipt confirmation
        emit GoodsReceived(msg.sender);        // Log the receipt confirmation
    }

    // Seller withdraws funds once buyer confirms receipt
    function withdrawFunds() public onlySeller {
        require(goodsReceived, "Goods must be confirmed received by the buyer before funds are released.");
        uint amount = transactionAmount;       // Store the transaction amount in memory
        transactionAmount = 0;                 // Prevent reentrancy attacks by setting it to zero
        (bool success, ) = seller.call{value: amount}("");  // Use call to transfer Ether safely
        require(success, "Transfer failed.");  // Check if the transfer was successful
        emit FundsReleased(seller, amount);    // Log the release of funds
    }

    // Fallback function to handle any unexpected Ether sent to the contract
    fallback() external payable {}

    // Receive function to accept funds sent directly to the contract
    receive() external payable {}
}
