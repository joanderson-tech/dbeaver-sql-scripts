BEGIN;

ROLLBACK;

WITH novos_curriculos AS(
   SELECT id_curriculo_basico,
   id_serie,
   id_turno,
   tipo_diario
   FROM 
  basico.curriculo_basico cb 
  WHERE 1=1
  AND cb.id_curriculo_basico IN (52468399,52468409)
  AND cb.ativo
  )
select DISTINCT 
	ts.id_turma_serie,
	ts.id_curriculo_medio id_curriculo_antigo,
	ncb.tipo_diario tipo_diario_novo,
	ts.tipo_diario,
   ncb.id_curriculo_basico id_curriculo_correto
	INTO TEMP turmas_alteracao_matriz_curricular
 FROM basico.turma_serie ts 
 JOIN novos_curriculos ncb ON ncb.id_serie = ts.id_serie
 WHERE
ts.id_curriculo_medio IN (35504985, 35502048, 35506038, 35502680)
AND ts.id_curriculo_medio <> ncb.id_curriculo_basico
 AND ts.ano > 2024
 AND ts.id_turma_serie_agrupadora IS NULL 
 AND ts.ativo;

 -- # 1 backup que retorna a matriz na turma_serie 
SELECT distinct 
	'UPDATE basico.turma_serie set id_curriculo_medio = ' || ts.id_curriculo_antigo  || ', tipo_diario = ' || ts.tipo_diario  || ' WHERE id_turma_serie = ' || ts.id_turma_serie  || ';'
from 
turmas_alteracao_matriz_curricular ts;

-- #2.0: Backup de MATRICULA_ESTUDANTE_SERIE
SELECT distinct 
	'UPDATE basico.matricula_estudante_serie set id_curriculo_medio = ' ||  mes.id_curriculo_medio  || 
	' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie  || ';'
from 
	turmas_alteracao_matriz_curricular turmas 
	join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
		and mes.ano_calendario > 2024;
 
 
-- Atualizar turma
UPDATE basico.turma_serie SET tipo_diario = fo.tipo_diario_novo, id_curriculo_medio = fo.id_curriculo_correto FROM(
	select * from turmas_alteracao_matriz_curricular
) fo
WHERE basico.turma_serie.id_turma_serie = fo.id_turma_serie ;

-- # ATUALIZAR MATRICULA ESTUDANTE SERIE 
-- atualizar as MES ´s
UPDATE basico.matricula_estudante_serie set id_curriculo_medio = fo.id_curriculo_correto FROM(
    select distinct 
        mes.id_matricula_discente_serie, turmas.id_curriculo_correto
    from 
        turmas_alteracao_matriz_curricular turmas 
        join basico.matricula_estudante_serie mes on mes.id_turma_serie = turmas.id_turma_serie 
            and mes.ano_calendario > 2024
) fo
WHERE basico.matricula_estudante_serie.id_matricula_discente_serie = fo.id_matricula_discente_serie ;

COMMIT;