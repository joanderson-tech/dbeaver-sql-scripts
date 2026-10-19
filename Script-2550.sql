SELECT p.nome, d.*
FROM discente d
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
WHERE p.nome ILIKE '%DANIEL LEVY DOS SANTOS SOUZA%'; --d.matricula = '202352778961';


BEGIN;
COMMIT ;

--Solução

-- Ajuste do relatorio para pegar as matricula ativa 
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20947084 WHERE id_relatorio_avaliativo_componente=926524;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20947082 WHERE id_relatorio_avaliativo_componente=926525;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20947081 WHERE id_relatorio_avaliativo_componente=926526;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20947083 WHERE id_relatorio_avaliativo_componente=926527;

--Cancela EFAIINT3A que estva com o avanço de estudo
UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN (20940475, 20940476, 20940477, 20940478, 20940479, 20940480, 20940481, 20940482, 20940483, 20940484, 20940486, 20940487, 20940485);

--Faz o avanço na turma correta EFAIINT2A 
UPDATE ensino.matricula_componente SET id_situacao_matricula=11 WHERE id_matricula_componente IN (20564414, 20564415, 20564416, 20564417, 20564418, 20564419, 20564420, 20564421, 20564422, 20564423, 20564424, 20564425, 20564426);

--Ajusta a matricula do estudante de acordo com o cadastro, informações da Auditoria
UPDATE basico.matricula_estudante_serie SET id_turma_serie= 84519780, id_curriculo_medio = 51876233 , id_vaga_serie = 83916415, id_serie_escola = 52236815 WHERE id_matricula_discente_serie = 1628303;

--backup

UPDATE ensino.matricula_componente SET id_situacao_matricula=11 WHERE id_matricula_componente IN (20940475, 20940476, 20940477, 20940478, 20940479, 20940480, 20940481, 20940482, 20940483, 20940484, 20940486, 20940487, 20940485);
UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN (20564414, 20564415, 20564416, 20564417, 20564418, 20564419, 20564420, 20564421, 20564422, 20564423, 20564424, 20564425, 20564426);
UPDATE basico.matricula_estudante_serie SET id_turma_serie=84519989, id_curriculo_medio = 72531179 , id_vaga_serie = 83916417, id_serie_escola = 52236816 WHERE id_matricula_discente_serie = 1628303;

UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20940482 WHERE id_relatorio_avaliativo_componente=926524;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20940480 WHERE id_relatorio_avaliativo_componente=926525;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20940479 WHERE id_relatorio_avaliativo_componente=926526;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20940481 WHERE id_relatorio_avaliativo_componente=926527;



SELECT * FROM comum.usuario WHERE id_usuario = 105068;

LEANDRO PINHEIRO MATOS


--JEAN KARLLOS DOS SANTOS SILVA
idestudante = 1388821
MES = 
1655363  - 1
1628303 -12

ARTHUR VITOR SILVA ARAUJO
idestudante = 1387721
MES = 

DANIEL LEVY DOS SANTOS SOUZA
idestudante = 1407486
MES = 1652102;


SELECT DISTINCT mes.data_matricula_turma  ,mes.*
FROM basico.matricula_estudante_serie mes
--JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie
--JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_matricula_componente = mc.id_matricula_componente 
--JOIN ensino.turma t ON t.id_turma = mc.id_turma 
WHERE mes.id_estudante   = 1388821
AND mes.ano_calendario  = 2026;
--AND mc.id_matricula_componente = 20564414;

SELECT * FROM ensino.matricula_componente mc WHERE mc.id_matricula_estudante_serie = 1628303;

SELECT * FROM ensino.solicitacao_avanco_estudo sae WHERE sae.id_estudante  = 1388821;
