-- SPDX-License-Identifier: MIT

-- Definindo a estrutura de dados para os planos de investimento
InvestmentPlan = {
    initialInvestment = 0,
    monthlyReturn = 0,
    annualReturn = 0,
    netAnnualReturn = 0,
    slots = 0
}

-- Planos de Investimento
local investmentPlans = {
    economicPlan = {
        initialInvestment = 500,
        monthlyReturn = 5,
        annualReturn = 60,
        netAnnualReturn = 300,
        slots = 500
    },

    unityPlan = {
        initialInvestment = 1000,
        monthlyReturn = 6,
        annualReturn = 72,
        netAnnualReturn = 720,
        slots = 500
    },

    elitePlan = {
        initialInvestment = 5000,
        monthlyReturn = 8,
        annualReturn = 96,
        netAnnualReturn = 4800,
        slots = 100
    }
}

-- Funções para acessar dados dos planos de investimento
function investmentPlans.getEconomicPlan()
    return investmentPlans.economicPlan
end

function investmentPlans.getUnityPlan()
    return investmentPlans.unityPlan
end

function investmentPlans.getElitePlan()
    return investmentPlans.elitePlan
end

-- Imprimir os dados dos planos de investimento
function printInvestmentPlans()
    print("Investment Plans:")
    print("Economic Plan:")
    print("Initial Investment:", investmentPlans.economicPlan.initialInvestment)
    print("Monthly Return:", investmentPlans.economicPlan.monthlyReturn)
    print("Annual Return:", investmentPlans.economicPlan.annualReturn)
    print("Net Annual Return:", investmentPlans.economicPlan.netAnnualReturn)
    print("Slots:", investmentPlans.economicPlan.slots)
    print()
    print("Unity Plan:")
    print("Initial Investment:", investmentPlans.unityPlan.initialInvestment)
    print("Monthly Return:", investmentPlans.unityPlan.monthlyReturn)
    print("Annual Return:", investmentPlans.unityPlan.annualReturn)
    print("Net Annual Return:", investmentPlans.unityPlan.netAnnualReturn)
    print("Slots:", investmentPlans.unityPlan.slots)
    print()
    print("Elite Plan:")
    print("Initial Investment:", investmentPlans.elitePlan.initialInvestment)
    print("Monthly Return:", investmentPlans.elitePlan.monthlyReturn)
    print("Annual Return:", investmentPlans.elitePlan.annualReturn)
    print("Net Annual Return:", investmentPlans.elitePlan.netAnnualReturn)
    print("Slots:", investmentPlans.elitePlan.slots)
end

-- Teste da impressão dos planos de investimento
printInvestmentPlans()

-- Retornando a tabela de planos de investimento
return investmentPlans

