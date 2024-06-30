-- Declaração de variáveis privadas para armazenar configurações de parâmetros de módulo
local overwriteModuleParamsOnConversion = false
local swapModuleParamsOnConversion = false

-- Função para definir se deve sobrescrever parâmetros do módulo ao converter
local function setOverwriteModuleParamsOnConversion(value)
    overwriteModuleParamsOnConversion = value
end

-- Função para obter o estado atual de sobrescrever parâmetros do módulo ao converter
local function getOverwriteModuleParamsOnConversion()
    return overwriteModuleParamsOnConversion
end

-- Função para definir se deve trocar parâmetros do módulo ao converter
local function setSwapModuleParamsOnConversion(value)
    swapModuleParamsOnConversion = value
end

-- Função para obter o estado atual de trocar parâmetros do módulo ao converter
local function getSwapModuleParamsOnConversion()
    return swapModuleParamsOnConversion
end

-- Exemplo de uso das funções
setOverwriteModuleParamsOnConversion(true)
print("overwriteModuleParamsOnConversion:", getOverwriteModuleParamsOnConversion())

setSwapModuleParamsOnConversion(true)
print("swapModuleParamsOnConversion:", getSwapModuleParamsOnConversion())
