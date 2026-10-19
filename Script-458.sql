----------- MONTANHAS 
 -- Atualizar curriculo 
 UPDATE basico.curriculo_basico SET possui_parte_diversificada = TRUE, tipo_diario_diversificado = 31 WHERE id_curriculo_basico IN (51887439,51887469,51887454);
 
--- Atualização das turmas 
 update
	ensino.turma
set
	id_turma_agrupadora = null,
	id_categoria_componente = 2
where
	id_turma in (682947, 682945, 682942, 682941, 682938, 682935, 682943, 682946, 682933, 682944, 682937, 682936, 682939, 682940, 682934, 683305, 683304, 683310, 683307, 683308, 683300, 683312, 683313, 683303, 683311, 683302, 683301, 683309, 683299, 683306, 682947, 682945, 682942, 682941, 682938, 682935, 682943, 682946, 682933, 682944, 682937, 682936, 682939, 682940, 682934, 683305, 683304, 683310, 683307, 683308, 683300, 683312, 683313, 683303, 683311, 683302, 683301, 683309, 683299, 683306, 682947, 682945, 682942, 682941, 682938, 682935, 682943, 682946, 682933, 682944, 682937, 682936, 682939, 682940, 682934, 683305, 683304, 683310, 683307, 683308, 683300, 683312, 683313, 683303, 683311, 683302, 683301, 683309, 683299, 683306, 682947, 682945, 682942, 682941, 682938, 682935, 682943, 682946, 682933, 682944, 682937, 682936, 682939, 682940, 682934, 683305, 683304, 683310, 683307, 683308, 683300, 683312, 683313, 683303, 683311, 683302, 683301, 683309, 683299, 683306, 682947, 682945, 682942, 682941, 682938, 682935, 682943, 682946, 682933, 682944, 682937, 682936, 682939, 682940, 682934, 683305, 683304, 683310, 683307, 683308, 683300, 683312, 683313, 683303, 683311, 683302, 683301, 683309, 683299, 683306, 682947, 682945, 682942, 682941, 682938, 682935, 682943, 682946, 682933, 682944, 682937, 682936, 682939, 682940, 682934, 683305, 683304, 683310, 683307, 683308, 683300, 683312, 683313, 683303, 683311, 683302, 683301, 683309, 683299, 683306, 683276, 683271, 683280, 683278, 683272, 683281, 683274, 683282, 683283, 683279, 683273, 683275, 683269, 683277, 683270, 683276, 683271, 683280, 683278, 683272, 683281, 683274, 683282, 683283, 683279, 683273, 683275, 683269, 683277, 683270, 683276, 683271, 683280, 683278, 683272, 683281, 683274, 683282, 683283, 683279, 683273, 683275, 683269, 683277, 683270, 683276, 683271, 683280, 683278, 683272, 683281, 683274, 683282, 683283, 683279, 683273, 683275, 683269, 683277, 683270, 683276, 683271, 683280, 683278, 683272, 683281, 683274, 683282, 683283, 683279, 683273, 683275, 683269, 683277, 683270, 683276, 683271, 683280, 683278, 683272, 683281, 683274, 683282, 683283, 683279, 683273, 683275, 683269, 683277, 683270, 683291, 683289, 683287, 683284, 683292, 683290, 683298, 683293, 683296, 683286, 683297, 683295, 683294, 683288, 683285, 683291, 683289, 683287, 683284, 683292, 683290, 683298, 683293, 683296, 683286, 683297, 683295, 683294, 683288, 683285, 683291, 683289, 683287, 683284, 683292, 683290, 683298, 683293, 683296, 683286, 683297, 683295, 683294, 683288, 683285, 683291, 683289, 683287, 683284, 683292, 683290, 683298, 683293, 683296, 683286, 683297, 683295, 683294, 683288, 683285, 683291, 683289, 683287, 683284, 683292, 683290, 683298, 683293, 683296, 683286, 683297, 683295, 683294, 683288, 683285, 683291, 683289, 683287, 683284, 683292, 683290, 683298, 683293, 683296, 683286, 683297, 683295, 683294, 683288, 683285);
 

