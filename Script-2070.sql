SELECT 
    p3.id_pessoa, p3.nome,
    p3.cpf_cnpj 
FROM comum.permissao p
JOIN 
    comum.papel p2 ON p2.id = p.id_papel
JOIN 
    comum.unidade u ON u.id_unidade = p.id_unidade_papel
JOIN 
    comum.usuario u2 ON u2.id_usuario = p.id_usuario
JOIN 
    comum.pessoa p3 ON p3.id_pessoa = u2.id_pessoa
WHERE 
    p2.id = 302
    AND p.id_unidade_papel = 27223925
LIMIT 1;




--FALTA DIRETOR
-- PREV2EIP1B  ESCOLA MUNICIPAL APULCRO MOTA 
-- EFAIV35A    ESCOLA MUNICIPAL MAJOR JOÃO TELES


SELECT * FROM comum.unidade u; WHERE u.


--FALTA DIRETOR
-- PREV2EIP1B  ESCOLA MUNICIPAL APULCRO MOTA -- ANA PAULA GOMES DA SILVA
-- EFAIV35A    ESCOLA MUNICIPAL MAJOR JOÃO TELES --ISABEL NOBRE DE CARVALHO CAMPOS

-- EFAIPIN2D ESCOLA MUNICIPAL LEONEL BRIZOLA

-- EFAIPIN5D ESCOLA MUNICIPAL LEONEL BRIZOLA


select e.id_unidade_escola,* FROM escola.escola e WHERE e.nome = 'ESCOLA MUNICIPAL LEONEL BRIZOLA'

SELECT * FROM comum.unidade u WHERE u.id_unidade = 27223931;


SELECT ts.id_turno, * FROM basico.turma_serie ts WHERE ts.id_escola = 51870379
AND  ts.ano = 2026 AND ts.nome = 'EFAIPIN5D';



SELECT t.* FROM ensino.turno AS t
WHERE t.descricao ILIKE  '%INTEGRAL%'