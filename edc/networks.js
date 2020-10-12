module.exports = {
  networks: {
    development: {
      protocol: 'http',
      host: '192.168.3.100',
      port: 8545,
      gas: 5000000,
      gasPrice: 5e9,
      networkId: '*',
    },
  },
};
