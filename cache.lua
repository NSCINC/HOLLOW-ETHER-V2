-- SPDX-License-Identifier: MIT

-- Estrutura para armazenar detalhes do plano de investimento
local InvestmentPlan = {
    initialInvestment = 0,
    monthlyReturn = 0,
    annualReturn = 0,
    netAnnualReturn = 0,
    slots = 0
}

-- Mapeamento para armazenar dados em cache
local cache = {}

-- Evento para registrar adição de plano de investimento
local function InvestmentPlanAdded(planName, initialInvestment, slots)
    print("Plan added:", planName)
    -- Não é necessário emitir eventos em Lua, então apenas imprimimos uma mensagem
end

-- Função para adicionar um plano de investimento ao cache
local function addInvestmentPlan(planName, initialInvestment, monthlyReturn, annualReturn, netAnnualReturn, slots)
    print("Adding plan:", planName)
    assert(cache[planName] == nil, "Plan already exists")
    cache[planName] = {
        initialInvestment = initialInvestment,
        monthlyReturn = monthlyReturn,
        annualReturn = annualReturn,
        netAnnualReturn = netAnnualReturn,
        slots = slots
    }
    InvestmentPlanAdded(planName, initialInvestment, slots)
end

-- Função para consultar os detalhes de um plano de investimento no cache
local function getInvestmentPlanDetails(planName)
    print("Fetching details for plan:", planName)
    local plan = cache[planName]
    assert(plan.initialInvestment > 0, "Plan does not exist")
    return plan.initialInvestment, plan.monthlyReturn, plan.annualReturn, plan.netAnnualReturn, plan.slots
end

-- Exemplo de uso das funções definidas

-- Etapa 1: Adicionar um plano de investimento
print("\nStep 1: Adding an Investment Plan")
addInvestmentPlan("economicPlan", 500, 5, 60, 300, 500)

-- Etapa 2: Consultar detalhes de um plano de investimento
print("\nStep 2: Fetching Investment Plan Details")
local initialInvestment, monthlyReturn, annualReturn, netAnnualReturn, slots = getInvestmentPlanDetails("economicPlan")
print("Initial Investment:", initialInvestment)
print("Monthly Return:", monthlyReturn)
print("Annual Return:", annualReturn)
print("Net Annual Return:", netAnnualReturn)
print("Slots:", slots)

-- Fim dos exemplos
print("\nLua code execution completed.")
