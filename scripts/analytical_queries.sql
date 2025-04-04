SELECT 
    o.razao_social,
    SUM(d.vl_saldo_final) AS total_despesas
FROM 
    demonstracoes_contabeis d
JOIN 
    operadoras o ON d.reg_ans = o.registro_operadora
WHERE 
    d.data_referencia BETWEEN '2024-10-01' AND '2024-12-31'
    AND d.descricao LIKE '%EVENTOS/SINISTROS CONHECIDOS OU AVISADOS%'
GROUP BY 
    o.registro_operadora, o.razao_social
ORDER BY 
    total_despesas DESC
LIMIT 10;