Claro, aqui está o código JavaScript combinado em um único arquivo:

```javascript
const Web3 = require('web3');

const contractABI = [
    {
        "inputs": [],
        "name": "registerUser",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "authenticateUser",
        "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }],
        "stateMutability": "view",
        "type": "function"
    }
];

const contractAddress = 'YOUR_CONTRACT_ADDRESS';
const web3 = new Web3('http://localhost:8080');
const contract = new web3.eth.Contract(contractABI, contractAddress);

async function registerUser(passwordHash) {
    try {
        const accounts = await web3.eth.getAccounts();
        await contract.methods.registerUser(passwordHash).send({ from: accounts[0] });
        console.log(`User registered successfully`);
    } catch (error) {
        console.error('Error registering user:', error);
    }
}

async function authenticateUser(passwordHash) {
    try {
        const result = await contract.methods.authenticateUser(passwordHash).call();
        console.log(`Authenticated user: ${result}`);
    } catch (error) {
        console.error('Error authenticating user:', error);
    }
}

// Exemplo de uso
const passwordHash = 'PASSWORD_HASH';

// Registra um novo usuário
registerUser(passwordHash);

// Verifica a autenticação do usuário
authenticateUser(passwordHash);
```

const Web3 = require('web3');

const contractABI = [
    {
        "inputs": [],
        "name": "registerUser",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "authenticateUser",
        "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }],
        "stateMutability": "view",
        "type": "function"
    }
];

const contractAddress = 'YOUR_CONTRACT_ADDRESS';
const web3 = new Web3('http://localhost:8080');
const contract = new web3.eth.Contract(contractABI, contractAddress);

async function registerUser(passwordHash) {
    try {
        const accounts = await web3.eth.getAccounts();
        await contract.methods.registerUser(passwordHash).send({ from: accounts[0] });
        console.log(`User registered successfully`);
    } catch (error) {
        console.error('Error registering user:', error);
    }
}

async function authenticateUser(passwordHash) {
    try {
        const result = await contract.methods.authenticateUser(passwordHash).call();
        console.log(`Authenticated user: ${result}`);
    } catch (error) {
        console.error('Error authenticating user:', error);
    }
}

// Exemplo de uso
const passwordHash = 'PASSWORD_HASH';

// Registra um novo usuário
registerUser(passwordHash);

// Verifica a autenticação do usuário
authenticateUser(passwordHash);