select * from ensino.turma t where id_turma_serie = 1005220;

select * from basico.serie s where 	id_serie = 1005220;

select * from basico.curriculo_basico cb where id_curriculo_basico = 52063879;

select cb.tipo_diario , * from basico.curriculo_basico cb where id_serie = 1005220 and id_curriculo_basico = 52063879;

select * from 

select * from basico.turma_serie ts where id_serie = 1005220 and ts.ano = 2025 and  id_escola = 2844;
19112

select * from ensino.


  
  select * from basico.curriculo_basico cb where tipo_diario = 20;

--SOLUÇÃO
-- Auto-generated SQL script #202505021200


-- Auto-generated SQL script #202505021416
UPDATE basico.serie
	SET tipo_diario=20
	WHERE id_serie=1005220;


UPDATE basico.curriculo_basico
	SET possui_parte_diversificada=true, tipo_diario  = 20
	WHERE id_curriculo_basico=52063879;

UPDATE basico.turma_serie
	SET tipo_diario=20
	WHERE id_turma_serie in (52093846, 52093850);


--backup 

UPDATE basico.curriculo_basico
	SET possui_parte_diversificada=true, tipo_diario  = 1 
	WHERE id_curriculo_basico=52063879;

-- Auto-generated SQL script #202505021416
UPDATE basico.serie
	SET tipo_diario=1
	WHERE id_serie=1005220;


BEGIN 
 
-- criando tabela tem para buscar os curriculos
SELECT 
cb.id_curriculo_basico,
cb.tipo_diario diario_antigo,
CASE 
WHEN cb.id_curriculo_basico = 52063879 THEN 10
WHEN cb.id_curriculo_basico = 52063879 THEN 10
ELSE cb.tipo_diario
END diario_novo
INTO TEMP temp_curriculos_alterar
FROM basico.curriculo_basico cb 
WHERE cb.id_curriculo_basico IN (52063879,52063879);

--DROP TABLE temp_curriculos_alterar;

-- Ajustando currículo 
SELECT 'UPDATE basico.curriculo_basico SET tipo_diario = '|| tcb.diario_novo || ' WHERE id_curriculo_basico = ' || cb.id_curriculo_basico||';' solucao,
       'UPDATE basico.curriculo_basico SET tipo_diario = '|| tcb.diario_antigo || ' WHERE id_curriculo_basico = ' || cb.id_curriculo_basico||';' backup
FROM temp_curriculos_alterar tcb
JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico= tcb.id_curriculo_basico ;


UPDATE basico.curriculo_basico SET tipo_diario = 10 WHERE id_curriculo_basico = 52063879;
UPDATE basico.curriculo_basico SET tipo_diario = 20 WHERE id_curriculo_basico = 52063879;

-- Ajustando curriculo das turmas.
SELECT 'UPDATE basico.turma_serie SET tipo_diario = '|| tcb.diario_novo || ' WHERE id_turma_serie =  '||  id_turma_serie || ';' solucao,
       'UPDATE basico.turma_serie SET tipo_diario ' || tcb.diario_antigo || '  WHERE id_turma_serie =  '||  id_turma_serie || ';' backup
FROM basico.turma_serie ts 
JOIN temp_curriculos_alterar tcb ON tcb.id_curriculo_basico = ts.id_curriculo_medio 
WHERE ts.ano = 2025
AND ts.ativo;

UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie =  52093846;
UPDATE basico.turma_serie SET tipo_diario = 10 WHERE id_turma_serie =  52093850;

rollback;

COMMIT 

-- Auto-generated SQL script #202505021427
UPDATE basico.turma_serie
	SET tipo_diario=1
	WHERE id_turma_serie=52093846;
UPDATE basico.turma_serie
	SET tipo_diario=1
	WHERE id_turma_serie=52093850;



