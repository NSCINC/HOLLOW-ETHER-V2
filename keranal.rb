require 'thread'

# Definição da classe LoginSecurityKernel
class LoginSecurityKernel
  def initialize
    @logged_in_users = {}
    @max_participants_per_unit = 7
    @max_units = 300
    @mutex = Mutex.new
  end

  # Método para login, tenta autenticar o usuário com o username e password fornecidos
  def login(username, password)
    # Lógica de autenticação
    is_authenticated = authenticate_user(username, password)

    # Se autenticado com sucesso, registra o usuário logado
    if is_authenticated
      @mutex.synchronize do
        @logged_in_users[username] ||= 0
        @logged_in_users[username] += 1
      end
    end

    is_authenticated
  end

  # Método para logout do usuário especificado
  def logout(username)
    @mutex.synchronize do
      if @logged_in_users.key?(username) && @logged_in_users[username] > 0
        @logged_in_users[username] -= 1
        @logged_in_users.delete(username) if @logged_in_users[username] == 0
        return true
      end
    end
    false
  end

  # Método para verificar se o número de unidades ativas é menor ou igual a 300
  def token_closed?
    @mutex.synchronize do
      @logged_in_users.length <= @max_units
    end
  end

  # Método para verificar se o número de participantes na unidade atual é menor que 7
  def can_join_unit(username)
    @mutex.synchronize do
      @logged_in_users[username].to_i < @max_participants_per_unit
    end
  end

  private

  # Método privado para simular a lógica de autenticação
  def authenticate_user(username, password)
    # Lógica de autenticação - a ser implementada de acordo com requisitos específicos
    true # Simulação de autenticação bem-sucedida
  end
end

# Exemplo de uso do modelo de autenticação
username = "user123"
password = "password123"

kernel = LoginSecurityKernel.new

if kernel.login(username, password)
  puts "Login successful"
  if kernel.can_join_unit(username)
    puts "User can join unit"
  else
    puts "Unit is full"
  end
else
  puts "Login failed"
end

# Simulação de logout
if kernel.logout(username)
  puts "Logout successful"
else
  puts "Logout failed"
end

# Verifica se o token está fechado
if kernel.token_closed?
  puts "Token is closed"
else
  puts "Token is still open"
end
