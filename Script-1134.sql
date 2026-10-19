 CREATE TEMPORARY TABLE temp_inserted_topico_aula_ids ( id_topico_aula BIGINT PRIMARY KEY ); 
		 CREATE TEMPORARY TABLE backup_conteudo_ministrado ( id_topico_aula BIGINT PRIMARY KEY, conteudo_original TEXT,  data_backup TIMESTAMP DEFAULT now() ); 
		 CREATE TEMPORARY TABLE temp_topicos_duplicados ( id_topico_aula INT, conteudo_ministrado TEXT ); 
    	 CREATE table public.backup_educ_660 (  id_backup int4 NOT NULL, backup text null); 
		 INSERT INTO temp_topicos_duplicados (id_topico_aula, conteudo_ministrado) WITH dados AS ( SELECT ta.id_topico_aula, ta.data, ta.conteudo_ministrado, ta.descricao, ta.data_cadastro, ta.programado, ta.id_turma FROM ava.topico_aula ta WHERE ta.descricao IS NOT NULL AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '') AND ta.data_cadastro >= '2025-01-01' AND ta.programado = TRUE ), datas_duplicadas_e_nao_programados AS ( SELECT d.data FROM dados d JOIN ava.topico_aula taa ON d.data = taa.data AND d.id_turma = taa.id_turma WHERE taa.programado = FALSE  GROUP BY d.data HAVING COUNT(d.data) > 0  ) SELECT d.id_topico_aula, d.conteudo_ministrado FROM dados d JOIN datas_duplicadas_e_nao_programados ddp ON d.data = ddp.data; 
		 UPDATE ava.topico_aula SET conteudo_ministrado = '' WHERE id_topico_aula IN (SELECT id_topico_aula FROM temp_topicos_duplicados); 
		 WITH inserted_rows AS ( INSERT INTO ava.topico_aula ( id_topico_aula, id_turma, descricao, data, fim, id_topico_pai, conteudo, id_usuario, data_cadastro, visivel, ativo, id_docente_turma, aula_cancelada, id_aula_extra, bimestre, programado, bimestral, necessita_correcao, replica_conteudo, conteudo_ministrado ) SELECT nextval('hibernate_sequence') AS id_topico_aula,  ta.id_turma, NULL AS descricao, ta.data, ta.fim, NULL AS id_topico_pai, NULL AS conteudo, 1 AS id_usuario, now() AS data_cadastro, false AS visivel, true AS ativo,  NULL AS id_docente_turma, false AS aula_cancelada,  NULL AS id_aula_extra, ta.bimestre, false AS programado, false AS bimestral, false AS necessita_correcao, false AS replica_conteudo, ta.conteudo_ministrado FROM ava.topico_aula ta WHERE ta.descricao IS NOT NULL AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '') AND ta.data_cadastro >= '2025-01-01' AND ta.programado = true RETURNING id_topico_aula ) INSERT INTO temp_inserted_topico_aula_ids (id_topico_aula) SELECT id_topico_aula FROM inserted_rows; 
		 INSERT INTO backup_conteudo_ministrado (id_topico_aula, conteudo_original) SELECT ta.id_topico_aula, ta.conteudo_ministrado FROM ava.topico_aula ta WHERE ta.descricao IS NOT NULL AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '') AND ta.data_cadastro >= '2025-01-01' AND ta.programado = true; 
		 UPDATE ava.topico_aula SET conteudo_ministrado = '' WHERE id_topico_aula IN ( SELECT id_topico_aula FROM backup_conteudo_ministrado ); 		
		 INSERT into public.backup_educ_660 (id_backup, backup) select nextval('hibernate_sequence'), 'UPDATE ava.topico_aula SET conteudo_ministrado = ' || CASE WHEN b.conteudo_ministrado IS NOT NULL THEN '''' || REPLACE(b.conteudo_ministrado, '''', '''''') || '''' ELSE 'NULL' END || ' WHERE id_topico_aula = ' || b.id_topico_aula || ';' AS restore_statement FROM temp_topicos_duplicados b; 
		 INSERT into public.backup_educ_660 (id_backup, backup) select nextval('hibernate_sequence'), 'UPDATE ava.topico_aula SET conteudo_ministrado = ' || CASE WHEN b.conteudo_original IS NOT NULL THEN '''' || REPLACE(b.conteudo_original, '''', '''''') || '''' ELSE 'NULL' END || ' WHERE id_topico_aula = ' || b.id_topico_aula || ';' AS restore_statement FROM backup_conteudo_ministrado b; 
		 INSERT into public.backup_educ_660 (id_backup, backup) select nextval('hibernate_sequence'), 'DELETE FROM ava.topico_aula WHERE id_topico_aula = ' || tid.id_topico_aula || ';' AS delete_statement FROM temp_inserted_topico_aula_ids tid; 
		 DROP TABLE temp_inserted_topico_aula_ids; 
		 DROP table backup_conteudo_ministrado; 
		 DROP table temp_topicos_duplicados; 
 
 

 
 
select
	*
from
	ava.topico_aula ta
where
	ta.id_turma = 684967;



