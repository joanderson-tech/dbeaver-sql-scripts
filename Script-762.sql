begin
-- criando tabela tem para buscar os curriculos
select
	cb.id_curriculo_basico,
	cb.tipo_diario diario_antigo,
	case
		when cb.id_curriculo_basico = 52004499 then 10
		when cb.id_curriculo_basico = 52004615 then 10
		else cb.tipo_diario
	end diario_novo
into
	temp temp_curriculos_alterar
from
	basico.curriculo_basico cb
where
	cb.id_curriculo_basico in (52004499, 52004615);
--DROP TABLE temp_curriculos_alterar;
-- Ajustando currículo 
select
	'UPDATE basico.curriculo_basico SET tipo_diario = ' || tcb.diario_novo || ' WHERE id_curriculo_basico = ' || cb.id_curriculo_basico || ';' solucao,
	'UPDATE basico.curriculo_basico SET tipo_diario = ' || tcb.diario_antigo || ' WHERE id_curriculo_basico = ' || cb.id_curriculo_basico || ';' backup
from
	temp_curriculos_alterar tcb
join basico.curriculo_basico cb on
	cb.id_curriculo_basico = tcb.id_curriculo_basico ;
-- Ajustando curriculo das turmas.
select
	'UPDATE basico.turma_serie SET tipo_diario = ' || tcb.diario_novo || ' WHERE id_turma_serie =  ' || id_turma_serie || ';' solucao,
	'UPDATE basico.turma_serie SET tipo_diario ' || tcb.diario_antigo || '  WHERE id_turma_serie =  ' || id_turma_serie || ';' backup
from
	basico.turma_serie ts
join temp_curriculos_alterar tcb on
	tcb.id_curriculo_basico = ts.id_curriculo_medio
where
	ts.ano = 2025
	and ts.ativo;
--ROLLBACK 

commit 



51869719