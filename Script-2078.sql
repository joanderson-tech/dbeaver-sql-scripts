SELECT p3.id_pessoa, p3.nome,
    p3.cpf_cnpj, p.*
FROM comum.permissao p
JOIN comum.papel p2 ON p2.id = p.id_papel
JOIN comum.unidade u ON u.id_unidade = p.id_unidade_papel
JOIN comum.usuario u2 ON u2.id_usuario = p.id_usuario
JOIN comum.pessoa p3 ON p3.id_pessoa = u2.id_pessoa
--JOIN rh.servidor s ON s.id_pessoa = p3.id_pessoa
WHERE p2.id = 302
  AND p.id_unidade_papel = 8533
ORDER BY p.data_atribuicao DESC;

-- Agora o LIMIT 1 pegará com segurança o topo da lista (o mais recente)
LIMIT 1;


SELECT * FROM rh.servidor s WHERE s.id_pessoa = 51893921;

SELECT * FROM comum.pessoa p WHERE p.nome ilike'%LOURRANA MIRES DE JESUS SANTANA%'


SELECT * FROM comum.pessoa p WHERE p.id_pessoa IN (51873522);



SELECT * FROM rh.servidor s WHERE s.id_pessoa = 747008;


SELECT p.* FROM comum.pessoa p 
JOIN rh.servidor s ON s.id_pessoa = p.id_pessoa 
WHERE p.cpf_cnpj  =  '90140435549';


--FALTA DIRETOR
-- PREV2EIP1B  ESCOLA MUNICIPAL APULCRO MOTA 
-- EFAIV35A    ESCOLA MUNICIPAL MAJOR JOÃO TELES


SELECT * FROM comum.unidade u; WHERE u.


--FALTA DIRETOR
-- PREV2EIP1B  ESCOLA MUNICIPAL APULCRO MOTA -- ANA PAULA GOMES DA SILVA
-- EFAIV35A    ESCOLA MUNICIPAL MAJOR JOÃO TELES --ISABEL NOBRE DE CARVALHO CAMPOS

-- EFAIPIN2D ESCOLA MUNICIPAL LEONEL BRIZOLA

-- EFAIPIN5D ESCOLA MUNICIPAL LEONEL BRIZOLA


select e.id_unidade_escola,* FROM escola.escola e WHERE e.nome = 'ESCOLA MUL ANTONIO FRANCISCO DE JESUS'

SELECT * FROM comum.unidade u WHERE u.id_unidade = 27223931;


SELECT ts.id_turno, * FROM basico.turma_serie ts WHERE ts.id_escola = 51870379
AND  ts.ano = 2026 AND ts.nome = 'EFAIPIN5D';



SELECT t.* FROM ensino.turno AS t
WHERE t.descricao ILIKE  '%INTEGRAL%'