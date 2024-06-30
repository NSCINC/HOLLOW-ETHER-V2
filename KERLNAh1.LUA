-- Importar módulo HollowEngine
local HollowEngine = require("HollowEngine")

-- Endereços de exemplo para contratos simulados
local investmentContractAddress = "0x1111111111111111111111111111111111111111"
local authenticationContractAddress = "0x2222222222222222222222222222222222222222"

-- Instanciar HollowEngine com endereços simulados
local engine = HollowEngine.new(investmentContractAddress, authenticationContractAddress)

-- Etapa 1: Adicionar um Plano de Investimento
print("Step 1: Adding an Investment Plan")
engine:addPlan("economicPlan", 500, 5, 60, 300, 500)
print("Plan added successfully!")

-- Etapa 2: Investir em um Plano de Investimento
print("\nStep 2: Investing in the economicPlan")
-- Suponha que `msg.sender` é um endereço simulado para o investidor
local investorAddress = "0x3333333333333333333333333333333333333333"
engine:invest("economicPlan", 100)
print("Investment completed successfully!")

-- Etapa 3: Autenticar uma Mensagem
print("\nStep 3: Authenticating a Message")
local messageHash = "0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890"
engine:authenticateMessage(messageHash)
print("Message authenticated successfully!")

-- Fim dos testes
print("\nKernel test steps completed.")
