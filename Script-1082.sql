begin;
rollback;

CREATE TEMPORARY TABLE tabela_temporaria_resultado AS
select  rac.id_relatorio_avaliativo_componente,  ra.id_relatorio_avaliativo,
    mc.id_matricula_componente as matricula_ativa, 
    mc2.id_matricula_componente AS matricula_excluida
from basico.matricula_estudante_serie mes
join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
and ra.ativo = false
join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie
join ensino.turma t on t.id_turma_serie = mes.id_turma_serie
join  ensino.matricula_componente mc on mc.id_discente  = mes.id_estudante
   and mc.id_situacao_matricula = 2
   and mc.id_turma = t.id_turma
join ensino.matricula_componente mc2  on mc2.id_discente = mc.id_discente 
   --and mc2.id_componente_curricular = mc.id_componente_curricular 
   and mc2.id_situacao_matricula = 7
   and  mc2.id_turma in ( 
   select t2.id_turma from ensino.turma t2
   join basico.turma_serie ts2 on ts2.id_turma_serie = t2.id_turma_serie and ts2.ativo
   where ts2.id_serie = ts.id_serie 
   and ts2.ano = ts.ano
   and t2.id_disciplina = t.id_disciplina)
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
and mc2.id_matricula_componente = rac.id_matricula_componente
where mes.id_turma_serie in (53037900, 53037901, 53037902)
and mes.id_situacao_matricula_serie = 1;

--gera o backup
SELECT 'UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = ' || ttr.matricula_excluida || ' WHERE id_relatorio_avaliativo_componente = ' || ttr.id_relatorio_avaliativo_componente || ';'
FROM tabela_temporaria_resultado ttr;

UPDATE ensino_infantil.relatorio_avaliativo_componente rac
SET id_matricula_componente = ttr.matricula_ativa
FROM tabela_temporaria_resultado ttr
WHERE rac.id_relatorio_avaliativo_componente = ttr.id_relatorio_avaliativo_componente;

CREATE TEMPORARY TABLE backup_relatorio_avaliativo AS
SELECT distinct tt.id_relatorio_avaliativo as id_relatorio_avaliativo_ativar, 
(
select ra.id_relatorio_avaliativo from ensino_infantil.relatorio_avaliativo ra
where ra.id_matricula_discente_serie = ra2.id_matricula_discente_serie
and ra.ativo
) id_relatorio_avaliativo_inativar
FROM tabela_temporaria_resultado tt
join ensino_infantil.relatorio_avaliativo ra2 on  ra2.id_relatorio_avaliativo =  tt.id_relatorio_avaliativo;

-- Inativar
UPDATE ensino_infantil.relatorio_avaliativo ra
SET ativo = false
FROM backup_relatorio_avaliativo b
WHERE ra.id_relatorio_avaliativo = b.id_relatorio_avaliativo_inativar;

-- Ativar
UPDATE ensino_infantil.relatorio_avaliativo ra
SET ativo = true
FROM backup_relatorio_avaliativo b
WHERE ra.id_relatorio_avaliativo = b.id_relatorio_avaliativo_ativar;

-- backup Ativar 
SELECT 'UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = ' || id_relatorio_avaliativo_ativar || ';' as backup
FROM backup_relatorio_avaliativo;

-- backup Inativar 
SELECT 'UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = ' || id_relatorio_avaliativo_inativar || ';' as backup
FROM backup_relatorio_avaliativo
where id_relatorio_avaliativo_inativar is not null;

--commit;
rollback;