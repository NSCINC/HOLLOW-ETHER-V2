-- SPDX-License-Identifier: Apache-2.0

-- Importar módulo HollowEngine
local HollowEngine = require("HollowEngine")

-- Endereços de exemplo para contratos simulados
local investmentContractAddress = "0x1111111111111111111111111111111111111111"
local authenticationContractAddress = "0x2222222222222222222222222222222222222222"

-- Instanciar HollowEngine com endereços simulados
local engine = HollowEngine.new(investmentContractAddress, authenticationContractAddress)

-- Função para adicionar um plano de investimento
local function addInvestmentPlan(planName, initialInvestment, monthlyReturn, annualReturn, netAnnualReturn, slots)
    print("Adding plan:", planName)
    engine:addPlan(planName, initialInvestment, monthlyReturn, annualReturn, netAnnualReturn, slots)
    print("Plan added successfully!")
end

-- Função para simular o investimento em um plano de investimento
local function investInPlan(planName, amount)
    print("Investing in plan:", planName)
    -- Suponha que `msg.sender` é um endereço simulado para o investidor
    local investorAddress = "0x3333333333333333333333333333333333333333"
    engine:invest(planName, amount)
    print("Investment completed successfully!")
end

-- Função para autenticar uma mensagem
local function authenticateMessage(messageHash)
    print("Authenticating message with hash:", messageHash)
    engine:authenticateMessage(messageHash)
    print("Message authenticated successfully!")
end

-- Etapa 1: Adicionar um Plano de Investimento
print("\nStep 1: Adding an Investment Plan")
addInvestmentPlan("economicPlan", 500, 5, 60, 300, 500)

-- Etapa 2: Investir em um Plano de Investimento
print("\nStep 2: Investing in the economicPlan")
investInPlan("economicPlan", 100)

-- Etapa 3: Autenticar uma Mensagem
print("\nStep 3: Authenticating a Message")
local messageHash = "0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890"
authenticateMessage(messageHash)

-- Fim dos testes
print("\nKernel test steps completed.")
