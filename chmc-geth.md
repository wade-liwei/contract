counterContract = web3.eth.contract([{"inputs":[{"internalType":"uint256","name":"initialSupply","type":"uint256"},{"internalType":"string","name":"tokenName","type":"string"},{"internalType":"uint8","name":"decimalUnits","type":"uint8"},{"internalType":"string","name":"tokenSymbol","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"spender","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Transfer","type":"event"},{"constant":true,"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"address","name":"spender","type":"address"}],"name":"allowance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"name":"transfer","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"value","type":"uint256"}],"name":"burn","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"name":"burnFrom","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"name":"approve","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"name":"transferFrom","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"addedValue","type":"uint256"}],"name":"increaseAllowance","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"subtractedValue","type":"uint256"}],"name":"decreaseAllowance","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"}])



initialSupply = 1000000000000000000000000000 ;
tokenName = "CHMC Token" ;
decimalUnits = 18 ;
tokenSymbol = "CHMC" ;

chmc = chmcContract.new(
   initialSupply,
   tokenName,
   decimalUnits,
   tokenSymbol,
   {
     from: web3.eth.accounts[0],


counter = counterContract.new(
   initialSupply,
	 tokenName,
	 decimalUnits,
	 tokenSymbol,
   {
     from: web3.eth.accounts[0],
     data:'0x60806040523480156200001157600080fd5b506040516200135838038062001358833981810160405260808110156200003757600080fd5b8101908080519060200190929190805160405193929190846401000000008211156200006257600080fd5b838201915060208201858111156200007957600080fd5b82518660018202830111640100000000821117156200009757600080fd5b8083526020830192505050908051906020019080838360005b83811015620000cd578082015181840152602081019050620000b0565b50505050905090810190601f168015620000fb5780820380516001836020036101000a031916815260200191505b5060405260200180519060200190929190805160405193929190846401000000008211156200012957600080fd5b838201915060208201858111156200014057600080fd5b82518660018202830111640100000000821117156200015e57600080fd5b8083526020830192505050908051906020019080838360005b838110156200019457808201518184015260208101905062000177565b50505050905090810190601f168015620001c25780820380516001836020036101000a031916815260200191505b5060405250505083600360003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508360058190555082600090805190602001906200022c9291906200026b565b508060019080519060200190620002459291906200026b565b5081600260006101000a81548160ff021916908360ff160217905550505050506200031a565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f10620002ae57805160ff1916838001178555620002df565b82800160010185558215620002df579182015b82811115620002de578251825591602001919060010190620002c1565b5b509050620002ee9190620002f2565b5090565b6200031791905b8082111562000313576000816000905550600101620002f9565b5090565b90565b61102e806200032a6000396000f3fe608060405234801561001057600080fd5b50600436106100cf5760003560e01c806342966c681161008c57806395d89b411161006657806395d89b41146103bf578063a457c2d714610442578063a9059cbb146104a8578063dd62ed3e1461050e576100cf565b806342966c68146102eb57806370a082311461031957806379cc679014610371576100cf565b806306fdde03146100d4578063095ea7b31461015757806318160ddd146101bd57806323b872dd146101db578063313ce567146102615780633950935114610285575b600080fd5b6100dc610586565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561011c578082015181840152602081019050610101565b50505050905090810190601f1680156101495780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b6101a36004803603604081101561016d57600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610628565b604051808215151515815260200191505060405180910390f35b6101c56106d2565b6040518082815260200191505060405180910390f35b610247600480360360608110156101f157600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506106dc565b604051808215151515815260200191505060405180910390f35b61026961078d565b604051808260ff1660ff16815260200191505060405180910390f35b6102d16004803603604081101561029b57600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506107a4565b604051808215151515815260200191505060405180910390f35b6103176004803603602081101561030157600080fd5b8101908080359060200190929190505050610849565b005b61035b6004803603602081101561032f57600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050610856565b6040518082815260200191505060405180910390f35b6103bd6004803603604081101561038757600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505061089f565b005b6103c76108ad565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156104075780820151818401526020810190506103ec565b50505050905090810190601f1680156104345780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b61048e6004803603604081101561045857600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505061094f565b604051808215151515815260200191505060405180910390f35b6104f4600480360360408110156104be57600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506109f4565b604051808215151515815260200191505060405180910390f35b6105706004803603604081101561052457600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050610a0b565b6040518082815260200191505060405180910390f35b606060008054600181600116156101000203166002900480601f01602080910402602001604051908101604052809291908181526020018280546001816001161561010002031660029004801561061e5780601f106105f35761010080835404028352916020019161061e565b820191906000526020600020905b81548152906001019060200180831161060157829003601f168201915b5050505050905090565b6000808214806106b457506000600460003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054145b6106bd57600080fd5b6106c8338484610a92565b6001905092915050565b6000600554905090565b60006106e9848484610bf1565b610782843361077d85600460008a73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054610dbf90919063ffffffff16565b610a92565b600190509392505050565b6000600260009054906101000a900460ff16905090565b600061083f338461083a85600460003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008973ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054610ddf90919063ffffffff16565b610a92565b6001905092915050565b6108533382610dfe565b50565b6000600360008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b6108a98282610f52565b5050565b606060018054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156109455780601f1061091a57610100808354040283529160200191610945565b820191906000526020600020905b81548152906001019060200180831161092857829003601f168201915b5050505050905090565b60006109ea33846109e585600460003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008973ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054610dbf90919063ffffffff16565b610a92565b6001905092915050565b6000610a01338484610bf1565b6001905092915050565b6000600460008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054905092915050565b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff161415610acc57600080fd5b600073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff161415610b0657600080fd5b80600460008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508173ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925836040518082815260200191505060405180910390a3505050565b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff161415610c2b57600080fd5b610c7d81600360008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054610dbf90919063ffffffff16565b600360008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002081905550610d1281600360008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054610ddf90919063ffffffff16565b600360008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508173ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040518082815260200191505060405180910390a3505050565b600082821115610dce57600080fd5b600082840390508091505092915050565b600080828401905083811015610df457600080fd5b8091505092915050565b600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff161415610e3857600080fd5b610e4d81600554610dbf90919063ffffffff16565b600581905550610ea581600360008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054610dbf90919063ffffffff16565b600360008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002081905550600073ffffffffffffffffffffffffffffffffffffffff168273ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040518082815260200191505060405180910390a35050565b610f5c8282610dfe565b610ff58233610ff084600460008873ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054610dbf90919063ffffffff16565b610a92565b505056fea265627a7a723158208cf598233551a1cca909e7fad9db5b7012ce27a567fb831d9059af8ff7004c9f64736f6c63430005100032',

   }, function (e, contract){
    console.log(e, contract);
    if (typeof contract.address !== 'undefined') {
         console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
    }
 })



//gas: '100000000',

eth.getTransactionReceipt("0xd6b5bbe79283d9cb51321043054296552b6287fe3528af9c3ddef6e79a384cea")

0x9c143957aca8077889cd387b2d17f0f3d2401510ec7cef80753dd2010d8b929e

eth.getTransactionReceipt("0x9c143957aca8077889cd387b2d17f0f3d2401510ec7cef80753dd2010d8b929e")



0xfdd978c7edfda15e719508cc7ac34df37234c50d


abi=[{"inputs":[{"internalType":"uint256","name":"initialSupply","type":"uint256"},{"internalType":"string","name":"tokenName","type":"string"},{"internalType":"uint8","name":"decimalUnits","type":"uint8"},{"internalType":"string","name":"tokenSymbol","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"spender","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Transfer","type":"event"},{"constant":true,"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"internalType":"uint8","name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"address","name":"spender","type":"address"}],"name":"allowance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"name":"transfer","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"value","type":"uint256"}],"name":"burn","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"name":"burnFrom","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"name":"approve","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"}],"name":"transferFrom","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"addedValue","type":"uint256"}],"name":"increaseAllowance","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"spender","type":"address"},{"internalType":"uint256","name":"subtractedValue","type":"uint256"}],"name":"decreaseAllowance","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"}]



myAccount=eth.accounts[0]

contractAddres="0xfdd978c7edfda15e719508cc7ac34df37234c50d"

myContract=eth.contract(abi).at(contractAddres);

myContract.balanceOf(myAccount);


myContract.transfer("0x2f3b2ab8c9a44a8d82149880907e90178d5ffe4b", 10000000000000000000, {from: myAccount, gas: 100000, gasPrice: 10})







hallecli tx send  mykey0  halle19uaj4wxf539gmqs5nzqfql5sz7x4lljtrkf6h8   10000000000uhale  --gas 800000 --gas-prices 5.1uhale      -y  -b  block  --home ./clicfg






eth.getTransactionReceipt("0xecfb5e17b5130b46caa09cc7efb2dd7578ecadbbc55f1df934abf93b36080fcb")



myContract.totalSupply()
myContract.decimals()
myContract.name()
myContract.symbol()



myContract.balanceOf(myAccount);
myContract.balanceOf(0x2f3b2ab8c9a44a8d82149880907e90178d5ffe4b);


1500000 000000000000000000

1500000000000000000000000


0x2f3b2ab8c9a44a8d82149880907e90178d5ffe4b


myContract.transfer("0x2f3b2ab8c9a44a8d82149880907e90178d5ffe4b", 1500000000000000000000000, {from: myAccount, gas: 10000, gasPrice: 6})



myContract.transfer("0x2f3b2ab8c9a44a8d82149880907e90178d5ffe4b", 1500000000000000000000000, {from: myAccount, gas: 10000, gasPrice: 6})


myContract.transfer("0xa0b2cf19c017597c5356e85fdcbc0360721c44c4", 1000000000000000000, {from: myAccount, gas: 75000, gasPrice: 6})


myContract.transfer("0x4985560a0f253b4cbcc7380bcdbb1799af9d1278", 1000000000000000000, {from: myAccount, gas: 75000, gasPrice: 6})



http://explorer.hallechain.cn/txs?txID=0

0xa0b2cf19c017597c5356e85fdcbc0360721c44c4

halle15zev7xwqzavhc56kap0ae0qrvpepc3xyp58jcu

0x4985560a0f253b4cbcc7380bcdbb1799af9d1278

halle1fxz4vzs0y5a5e0x88q9umwchnxhe6ync7nmclz


chmv项目的chmc热钱包地址： halle15zev7xwqzavhc56kap0ae0qrvpepc3xyp58jcu
                        0xa0b2cf19c017597c5356e85fdcbc0360721c44c4
hale项目的chmc热钱包地址： halle1fxz4vzs0y5a5e0x88q9umwchnxhe6ync7nmclz
                        0x4985560a0f253b4cbcc7380bcdbb1799af9d1278
      1000000000000000000
1500000000000000000000000
      1000000000000000000
1500000000000000000000000
      1000000000000000000
1500000 000000000000000000


myContract.transfer("0xa0b2cf19c017597c5356e85fdcbc0360721c44c4", 1500000000000000000000000, {from: myAccount, gas: 75000, gasPrice: 6})


myContract.transfer("0x4985560a0f253b4cbcc7380bcdbb1799af9d1278", 1500000000000000000000000, {from: myAccount, gas: 75000, gasPrice: 6})




myContract.transfer("0x6AF926C815DF163B305FD83722D0709A789A47B8", 1000000000000000000, {from: myAccount, gas: 75000, gasPrice: 6})

9.96999987e
9.96999987e+26
996999980

996999987000000000000000000
996999980000000000000000000
myContract.transfer("0x6AF926C815DF163B305FD83722D0709A789A47B8", 996999980000000000000000000, {from: myAccount, gas: 75000, gasPrice: 6})
