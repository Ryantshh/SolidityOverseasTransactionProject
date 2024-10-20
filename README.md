# **OverseasTransaction Smart Contract**

## **Project Overview**

This project is a decentralized **escrow service** smart contract designed to handle **overseas transactions for goods**. In traditional overseas transactions, remittance firms and manual processes introduce delays. This smart contract replaces that with a faster, transparent, and trustless solution where a **buyer** and a **seller** interact directly using Ethereum.

The smart contract ensures that:
1. The **buyer** deposits funds into the contract.
2. The **buyer** confirms receipt of goods.
3. The **seller** withdraws the funds once the goods have been received.

The contract provides the security of escrow without the need for intermediaries, offering fast, secure transactions on the Ethereum blockchain.

---

## **How the Smart Contract Works**

1. **Deploy the Contract**:
   - The buyer deploys the contract, providing the seller's address and the transaction amount.
   
2. **Deposit Funds**:
   - The buyer deposits the agreed transaction amount into the contract.
   
3. **Confirm Receipt**:
   - Once the buyer receives the goods, they call the `confirmReceipt()` function to confirm the transaction.

4. **Withdraw Funds**:
   - The seller can withdraw the funds only after the buyer confirms receipt. The funds are transferred to the seller’s address.

---

## **Prerequisites**

- **MetaMask**: Install the MetaMask browser extension and create a wallet if you don’t have one. It will be used to deploy and interact with the smart contract.
- **Remix IDE**: Remix is an online IDE used to write, compile, and deploy Ethereum smart contracts. Go to [Remix IDE](https://remix.ethereum.org/).
- **Test Network**: Use the **Goerli** or **Sepolia** test network for deploying the contract. You will need test ETH to cover gas fees (which can be obtained from faucets like [Goerli Faucet](https://goerlifaucet.com/)).

---

## **Steps to Deploy the Smart Contract**

### **1. Open Remix IDE**
- Go to [Remix IDE](https://remix.ethereum.org/).
  
### **2. Create a New Solidity File**
- In the **File Explorer** (left sidebar), click the **"+"** icon to create a new file.
- Name the file `OverseasTransaction.sol`.
- Copy and paste the contract code above into the file.

### **3. Compile the Contract**
- In the left sidebar, click the **Solidity Compiler** tab (the icon looks like a wrench).
- Select the **compiler version** `0.8.x`.
- Click **"Compile OverseasTransaction.sol"**.
  
  - If the contract compiles without errors, you’re ready to deploy it.

### **4. Connect MetaMask and Select a Test Network**
- Ensure that your **MetaMask** wallet is connected to Remix.
- Switch to a test network (like **Goerli** or **Sepolia**):
  - In MetaMask, click the network dropdown and select the **Goerli Test Network** or **Sepolia Test Network**.
  - Ensure you have some test ETH from a faucet to cover gas fees.

### **5. Deploy the Contract**
- Go to the **"Deploy & Run Transactions"** tab (Ethereum icon on the left).
- From the **Environment** dropdown, select **Injected Web3 (MetaMask)** to connect to your MetaMask account.
  
- Set the constructor parameters:
  1. **Seller's Address**: Enter the seller’s Ethereum address.
  2. **Transaction Amount**: Enter the transaction amount in **wei** (1 Ether = `1000000000000000000` wei).

- Click **Deploy**.
- MetaMask will open a window asking for confirmation. Confirm the transaction to deploy the contract.

### **6. Deployment Complete**
- After the contract is deployed, the contract's address will appear in the **Deployed Contracts** section.
- You can now interact with the contract using the functions.

---

## **How to Test the Contract**

Once the contract is deployed, you can test the functionality by interacting with it through the buttons displayed in the **Deployed Contracts** section in Remix.

### **1. Deposit Funds (Buyer)**
- In the **Deployed Contracts** section, find the `depositFunds` button.
- Before clicking the button, specify the amount of Ether in **wei** in the **Value (ETH)** field in the Remix **Deploy & Run Transactions** tab.
  
  Example: To deposit **1 Ether**, enter `1000000000000000000` in the **Value** field.

- Click **depositFunds**.
- Confirm the transaction in MetaMask. The funds will now be stored in the contract, and the contract’s balance will be updated.

### **2. Confirm Receipt of Goods (Buyer)**
- Once the goods are received, the buyer needs to confirm this by clicking the **confirmReceipt** button.
- This will update the contract state, setting `goodsReceived` to `true`.

### **3. Withdraw Funds (Seller)**
- After the buyer confirms the receipt of goods, the seller can withdraw the funds.
- Switch to the **seller’s MetaMask account** and click the **withdrawFunds** button.
- Confirm the transaction in MetaMask, and the funds will be transferred to the seller’s address.

---

## **Additional Information**

### **Gas Costs**
- Deploying and interacting with the smart contract on Ethereum requires gas (transaction fees).
- The gas costs are deducted from the account that initiates the transaction. Make sure you have enough test ETH in MetaMask before proceeding with testing.

### **Important Notes**
- **Immutable Contract**: Once deployed, the contract cannot be changed. Ensure all parameters are correct before deploying.
- **Buyer and Seller Addresses**: Make sure that the correct addresses are provided during deployment. These cannot be changed later.

### **Handling Errors**
- If you encounter errors (e.g., `invalid BigNumber string`), ensure that you're passing the correct values for the `seller` address and `transactionAmount`. The amount should be in **wei**, and the address should be a valid Ethereum address.

---

## **Conclusion**

The **OverseasTransaction** smart contract provides a simple and secure escrow system for handling overseas transactions for goods. By leveraging Ethereum’s blockchain, the contract eliminates the need for intermediaries and provides trustless security for both buyers and sellers. With easy deployment and interaction via Remix and MetaMask, this project offers a decentralized solution to traditional remittance processes.

