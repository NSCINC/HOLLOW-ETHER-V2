Se você deseja incluir a criação da tabela e as consultas SQL em um único arquivo, podemos usar comandos de criação de tabela e inserção de dados em uma única transação. Aqui está como você pode fazer isso em um único arquivo SQL:

```sql
-- Criação da tabela Users
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    UNIQUE (username)
);

-- Inserção de dados de exemplo
INSERT INTO Users (username, password_hash) VALUES ('alice', '63a9f0ea7bb98050796b649e85481845');
INSERT INTO Users (username, password_hash) VALUES ('bob', '2ba6f0ea7bb98050e4f998ba5b4f874a');
INSERT INTO Users (username, password_hash) VALUES ('charlie', '46de5f0ea7bb98050796b649e85481845');

-- Consulta de autenticação de usuário
SELECT * FROM Users WHERE username = 'alice' AND password_hash = '63a9f0ea7bb98050796b649e85481845';
```

Neste arquivo SQL:

- Criamos uma tabela chamada `Users` com três colunas: `id`, `username` e `password_hash`. O `id` é uma chave primária auto-incrementada e `username` é uma chave única para garantir que não haja usuários duplicados.
- Inserimos alguns dados de exemplo na tabela para simular registros de usuários.
- Realizamos uma consulta para autenticar o usuário "alice" com a senha hash fornecida.

Este arquivo contém tanto a definição da tabela quanto a inserção de dados e consulta, tudo em um único script SQL.
-- Criação da tabela Users
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    UNIQUE (username)
);

-- Inserção de dados de exemplo
INSERT INTO Users (username, password_hash) VALUES ('alice', '63a9f0ea7bb98050796b649e85481845');
INSERT INTO Users (username, password_hash) VALUES ('bob', '2ba6f0ea7bb98050e4f998ba5b4f874a');
INSERT INTO Users (username, password_hash) VALUES ('charlie', '46de5f0ea7bb98050796b649e85481845');

-- Consulta de autenticação de usuário
SELECT * FROM Users WHERE username = 'alice' AND password_hash = '63a9f0ea7bb98050796b649e85481845';
