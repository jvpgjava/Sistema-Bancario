# Sistema Bancário
Este projeto implementa um sistema bancário simples, que gerencia clientes, contas, transações, funcionários e agências. O sistema foi desenvolvido utilizando SQL para a criação e manipulação do banco de dados, proporcionando uma base sólida para operações financeiras.

## Funcionalidades
- **Gerenciamento de Clientes**: Cadastro e consulta de clientes, incluindo informações pessoais e de contato.
- **Gerenciamento de Contas**: Criação e manutenção de contas bancárias, com suporte para tipos de contas (Corrente e Poupança).
- **Transações**: Registro de transações financeiras, incluindo depósitos, saques e transferências entre contas.
- **Funcionários e Agências**: Gerenciamento de funcionários do banco e suas respectivas agências, permitindo a associação de gerentes às agências.
- **Consultas Avançadas**: Realização de consultas complexas para obter informações detalhadas sobre clientes, contas, transações e transferências.

## Estrutura do Banco de Dados
O sistema é composto pelas seguintes tabelas:
1. **Clientes**: Armazena informações dos clientes, como nome, sobrenome, CPF, telefone e e-mail.
2. **Contas**: Contém dados das contas bancárias, incluindo o número da conta, tipo e saldo.
3. **Transações**: Registra cada transação realizada em uma conta, com detalhes como tipo, valor e descrição.
4. **Funcionários**: Armazena informações sobre os funcionários do banco, incluindo cargo e salário.
5. **Agências**: Gerencia as agências bancárias, associando cada uma a um gerente.
6. **Transferências**: Registra transferências realizadas entre contas.

## Tecnologias Utilizadas
- **SQL**: Linguagem de consulta estruturada para a criação e manipulação do banco de dados.
- **MySQL**: Sistema de gerenciamento de banco de dados utilizado para armazenar e gerenciar os dados.

## Como Usar
1. **Clone o Repositório**:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```

2. **Configuração do Banco de Dados**:
   - Abra seu cliente MySQL e execute os comandos SQL presentes no arquivo de script para criar as tabelas e inserir os dados de exemplo.

3. **Consultas**:
   - Utilize as consultas SQL fornecidas para interagir com o banco de dados e obter informações relevantes.

## Exemplos de Consultas
- **Consultar todos os clientes**:
  ```sql
  SELECT * FROM Clientes;
  ```

- **Ver todas as contas**:
  ```sql
  SELECT * FROM Contas;
  ```

- **Obter transações de uma conta específica**:
  ```sql
  SELECT * FROM Transacoes WHERE conta_id = 1;
  ```

## Contribuições
Sinta-se à vontade para abrir uma *issue* ou enviar um *pull request* se você tiver sugestões ou melhorias para o projeto.



---
