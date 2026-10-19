simonevaleriana4@gmail.com EFAIM3B art

select cbc.* from basico.curriculo_basico cb 
join basico.curriculo_basico_componente cbc  on cbc.id_curriculo_basico = cb.id_curriculo_basico 
where cb.id_curriculo_basico = 51877801 and cbc.id_componente_curricular  in (229,238,230);

select * from ensino_infantil.configuracao_relatorio cr WHERE cr.id_curriculo_basico IN (51877801, 51877814, 51877827);



select * from  ensino_infantil.relatorio_avaliativo ra;

select * from ensino_infantil.habilidade_competencia;

select * from ensino_infantil.configuracao_relatorio_componente;


select string_agg(id_curriculo_basico_componente :: VARCHAR , ', ') from basico.curriculo_basico_componente where id_curriculo_basico IN (51877801, 51877814, 51877827) and id_componente_curricular in (229, 238, 230);







begin;

--01
UPDATE basico.curriculo_basico cb SET tipo_diario_diversificado = 31, possui_parte_diversificada = TRUE WHERE cb.id_curriculo_basico IN (51877801,51877814,51877827);
UPDATE basico.curriculo_basico_componente SET id_categoria_componente=2	WHERE id_curriculo_basico_componente in (51877820, 51877822, 51877821, 51877833, 51877835, 51877834, 51877802, 51877804, 51877805); 

--02 E GERAR E BACKUP
select
	'UPDATE ensino.turma t SET id_categoria_componente =2, id_turma_agrupadora = NULL WHERE t.id_turma = ' || t.id_turma || ';' AS solucao_sql,
    'UPDATE ensino.turma t SET id_categoria_componente =1, id_turma_agrupadora = ' || t.id_turma_agrupadora || ' WHERE t.id_turma = ' || t.id_turma || ';' AS backup_sql
from basico.curriculo_basico cb
join basico.turma_serie ts ON ts.id_curriculo_medio = cb.id_curriculo_basico
join ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
where cb.id_curriculo_basico IN (51877801, 51877814, 51877827)
    AND t.id_disciplina IN (229, 238, 230)
GROUP BY
    t.id_turma, t.id_turma_agrupadora;

--03 GERA  configuracao_relatorio E configuracao_relatorio_componente

-- Inserir na configuracao_relatorio e capturar os IDs
WITH inserted_relatorio AS (
    INSERT INTO ensino_infantil.configuracao_relatorio
    (id_configuracao_relatorio, id_curriculo_basico, id_periodicidade_relatorio, id_grupo_avaliacao_relatorio, ativo, codigo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_descritivo)
    VALUES
        (nextval('ensino_infantil.configuracao_relatorio_seq'), 51877801, 2, 6, true, 'AI1INT', NULL, NULL, current_date, NULL, false),
        (nextval('ensino_infantil.configuracao_relatorio_seq'), 51877814, 2, 6, true, 'AI2INT', NULL, NULL, current_date, NULL, false),
        (nextval('ensino_infantil.configuracao_relatorio_seq'), 51877827, 2, 6, true, 'AI3INT', NULL, NULL, current_date, NULL, false)
    RETURNING id_configuracao_relatorio, codigo
)
-- Inserir os componentes relacionados automaticamente
INSERT INTO ensino_infantil.configuracao_relatorio_componente
(id_configuracao_relatorio_componente, id_configuracao_relatorio, id_componente_curricular, id_tipo_avaliacao_componente_relatorio,
 maximo_caracteres_relatorio, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao, possui_parecer_final_fixo, possui_parecer_final_descritivo)
SELECT 
    nextval('ensino_infantil.configuracao_relatorio_componente_seq'), ir.id_configuracao_relatorio, c.id_componente_curricular, 1, 9999, true, NULL, NULL, current_date, NULL, false, false
FROM inserted_relatorio ir
JOIN (
    VALUES 
        (229), (230), (238)
) AS c(id_componente_curricular) ON TRUE;

commit;

--backup 
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=null,possui_parte_diversificada=false WHERE id_curriculo_basico in (51877801,51877814,51877827);
UPDATE basico.curriculo_basico_componente SET id_categoria_componente=1	WHERE id_curriculo_basico_componente in (51877820, 51877822, 51877821, 51877833, 51877835, 51877834, 51877802, 51877804, 51877805);

--Desativa As novas configuraraçoes de relatorio
update	ensino_infantil.configuracao_relatorio
set	ativo = false
where	id_configuracao_relatorio in (
	select id_configuracao_relatorio from ensino_infantil.configuracao_relatorio cr WHERE cr.id_curriculo_basico IN (51877801, 51877814, 51877827));

