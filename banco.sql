CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    data_nascimento DATE,
    cpf VARCHAR(11) UNIQUE, 
    telefone VARCHAR(15),
    email VARCHAR(100),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Contas (
    conta_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    numero_conta VARCHAR(20) UNIQUE,
    tipo_conta ENUM('Corrente', 'Poupança'),
    saldo DECIMAL(15, 2) DEFAULT 0,
    data_abertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id) ON DELETE CASCADE
);

CREATE TABLE Transacoes (
    transacao_id INT AUTO_INCREMENT PRIMARY KEY,
    conta_id INT,
    tipo_transacao ENUM('Depósito', 'Saque', 'Transferência'),
    valor DECIMAL(15, 2),
    data_transacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    descricao VARCHAR(255),
    FOREIGN KEY (conta_id) REFERENCES Contas(conta_id) ON DELETE CASCADE
);

CREATE TABLE Funcionarios (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    cargo VARCHAR(50),
    data_admissao DATE,
    salario DECIMAL(15, 2),
    cpf VARCHAR(11) UNIQUE 
);

CREATE TABLE Agencias (
    agencia_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    gerente_id INT,
    FOREIGN KEY (gerente_id) REFERENCES Funcionarios(funcionario_id) ON DELETE SET NULL
);

CREATE TABLE Transferencias (
    transferencia_id INT AUTO_INCREMENT PRIMARY KEY,
    conta_origem_id INT,
    conta_destino_id INT,
    valor DECIMAL(15, 2),
    data_transferencia DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conta_origem_id) REFERENCES Contas(conta_id) ON DELETE CASCADE,
    FOREIGN KEY (conta_destino_id) REFERENCES Contas(conta_id) ON DELETE CASCADE
);

-- Clientes
INSERT INTO Clientes (nome, sobrenome, data_nascimento, cpf, telefone, email) VALUES 
('João', 'Silva', '1985-05-15', '12345678901', '11987654321', 'joao.silva@email.com'),
('Maria', 'Souza', '1990-07-20', '10987654321', '11912345678', 'maria.souza@email.com'),
('Pedro', 'Almeida', '1982-03-25', '23456789012', '11998765432', 'pedro.almeida@email.com'),
('Ana', 'Costa', '1995-08-30', '34567890123', '11987654322', 'ana.costa@email.com'),
('Carlos', 'Pereira', '1988-12-10', '45678901234', '11976543210', 'carlos.pereira@email.com');

-- Contas 
INSERT INTO Contas (cliente_id, numero_conta, tipo_conta) VALUES
(1, '0001-1', 'Corrente'),
(2, '0002-2', 'Poupança'),
(3, '0003-3', 'Corrente'),
(4, '0004-4', 'Poupança'),
(5, '0005-5', 'Corrente');

-- Transações
INSERT INTO Transacoes (conta_id, tipo_transacao, valor, descricao) VALUES 
(1, 'Depósito', 500.00, 'Depósito inicial'),
(1, 'Saque', 200.00, 'Saque automático'),
(2, 'Transferência', 300.00, 'Transferência para conta 1'),
(3, 'Depósito', 700.00, 'Depósito mensal'),
(4, 'Saque', 150.00, 'Saque para compras'),
(5, 'Transferência', 100.00, 'Transferência para conta 6');

-- Funcionários
INSERT INTO Funcionarios (nome, sobrenome, cargo, data_admissao, salario, cpf) VALUES 
('Carlos', 'Pereira', 'Gerente', '2020-01-10', 5000.00, '12345678902'),
('Ana', 'Oliveira', 'Caixa', '2021-06-15', 3000.00, '10987654322');

-- Agências
INSERT INTO Agencias (nome, endereco, telefone, gerente_id) VALUES 
('Agência Centro', 'Rua A, 123', '1122334455', 1),
('Agência Sul', 'Avenida B, 456', '1133445566', 2);

-- Transferências 
INSERT INTO Transferencias (conta_origem_id, conta_destino_id, valor) VALUES 
(1, 2, 100.00),
(2, 3, 200.00);

-- Consultas
SELECT * FROM Clientes;
SELECT * FROM Contas;
SELECT * FROM Transacoes WHERE conta_id = 1;
SELECT f.nome AS funcionario, a.nome AS agencia FROM Funcionarios f LEFT JOIN Agencias a ON f.funcionario_id = a.gerente_id;
SELECT t.transferencia_id, t.valor, c1.numero_conta AS conta_origem, c2.numero_conta AS conta_destino, t.data_transferencia 
FROM Transferencias t 
JOIN Contas c1 ON t.conta_origem_id = c1.conta_id 
JOIN Contas c2 ON t.conta_destino_id = c2.conta_id;
SELECT tr.transacao_id, tr.tipo_transacao, tr.valor, tr.data_transacao, c.numero_conta 
FROM Transacoes tr 
JOIN Contas c ON tr.conta_id = c.conta_id;