# contract



Truffle v5.1.44 (core: 5.1.44)
Solidity v0.5.16 (solc-js)
Node v10.16.1
Web3.js v1.2.1



hallecli config keyring-backend test  --home ./key/

# if mykey exists it should be deleted
hallecli keys add  deployChmc --home ./key


hallecli config chain-id  200812   --home ./key  
hallecli config output json   --home ./key  
hallecli config indent true   --home ./key  
hallecli config trust-node true   --home ./key  


 hallecli rest-server --laddr tcp://127.0.0.1:9545 --unlock-key  deployChmc   --chain-id=200812 --trace --unsafe-cors=true --home .hallecli-contract/ --node tcp://182.92.62.71:26657

geth  attach  http://127.0.0.1:9545

1000000000000000000  000000000
