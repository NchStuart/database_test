CREATE TABLE operadoras (
    registro_operadora VARCHAR(6) PRIMARY KEY,
    cnpj VARCHAR(14) NOT NULL,
    razao_social VARCHAR(140) NOT NULL,
    nome_fantasia VARCHAR(140),
    modalidade VARCHAR(2),
    logradouro VARCHAR(40),
    numero VARCHAR(20),
    complemento VARCHAR(40),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    uf CHAR(2),
    cep VARCHAR(8),
    ddd VARCHAR(4),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(255),
    representante VARCHAR(50),
    cargo_representante VARCHAR(40),
    regiao_comercializacao TINYINT,
    data_registro_ans DATE
);


CREATE TABLE demonstracoes_contabeis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reg_ans VARCHAR(6) NOT NULL,
    data_referencia DATE NOT NULL,
    cd_conta_contabil VARCHAR(9) NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    vl_saldo_inicial DECIMAL(15,2) NOT NULL,
    vl_saldo_final DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (reg_ans) REFERENCES operadoras(registro_operadora) ON DELETE CASCADE
);