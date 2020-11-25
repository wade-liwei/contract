
## **最重要的内容**
*********
**切记：**
1. **钱包私钥（助记词）非常重要，一定要做好防护丢私钥的措施；强调多少遍也不为过。（市面上做钱包的，不管强调多少遍；都会遇到丢私钥的事；目前我们还没有遇到。）**
2. **钱包服务，在第一条的基础上；还需要做到保证不多发，这条非常重要；一旦多发出去就退不回来了**

* 遇到其他的问题有挽回余地；上边这两个问题一旦发生将无挽回余地；所以非常重要。

*********


## 环境
### 安装 OpenZeppelin CLI

* https://docs.openzeppelin.com/cli/2.8/getting-started


```bash
安装  
$ npm install @openzeppelin/cli
$ npx openzeppelin init

部署调用
$ npx oz deploy
$ npx oz send-tx
$ npx oz call
```


### 使用依赖

* https://docs.openzeppelin.com/cli/2.8/dependencies

```bash
$ mkdir token-exchange && cd token-exchange
$ npm init -y
$ npm install @openzeppelin/cli
$ npx openzeppelin init


npm install openzeppelin-solidity  
```
### 编译

* https://docs.openzeppelin.com/cli/2.8/compiling

```bash
$ npx oz compile
```


## 合约内容

### 部署
 1. 部署利息合约；
 2. 部署抵押合约，并传入利息合约的地址作为释放利息的参数；
 3. 在利息合约中，用部署利息合约的地址（资产默认在部署地址上）给抵押合约转移（transfer）准备释放的资产。

```bash
部署命令
npx oz deploy

查看部署用的地址：
npx oz accounts  
```

### 用户流程

 1. 兑换
    由部署抵押合约的地址，释放（mint）或transfer资产到用户地址；
 2. 用户调抵押接口

 * 抵押
 ```solidity
function createStake(uint256 _stake)
 ```
 * 查询抵押
```solidity
function stakeOf(address _stakeholder)
```
 3. 由部署抵押合约的地址提交利息

* 提交利息
```solidity
function BatchStakeholderAddRewards(address[] memory _stakeholders, uint256[] memory  _rewards)
```
* 用户查询利息

```solidity
function rewardOf(address _stakeholder)
```

  4. 其他查询接口

```solidity
function GetStakes()

function GetRewards()

function totalStakes()

function totalRewards()

```

 5. 用户取回抵押

```solidity

function removeStake(uint256 _stake,uint256 _reward)

```

6. 用户查询抵押本金、取回后的利息

使用用户地址作为参数，调用两个合约的balance接口
```solidity

balanceof

```



##  使用halle的rest-server替换 OpenZeppelin CLI中的模拟器或eth链节点

```bash
hallecli config keyring-backend test  --home ./key/

# if mykey exists it should be deleted
hallecli keys add  mykey --home ./key

hallecli config chain-id  200812   --home ./key  
hallecli config output json   --home ./key  
hallecli config indent true   --home ./key  
hallecli config trust-node true   --home ./key  


查询本币资产：
hallecli  q bank balances $(hallecli keys show  -a mykey) --home ./key/ --node tcp://192.168.3.100:26657

cosmos转移本币
hallecli tx send  mykey0  $(hallecli keys show  -a mykey)  100000000uhale  --gas 800000 --gas-prices 5.1uhale      -y  -b  async

主网
hallecli rest-server --laddr tcp://127.0.0.1:8545 --unlock-key  mykey   --chain-id=200812 -trace --unsafe-cors=true --home ./key --node tcp://182.92.62.71:26657

测试网
hallecli rest-server --laddr tcp://127.0.0.1:8545 --unlock-key  mykey   --chain-id=200812 -trace --unsafe-cors=true --home ./key --node tcp://192.168.3.100:26657

使用geth console工具
geth  attach  http://127.0.0.1:8545
```
