-- Função para mostrar informações de configuração
local function show()
    -- Simulação de informações de configuração (exemplo simples)
    local config = {
        version = "1.0",
        platform = "Lua",
        author = "Lua Dev Team"
    }
    
    -- Retornar uma string formatada com informações de configuração
    return string.format("Configuração Lua:\nVersão: %s\nPlataforma: %s\nAutor: %s",
                         config.version, config.platform, config.author)
end

-- Função para retornar informações de flags de compilação (simulação)
local function cxx_flags()
    -- Simulação de flags de compilação (exemplo simples)
    local flags = "-O2 -std=c++11"
    
    return "Flags de Compilação: " .. flags
end

-- Função para retornar informações de paralelização (simulação)
local function parallel_info()
    -- Simulação de informações de paralelização (exemplo simples)
    local parallel = {
        threads = 4,
        method = "OpenMP"
    }
    
    return string.format("Informações de Paralelização:\nThreads: %d\nMétodo: %s",
                         parallel.threads, parallel.method)
end

-- Testando as funções
print(show())
print(cxx_flags())
print(parallel_info())
