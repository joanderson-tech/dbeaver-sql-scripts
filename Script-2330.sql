BEGIN;

INSERT INTO basico.curriculo_basico (id_curriculo_basico, id_serie, situacao, ativo, ano_entrada_vigor, id_registro_entrada, data_cadastro, id_registro_atualizacao, data_alteracao, codigo, carga_horaria, codigo_rh, ordem, id_turno, tipo_diario, id_unidade, id_escola, permite_parecer_descritivo, multisseriado, tipo_diario_diversificado, possui_parte_diversificada, diario_diversificado_reprova_por_falta, permite_multiplos_professores_polivalente, habilita_relatorio_final_polivalente) 
VALUES(nextval('hibernate_sequence'), 52786529, NULL, true, 2026, NUll, '2026-05-13', NULL, NULL, 'TesteQA', 800, NULL, NULL, 2, 11, 605, NULL, false, true, NULL, false, false, false, false);

INSERT INTO basico.curriculo_basico_serie_multisseriada (id_curriculo_basico, id_curriculo_basico_serie_associada, ativo) VALUES(57249250, 57075304, true);
INSERT INTO basico.curriculo_basico_serie_multisseriada (id_curriculo_basico, id_curriculo_basico_serie_associada, ativo) VALUES(57249250, 51869718, true);


SELECT * FROM basico.curriculo_basico WHERE codigo = '012026c';


INSERT INTO basico.curriculo_basico_componente (
    id_curriculo_basico_componente, 
    id_curriculo_basico, 
    id_componente_curricular, 
    ch_ano, 
    programa, 
    id_registro_entrada, 
    data_cadastro, 
    obrigatoria, 
    codigo_rh, 
    ch_semana, 
    id_modulo, 
    ordem, 
    permite_alocacao_adjunto, 
    permite_contraturno, 
    componente_eletivo, 
    id_categoria_componente, 
    optativa, 
    permite_multiplos_professores
)
SELECT 
    nextval('hibernate_sequence'), -- Gera um novo ID automático
    57249250, -- O novo ID do currículo básico que definiste
    id_componente_curricular, 
    ch_ano, 
    programa, 
    id_registro_entrada, 
    data_cadastro, 
    obrigatoria, 
    codigo_rh, 
    ch_semana, 
    id_modulo, 
    ordem, 
    permite_alocacao_adjunto, 
    permite_contraturno, 
    componente_eletivo, 
    id_categoria_componente, 
    optativa, 
    permite_multiplos_professores
FROM basico.curriculo_basico_componente
WHERE id_curriculo_basico IN (51869718, 57075304);


COMMIT;


BEGIN;

SELECT * FROM basico.curriculo_basico cb; WHERE cb.id_curriculo_basico = 57075313;
SELECT * FROM basico.curriculo_basico_componente  cb WHERE id_curriculo_basico IN (57249264);

UPDATE basico.curriculo_basico_componente 	SET id_curriculo_basico=57249250	WHERE id_curriculo_basico_componente=57249262;


-- Auto-generated SQL script #202605131647
UPDATE basico.curriculo_basico_componente 	SET id_curriculo_basico=51869718	WHERE id_curriculo_basico_componente=57249262;


SELECT s.* FROM basico.serie AS s WHERE s.descricao  = 'PRÉ II+1ºANO'

SELECT * FROM basico.curriculo_basico cb WHERE cb.id_serie = 52786529;

COMMIT ;



--curriculo associado 
SELECT * FROM basico.curriculo_basico cb WHERE cb.id_curriculo_basico IN (57075304,51869718);

SELECT * FROM basico.curriculo_basico_componente  cb WHERE cb.id_curriculo_basico IN (51869718, 57075304);




INSERT INTO basico.curriculo_basico (id_curriculo_basico, id_serie, situacao, ativo, ano_entrada_vigor, id_registro_entrada, data_cadastro, id_registro_atualizacao, data_alteracao, codigo, carga_horaria, codigo_rh, ordem, id_turno, tipo_diario, id_unidade, id_escola, permite_parecer_descritivo, multisseriado, tipo_diario_diversificado, possui_parte_diversificada, diario_diversificado_reprova_por_falta, permite_multiplos_professores_polivalente, habilita_relatorio_final_polivalente) VALUES(57075313, 52786529, NULL, true, 2022, 5727945, '2026-03-12', NULL, NULL, '012026', 800, NULL, NULL, 2, 11, 605, NULL, false, true, NULL, false, false, false, false);

INSERT INTO basico.curriculo_basico_serie_multisseriada (id_curriculo_basico, id_curriculo_basico_serie_associada, ativo) VALUES(57075313, 57075304, true);
INSERT INTO basico.curriculo_basico_serie_multisseriada (id_curriculo_basico, id_curriculo_basico_serie_associada, ativo) VALUES(57075313, 51869718, true);


BEGIN;
ROLLBACK;

DELETE FROM basico.curriculo_basico_serie_multisseriada WHERE id_curriculo_basico=57075313 AND id_curriculo_basico_serie_associada=57075304 AND ativo=true;
DELETE FROM basico.curriculo_basico_serie_multisseriada WHERE id_curriculo_basico=57075313 AND id_curriculo_basico_serie_associada=51869718 AND ativo=true;

DELETE FROM basico.curriculo_basico WHERE id_curriculo_basico=57075313;


