// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ExchangeCurrency {
    address public creator;
    
    mapping (string => uint) public exchangeRate;
    event ExchangeRateUpdated(string currencyName, uint exchangeRate);
    
    constructor() {
        creator = msg.sender;
    }
    
    function updateExchangeRate(string memory currencyName, uint rate) public {
        require(msg.sender == creator);        
        exchangeRate[currencyName] = rate; 
        emit ExchangeRateUpdated(currencyName, rate);
    }
    
    function convert(string memory fromCurrency, string memory toCurrency, uint amount) public view returns (uint) {
        uint fromRate = exchangeRate[fromCurrency];
        uint toRate = exchangeRate[toCurrency];
        return (amount * toRate) / fromRate;
    }
}