module.exports = {
  networks: {
    development100: {
      protocol: 'http',
      host: '192.168.3.100',
      port: 8545,
      gas: 5000000,
      gasPrice: 436,
      networkId: '*',
    },
    development1009545: {
      protocol: 'http',
      host: '192.168.3.100',
      port: 9545,
      gas: 5000000,
      gasPrice: 436,
      networkId: '*',
    },
    development200: {
      protocol: 'http',
      host: '192.168.3.200',
      port: 8545,
      gas: 1400000,
      gasPrice: 5,
      networkId: '*',
    },
    development154: {
      protocol: 'http',
      host: '192.168.3.154',
      port: 8545,
      gas: 14000000,
      gasPrice: 20000000000,
      networkId: '*',
    },
    mainnet: {
      protocol: 'http',
      host: '127.0.0.1',
      port: 8545,
      gas: 1400000,
      gasPrice: 5,
      networkId: '*',
    },
  },
};
