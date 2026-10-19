SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo in('7INT') ;

SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo ILIKE '%EJA%'

SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo ILIKE '%CICLO II%';


SELECT * FROM basico.curriculo_basico cb WHERE cb.tipo_diario = 38;

SELECT * FROM basico.turma_serie WHERE id_curriculo_medio = 52337475;

SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 51901476;

-- Auto-generated SQL script #202604231537
UPDATE basico.curriculo_basico 	SET tipo_diario=38 	WHERE id_curriculo_basico=35554848;



SELECT * FROM basico.curriculo_basico cb WHERE cb.codigo in('CICLO 1','CICLO I', 'CICLO II', 'CICLO 2', 'EJAMUL1') ;

SELECT 
'UPDATE basico.curriculo_basico 	SET tipo_diario=38 	WHERE id_curriculo_basico = '|| ts.id_turma_serie||';' AS solução, 
'UPDATE basico.turma_serie SET tipo_diario= '|| ts.tipo_diario||'	WHERE id_turma_serie = '|| ts.id_turma_serie||';' AS backup
FROM basico.turma_serie ts WHERE ts.id_curriculo_medio IN (35554848, 35548837, 35555398, 35549268, 51908662)
AND ts.ativo;


SELECT * FROM ensino.turma t WHERE t.id_turma_serie = 51901498;

SELECT * FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 51881332;



SELECT * FROM comum.pessoa p 