LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv'
INTO TABLE operadoras
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(registro_operadora, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cidade, uf, cep, ddd, telefone, fax, email, representante, cargo_representante, regiao_comercializacao, @data_registro_ans)
SET data_registro_ans = STR_TO_DATE(@data_registro_ans, '%Y-%m-%d');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2023/1T2023.csv'
IGNORE INTO TABLE demonstracoes_contabeis
CHARACTER SET UTF8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@data_referencia, reg_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data_referencia = STR_TO_DATE(@data_referencia, '%d/%m/%Y'),
    vl_saldo_inicial = REPLACE(REPLACE(@vl_saldo_inicial, '.', ''), ',', '.'),
    vl_saldo_final = REPLACE(REPLACE(@vl_saldo_final, '.', ''), ',', '.');