SELECT * FROM basico.curriculo_basico_serie_multisseriada cbsm WHERE cbsm.id_curriculo_basico = 56564537;


-- criação dos currículos multi
insert into basico.curriculo_basico (id_curriculo_basico, id_serie, ativo, ano_entrada_vigor, data_cadastro, codigo, carga_horaria, id_turno, tipo_diario, id_unidade, permite_parecer_descritivo, multisseriado, possui_parte_diversificada, diario_diversificado_reprova_por_falta)
select nextval('public.hibernate_sequence') as id_curriculo_basico, id_serie, ativo, 2024 as ano_entrada_vigor, now() as data_cadastro, codigo || '-4' as codigo, carga_horaria, id_turno, tipo_diario, id_unidade, permite_parecer_descritivo, multisseriado, possui_parte_diversificada, diario_diversificado_reprova_por_falta 
from basico.curriculo_basico cb 
where id_curriculo_basico in (51885062, 51870328, 51870312, 51883176, 51870329, 51884648, 51884693);
-- criação das associações dos currículos
insert into basico.curriculo_basico_serie_multisseriada (id_curriculo_basico, id_curriculo_basico_serie_associada, ativo)
select 
	cb.id_curriculo_basico, cba.id_curriculo_basico, true
from basico.curriculo_basico cb
join basico.serie s on s.id_serie = cb.id_serie 
join basico.serie_multisseriada sm on sm.id_serie = s.id_serie 
join basico.curriculo_basico cba 
	on cba.id_serie = sm.id_serie_associada
	and cba.carga_horaria = cb.carga_horaria
	and cba.id_unidade = cb.id_unidade
	and cba.ativo
where cb.ano_entrada_vigor = 2024
	and cb.ativo 
	and cb.codigo ilike '%-4';
-- inativação currículos antigos
update basico.curriculo_basico set ativo = false where id_curriculo_basico in (51885062, 51870328, 51870312, 51883176, 51870329, 51884648, 51884693);
-- corrigir currículos
update basico.turma_serie tsu set id_curriculo_medio = cb.id_curriculo_basico 
from basico.turma_serie ts
join basico.curriculo_basico cb 
	on cb.id_serie = ts.id_serie 
	and cb.ativo 
	and cb.ano_entrada_vigor = 2024
where ts.id_turma_serie in (54093465, 54093621, 54093723, 54093758, 54094019, 54094024, 54095082, 54095647, 54098006)
	and ts.ativo
	and tsu.id_turma_serie = ts.id_turma_serie;
-- criar turmas séries agrupadas
insert into basico.turma_serie (id_turma_serie, ano, nome, id_serie, data_cadastro, capacidade_aluno, ativo, id_turno, id_curriculo_medio, id_escola, capacidade_sala_aula, regra_nao, progressao_parcial, tipo_diario, periodo, atividade_complementar, id_tipo_turma_serie, permite_disciplina_contraturno, id_turma_serie_agrupadora)
select nextval('public.hibernate_sequence') as id_turma_serie, ts.ano, ts.nome || '-M0' as nome, cbs.id_serie, now() as data_cadastro, ts.capacidade_aluno, ts.ativo, ts.id_turno, cbs.id_curriculo_basico as id_curriculo_medio, ts.id_escola, ts.capacidade_sala_aula, ts.regra_nao, ts.progressao_parcial, cbs.tipo_diario, ts.periodo, ts.atividade_complementar, 2 as id_tipo_turma_serie, ts.permite_disciplina_contraturno, ts.id_turma_serie as id_turma_serie_agrupadora
from basico.turma_serie ts 
join basico.curriculo_basico cb on cb.id_curriculo_basico = ts.id_curriculo_medio 
join basico.curriculo_basico_serie_multisseriada cbsm on cbsm.id_curriculo_basico = cb.id_curriculo_basico 
join basico.curriculo_basico cbs on cbs.id_curriculo_basico = cbsm.id_curriculo_basico_serie_associada 
where ts.id_turma_serie in (54093465, 54093621, 54093723, 54093758, 54094019, 54094024, 54095082, 54095647, 54098006);
-- criar componentes polivalentes
insert into ensino.turma (id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, data_cadastro, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem)
select nextval('ensino.turma_seq'), ts.ano, ts.periodo, 1, ts.capacidade_aluno, 220, ts.nome, 1, false, ts.data_cadastro, false, true, ts.id_turma_serie, false, false, 1
from basico.turma_serie ts 
where ts.id_turma_serie_agrupadora in (54093465, 54093621, 54093723, 54093758, 54094019, 54094024, 54095082, 54095647, 54098006);
-- criar componentes do currículo
insert into ensino.turma (id_turma, ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, data_cadastro, processada_rematricula,id_turma_agrupadora, agrupadora, id_turma_serie, nota, extra, ordem)
select nextval('ensino.turma_seq'), ts.ano, ts.periodo, 1, ts.capacidade_aluno, cbc.id_componente_curricular, ts.nome, 1, false, ts.data_cadastro, false, t.id_turma, false, ts.id_turma_serie, false, false, cbc.ordem + 1
from ensino.turma t 
join basico.turma_serie ts on ts.id_turma_serie = t.id_turma_serie 
join basico.curriculo_basico_componente cbc on cbc.id_curriculo_basico = ts.id_curriculo_medio 
where ts.id_turma_serie_agrupadora in (54093465, 54093621, 54093723, 54093758, 54094019, 54094024, 54095082, 54095647, 54098006);