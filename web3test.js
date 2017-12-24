const fs = require('fs');
const Web3 = require('web3');
const solc = require('solc');

const web3 = new Web3(new Web3.providers.HttpProvider("http://140.119.163.105:8545"));
const eth = web3.eth;



var todo = fs.readFileSync('./AgreementNew.sol', 'utf8', function(err, data) {
  if(!err) {
    return data
  }
  else {
    return err
  }
})
todo = todo.toString()

var result = solc.compile(todo, 1)


// console.log(todo)
console.log(result.contracts)

// console.log(eth.coinbase);