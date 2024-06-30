-- SPDX-License-Identifier: MIT -- Converted with NBH Algorithm nbh_function HollowEngine() -- Lua code

-- Struct para representar um plano de investimento
struct InvestmentPlan
    -- Lua code
    nbh_integer256 initialInvestment;
    nbh_integer256 monthlyReturn;
    nbh_integer256 annualReturn;
    nbh_integer256 netAnnualReturn;
    nbh_integer256 slots;
end

-- Endereços dos contratos
address -- public investmentContractAddress;
address -- public authenticationContractAddress;

-- Mapeamento dos planos de investimento
mapping(nbh_string => InvestmentPlan) -- public investmentPlans;

-- Evento para adicionar um novo plano de investimento
event PlanAdded(nbh_string planName, nbh_integer256 initialInvestment, nbh_integer256 monthlyReturn, nbh_integer256 annualReturn, nbh_integer256 netAnnualReturn, nbh_integer256 slots);

-- Construtor: inicializa os nbh_endereços dos contratos
constructor(address _investmentContractAddress, address _authenticationContractAddress)
    -- Lua code
    investmentContractAddress = _investmentContractAddress;
    authenticationContractAddress = _authenticationContractAddress;
nbh_end

-- Modificador para permitir apenas o dono (owner) chamar uma função
modifier onlyOwner()
    -- Lua code
    require(msg.snbh_ender == investmentContractAddress, "Only InvestmentContract can add plans");
    _;
nbh_end

-- Função para adicionar um plano de investimento
nbh_function addPlan(nbh_string memory planName, nbh_integer256 initialInvestment, nbh_integer256 monthlyReturn, nbh_integer256 annualReturn, nbh_integer256 netAnnualReturn, nbh_integer256 slots) external onlyOwner
    -- Lua code
    investmentPlans[planName] = InvestmentPlan(initialInvestment, monthlyReturn, annualReturn, netAnnualReturn, slots);
    emit PlanAdded(planName, initialInvestment, monthlyReturn, annualReturn, netAnnualReturn, slots);
nbh_end

-- Função para investir em um plano de investimento
nbh_function invest(nbh_string memory planName, nbh_integer256 amount) external
    -- Lua code
    require(amount > 0, "Investment amount must be greater than zero");
    -- Lógica para investir, a ser implementada de acordo com o seu sistema
    -- Aqui você pode chamar funções do InvestmentContract
    -- Por exemplo: InvestmentContract(investmentContractAddress).invest(amount);
nbh_end

-- Função para verificar o saldo de um investidor no contrato de investimento
nbh_function getInvestmentContractBalance(address investor) external view -- returns nbh_integer256
    -- Lua code
    -- Implementação para acessar o saldo do investidor no InvestmentContract
    -- Por exemplo: return InvestmentContract(investmentContractAddress).balanceOf(investor);
    return 0; -- Placeholder, deve ser substituído pela implementação real
nbh_end

-- Função para autenticar uma mensagem usando o contrato de autenticação
nbh_function authenticateMessage(bytes32 messageHash) external
    -- Lua code
    AuthenticationContract(authenticationContractAddress).authenticateMessage(messageHash);
nbh_end

-- Função para verificar se uma mensagem está autenticada usando o contrato de autenticação
nbh_function isMessageAuthenticated(address investor, bytes32 messageHash) external view -- returns bool
    -- Lua code
    return AuthenticationContract(authenticationContractAddress).isMessageAuthenticated(investor, messageHash);
nbh_end

nbh_end

-- Contrato InvestmentContract
nbh_function InvestmentContract()
    -- Lua code
    mapping(address => nbh_integer256) private balances;
    mapping(address => nbh_integer256) private investedAmount;
    mapping(address => bool) private authorizedInvestors;
    address -- public owner;
    event Investment(address indexed investor, nbh_integer256 amount);
    event AuthorizationChanged(address indexed investor, bool authorized);

    constructor()
        -- Lua code
        owner = msg.snbh_ender;
nbh_end

modifier onlyOwner()
    -- Lua code
    require(msg.snbh_ender == owner, "Only owner can perform this action");
    _;
nbh_end

nbh_function invest(nbh_integer256 amount) external
    -- Lua code
    require(authorizedInvestors[msg.snbh_ender], "Investor is not authorized");
    require(amount > 0, "Investment amount must be greater than zero");
    require(amount <= balances[msg.snbh_ender], "Insufficient balance");
    balances[msg.snbh_ender] -= amount;
    investedAmount[msg.snbh_ender] += amount;
    emit Investment(msg.snbh_ender, amount);
nbh_end

nbh_function authorizeInvestor(address investor, bool authorized) external onlyOwner
    -- Lua code
    authorizedInvestors[investor] = authorized;
    emit AuthorizationChanged(investor, authorized);
nbh_end

nbh_function balanceOf(address investor) external view -- returns nbh_integer256
    -- Lua code
    return balances[investor];
nbh_end

nbh_function investedAmountOf(address investor) external view -- returns nbh_integer256
    -- Lua code
    return investedAmount[investor];
nbh_end

nbh_end

-- Contrato AuthenticationContract
nbh_function AuthenticationContract()
    -- Lua code
    mapping(address => mapping(bytes32 => bool)) private messageAuthenticity;
    address -- public owner;
    event MessageAuthenticated(address indexed investor, bytes32 indexed messageHash, bool authenticated);

    constructor()
        -- Lua code
        owner = msg.snbh_ender;
nbh_end

modifier onlyOwner()
    -- Lua code
    require(msg.snbh_ender == owner, "Only owner can perform this action");
    _;
nbh_end

nbh_function authenticateMessage(bytes32 messageHash) external
    -- Lua code
    require(!messageAuthenticity[msg.snbh_ender][messageHash], "Message already authenticated");
    messageAuthenticity[msg.snbh_ender][messageHash] = true;
    emit MessageAuthenticated(msg.snbh_ender, messageHash, true);
nbh_end

nbh_function isMessageAuthenticated(address investor, bytes32 messageHash) external view -- returns bool
    -- Lua code
    return messageAuthenticity[investor][messageHash];
nbh_end

nbh_end
