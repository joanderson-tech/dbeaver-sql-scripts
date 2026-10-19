SELECT mes.* FROM comum.pessoa p 
JOIN discente d ON d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
WHERE p.nome ILIKE '%MARIA HELENA PINHEIRO DE JESUS%';


SELECT * FROM ensino.alteracao_matricula am; WHERE am.idma


SELECT * FROM matricula.estudante_inscrito ei WHERE ei.nome ILIKE '%SAMUEL SANTOS BARROS%';
SELECT * FROM matricula.estudante_inscrito_processamento eip WHERE eip.id_estudante_inscrito IN (52008299, 54799442);

SELECT * FROM ensino_infantil.relatorio_avaliativo ra 
WHERE ra.id_matricula_discente_serie IN ( 1361200 ,1360912, 1357694);


SELECT * 
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON t.id_turma = fa.id_turma 
WHERE  fa.id_discente = 997599
AND t.id_turma_serie = 51958438;


52008299, 54799442

UPDATE basico.matricula_estudante_serie
    SET id_estudante=999130
    WHERE id_matricula_discente_serie=1358717;


COMMIT;
--backup 
-- Auto-generated SQL script #202609301546
UPDATE basico.matricula_estudante_serie
    SET id_estudante=998234
    WHERE id_matricula_discente_serie=1358717;



-- Auto-generated SQL script #202609301655
-- Auto-generated SQL script #202609301656
UPDATE basico.matricula_estudante_serie     SET id_situacao_matricula_serie=1    WHERE id_matricula_discente_serie=1357694;
UPDATE ensino.matricula_componente     SET id_situacao_matricula=2     WHERE id_matricula_componente IN (17054422, 17054427, 17054432, 17054437, 17054442, 17054447);


UPDATE basico.matricula_estudante_serie     SET id_situacao_matricula_serie=5    WHERE id_matricula_discente_serie=1361200;
UPDATE ensino.matricula_componente     SET id_situacao_matricula=3     WHERE id_matricula_componente IN (17174420, 17174421, 17174422, 17174423, 17174424, 17174425);


UPDATE ensino.matricula_componente     SET id_situacao_matricula=3     WHERE id_matricula_componente IN (17171223, 17171224, 17171225, 17171226, 17171227, 17171222, 17173731, 17173732, 17173733, 17173734, 17173735, 17173736)


--bacdkup 

UPDATE ensino.matricula_componente     SET id_situacao_matricula=3     WHERE id_matricula_componente IN (17171223, 17171224, 17171225, 17171226, 17171227, 17171222, 17173731, 17173732, 17173733, 17173734, 17173735, 17173736)
UPDATE basico.matricula_estudante_serie     SET id_situacao_matricula_serie=5    WHERE id_matricula_discente_serie=1357694;


SELECT * FROM ensino.matricula_componente mc WHERE 
mc.id_matricula_estudante_serie  IN (1361200);

SELECT * FROM basico.turma_serie ts WHERE ts.id_turma_serie IN (52014377, 52014417);


SELECT * FROM basico.matricula_estudante_serie mes WHERE  mes.id_turma_serie IN (52014377, 52014417);


SELECT * FROM escola.escola e WHERE e.nome ILIKE '%EDUCACAO INFANTIL ESTEFANIA RODRIGUES DO NASCIMENTO%';
SELECT * FROM basico.turma_serie ts WHERE ts.id_escola = 51877483
AND ts.id_serie =51869713;


SELECT *
FROM ensino.matricula_componente mc
WHERE mc.id_matricula_estudante_serie IN (1357694, 1360912);


SELECT * 
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON t.id_turma = fa.id_turma 
WHERE  fa.id_discente = 997599
AND t.id_turma_serie = 51958442;

--id_turma_serie = 52014417 atinga, 51958442 nova


SELECT * FROM ensino_infantil.relatorio_avaliativo ra 
WHERE ra.id_matricula_discente_serie IN (1360912, 1357694);

SELECT mes.* FROM comum.pessoa p 
JOIN discente d ON d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
WHERE p.nome ILIKE '%MARIA HELENA PINHEIRO DE JESUS%';


--solucaço
UPDATE ensino_infantil.relatorio_avaliativo
    SET id_matricula_discente_serie=1360912
    WHERE id_relatorio_avaliativo=437;

--backup
UPDATE ensino_infantil.relatorio_avaliativo
    SET id_matricula_discente_serie=1357694
    WHERE id_relatorio_avaliativo=437;


select nextval ('ensino_infantil.relatorio_avaliativo_seq')
select nextval ('ensino_infantil.parecer_descritivo_individual_seq')


SELECT * FROM ensino_infantil.relatorio_avaliativo_componente ra WHERE ra.id_relatorio_avaliativo = 437;

SELECT * FROM ensino_infantil.parecer_descritivo_individual WHERE id_matricula_discente_serie IN (1360912, 1357694);






select rahr --ra.id_matricula_discente_serie, rahr.id_relatorio_avaliativo_habilidade_resposta, mc.id_componente_curricular, crch.id_habilidade_competencia, rahr.id_opcao_grupo_avaliacao_relatorio, rahr.periodo  
from ensino_infantil.relatorio_avaliativo ra 
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join ensino_infantil.relatorio_avaliativo_habilidade rah on rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
where ra.id_matricula_discente_serie in (1360912) 
and ra.ativo 
and rahr.id_opcao_grupo_avaliacao_relatorio is not NULL;
AND rahr.periodo IN (1,2);

BEGIN;

ROLLBACK ;

 with respostas_antigas as (
select ra.id_matricula_discente_serie, rahr.id_relatorio_avaliativo_habilidade_resposta, mc.id_componente_curricular, crch.id_habilidade_competencia, rahr.id_opcao_grupo_avaliacao_relatorio, rahr.periodo  from ensino_infantil.relatorio_avaliativo ra 
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join ensino_infantil.relatorio_avaliativo_habilidade rah on rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
where ra.id_matricula_discente_serie in (1357694) and ra.ativo and rahr.id_opcao_grupo_avaliacao_relatorio is not null), 
respostas_atuais as (
select ra.id_matricula_discente_serie, rahr.id_relatorio_avaliativo_habilidade_resposta, mc.id_componente_curricular, crch.id_habilidade_competencia, rahr.id_opcao_grupo_avaliacao_relatorio, rahr.periodo  from ensino_infantil.relatorio_avaliativo ra 
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join ensino_infantil.relatorio_avaliativo_habilidade rah on rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
join ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr on rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
where ra.id_matricula_discente_serie  in (1360912) and ra.ativo )
select 'update ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr set id_opcao_grupo_avaliacao_relatorio = ' || ra.id_opcao_grupo_avaliacao_relatorio || ' where rahr.id_relatorio_avaliativo_habilidade_resposta = ' || rat.id_relatorio_avaliativo_habilidade_resposta || ';' as solucao, 
'update ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr set id_opcao_grupo_avaliacao_relatorio = ' || coalesce(rat.id_opcao_grupo_avaliacao_relatorio::text, 'null') || ' where rahr.id_relatorio_avaliativo_habilidade_resposta = ' || rat.id_relatorio_avaliativo_habilidade_resposta || ';' as backup
from respostas_antigas ra 
join respostas_atuais rat on rat.id_componente_curricular = ra.id_componente_curricular;
and rat.id_habilidade_competencia = ra.id_habilidade_competencia 
and rat.periodo = ra.periodo 
and rat.id_matricula_discente_serie = ra.id_matricula_discente_serie;
where rat.id_opcao_grupo_avaliacao_relatorio is null;



/*
 *
1357694 cancelada 
1360912 ativa
*/


