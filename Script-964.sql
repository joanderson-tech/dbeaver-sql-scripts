select mes.id_estudante, COUNT(*)
from  basico.matricula_estudante_serie mes
--join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
--join ensino_infantil.parecer_descritivo_individual pdi on pdi.id_matricula_discente_serie = ra.id_matricula_discente_serie
--join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join ensino.turma t on t.id_turma_serie = mes.id_turma_serie
join  ensino.matricula_componente mc on mc.id_discente  = mes.id_estudante
and mc.id_turma = t.id_turma
where mes.id_turma_serie in (53037900)
and mc.id_situacao_matricula = 7
group by mes.id_estudante;

select * from ensino.turma t where t.id_turma_serie = 53037900;

select rac
FROM ensino_infantil.relatorio_avaliativo_componente  rac
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
join basico.matricula_estudante_serie mes on mes.id_matricula_discente_serie = mc.id_matricula_estudante_serie
where mes.id_matricula_discente_serie  = 1327733
and mc.id_situacao_matricula = 7
and rac.avaliacao_descritiva is not null;

select * from ensino.matricula_componente mc where mc.id_matricula_estudante_serie = 1327733;
17120428

select * from basico.matricula_estudante_serie mes where  mes.id_turma_serie = 53037900;


--and rac.avaliacao_descritiva is not null;
order by   mc.id_discente, mc.id_situacao_matricula,mc.id_componente_curricular;

select distinct rac.id_matricula_componente, ra.id_relatorio_avaliativo, rac.id_relatorio_avaliativo_componente , mc2.id_matricula_componente AS id_matricula_componente_mc2
from  basico.matricula_estudante_serie mes
join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
join ensino.matricula_componente mc2 on mc2.id_discente = mc.id_discente 
and mc2.id_turma = mc.id_turma 
and mc2.id_situacao_matricula = 2
where mes.id_turma_serie in (53037900)
and mc.id_discente = 977392;

select  rac.id_relatorio_avaliativo_componente,  
    mc.id_matricula_componente as matricula_ativa, 
    mc2.id_matricula_componente AS matricula_excluida
from basico.matricula_estudante_serie mes
join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
and ra.ativo = false
join ensino.turma t on t.id_turma_serie = mes.id_turma_serie
join  ensino.matricula_componente mc on mc.id_discente  = mes.id_estudante
   and mc.id_situacao_matricula = 2
   and mc.id_turma = t.id_turma
join ensino.matricula_componente mc2  on mc2.id_discente = mc.id_discente 
   and mc2.id_turma = mc.id_turma 
   and mc2.id_situacao_matricula = 7
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
and mc2.id_matricula_componente = rac.id_matricula_componente
where mes.id_turma_serie in (53037900);

select * from ensino.matricula_componente where id_matricula_componente = 17146734;

select * from  ensino_infantil.relatorio_avaliativo_componente
--SET id_matricula_componente = 17146691
WHERE id_relatorio_avaliativo_componente = 23829;

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

-- backup Inativar 
SELECT 'UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = ' || id_relatorio_avaliativo_inativar || ';' as backup
FROM backup_relatorio_avaliativo
where id_relatorio_avaliativo_inativar is not null;

-- backup Ativar 
SELECT 'UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = ' || id_relatorio_avaliativo_ativar || ';' as backup
FROM backup_relatorio_avaliativo;

--commit;
rollback;

UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120260 WHERE id_relatorio_avaliativo_componente = 23793;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120263 WHERE id_relatorio_avaliativo_componente = 23792;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120264 WHERE id_relatorio_avaliativo_componente = 23791;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120266 WHERE id_relatorio_avaliativo_componente = 23790;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120261 WHERE id_relatorio_avaliativo_componente = 23794;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120262 WHERE id_relatorio_avaliativo_componente = 23788;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120267 WHERE id_relatorio_avaliativo_componente = 23789;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120268 WHERE id_relatorio_avaliativo_componente = 23795;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120265 WHERE id_relatorio_avaliativo_componente = 23787;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120283 WHERE id_relatorio_avaliativo_componente = 23846;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120280 WHERE id_relatorio_avaliativo_componente = 23847;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120281 WHERE id_relatorio_avaliativo_componente = 23848;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120288 WHERE id_relatorio_avaliativo_componente = 23849;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120282 WHERE id_relatorio_avaliativo_componente = 23842;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120284 WHERE id_relatorio_avaliativo_componente = 23845;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120286 WHERE id_relatorio_avaliativo_componente = 23844;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120287 WHERE id_relatorio_avaliativo_componente = 23843;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120285 WHERE id_relatorio_avaliativo_componente = 23841;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120290 WHERE id_relatorio_avaliativo_componente = 23865;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120291 WHERE id_relatorio_avaliativo_componente = 23866;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120292 WHERE id_relatorio_avaliativo_componente = 23860;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120293 WHERE id_relatorio_avaliativo_componente = 23864;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120294 WHERE id_relatorio_avaliativo_componente = 23863;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120296 WHERE id_relatorio_avaliativo_componente = 23862;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120297 WHERE id_relatorio_avaliativo_componente = 23861;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120298 WHERE id_relatorio_avaliativo_componente = 23867;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120295 WHERE id_relatorio_avaliativo_componente = 23859;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120300 WHERE id_relatorio_avaliativo_componente = 23883;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120301 WHERE id_relatorio_avaliativo_componente = 23884;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120302 WHERE id_relatorio_avaliativo_componente = 23878;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120303 WHERE id_relatorio_avaliativo_componente = 23882;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120304 WHERE id_relatorio_avaliativo_componente = 23881;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120306 WHERE id_relatorio_avaliativo_componente = 23880;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120307 WHERE id_relatorio_avaliativo_componente = 23879;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120308 WHERE id_relatorio_avaliativo_componente = 23885;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120305 WHERE id_relatorio_avaliativo_componente = 23877;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120316 WHERE id_relatorio_avaliativo_componente = 23898;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120317 WHERE id_relatorio_avaliativo_componente = 23897;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120310 WHERE id_relatorio_avaliativo_componente = 23901;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120311 WHERE id_relatorio_avaliativo_componente = 23902;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120312 WHERE id_relatorio_avaliativo_componente = 23896;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120313 WHERE id_relatorio_avaliativo_componente = 23900;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120314 WHERE id_relatorio_avaliativo_componente = 23899;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120318 WHERE id_relatorio_avaliativo_componente = 23903;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120315 WHERE id_relatorio_avaliativo_componente = 23895;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120355 WHERE id_relatorio_avaliativo_componente = 23994;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120350 WHERE id_relatorio_avaliativo_componente = 24000;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120351 WHERE id_relatorio_avaliativo_componente = 24001;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120352 WHERE id_relatorio_avaliativo_componente = 23995;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120353 WHERE id_relatorio_avaliativo_componente = 23999;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120354 WHERE id_relatorio_avaliativo_componente = 23998;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120356 WHERE id_relatorio_avaliativo_componente = 23997;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120357 WHERE id_relatorio_avaliativo_componente = 23996;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120358 WHERE id_relatorio_avaliativo_componente = 24002;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120380 WHERE id_relatorio_avaliativo_componente = 23838;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120381 WHERE id_relatorio_avaliativo_componente = 23839;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120382 WHERE id_relatorio_avaliativo_componente = 23833;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120383 WHERE id_relatorio_avaliativo_componente = 23837;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120384 WHERE id_relatorio_avaliativo_componente = 23836;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120386 WHERE id_relatorio_avaliativo_componente = 23835;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120387 WHERE id_relatorio_avaliativo_componente = 23834;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120388 WHERE id_relatorio_avaliativo_componente = 23840;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120385 WHERE id_relatorio_avaliativo_componente = 23832;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120460 WHERE id_relatorio_avaliativo_componente = 27176;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120461 WHERE id_relatorio_avaliativo_componente = 27177;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120462 WHERE id_relatorio_avaliativo_componente = 27171;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120463 WHERE id_relatorio_avaliativo_componente = 27175;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120464 WHERE id_relatorio_avaliativo_componente = 27174;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120465 WHERE id_relatorio_avaliativo_componente = 27170;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120466 WHERE id_relatorio_avaliativo_componente = 27173;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120467 WHERE id_relatorio_avaliativo_componente = 27172;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17120468 WHERE id_relatorio_avaliativo_componente = 27178;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121393 WHERE id_relatorio_avaliativo_componente = 23904;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121390 WHERE id_relatorio_avaliativo_componente = 23905;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121396 WHERE id_relatorio_avaliativo_componente = 23912;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121388 WHERE id_relatorio_avaliativo_componente = 23910;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121389 WHERE id_relatorio_avaliativo_componente = 23911;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121392 WHERE id_relatorio_avaliativo_componente = 23908;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121394 WHERE id_relatorio_avaliativo_componente = 23907;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121395 WHERE id_relatorio_avaliativo_componente = 23906;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121391 WHERE id_relatorio_avaliativo_componente = 23909;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121414 WHERE id_relatorio_avaliativo_componente = 23934;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121415 WHERE id_relatorio_avaliativo_componente = 23933;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121408 WHERE id_relatorio_avaliativo_componente = 23937;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121409 WHERE id_relatorio_avaliativo_componente = 23938;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121410 WHERE id_relatorio_avaliativo_componente = 23932;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121411 WHERE id_relatorio_avaliativo_componente = 23936;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121412 WHERE id_relatorio_avaliativo_componente = 23935;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121413 WHERE id_relatorio_avaliativo_componente = 23931;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121416 WHERE id_relatorio_avaliativo_componente = 23939;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121252 WHERE id_relatorio_avaliativo_componente = 27111;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121254 WHERE id_relatorio_avaliativo_componente = 27110;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121256 WHERE id_relatorio_avaliativo_componente = 27115;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121253 WHERE id_relatorio_avaliativo_componente = 27107;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121248 WHERE id_relatorio_avaliativo_componente = 27113;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121255 WHERE id_relatorio_avaliativo_componente = 27109;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121249 WHERE id_relatorio_avaliativo_componente = 27114;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121250 WHERE id_relatorio_avaliativo_componente = 27108;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121251 WHERE id_relatorio_avaliativo_componente = 27112;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121268 WHERE id_relatorio_avaliativo_componente = 28490;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121275 WHERE id_relatorio_avaliativo_componente = 28486;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121270 WHERE id_relatorio_avaliativo_componente = 28485;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121271 WHERE id_relatorio_avaliativo_componente = 28489;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121272 WHERE id_relatorio_avaliativo_componente = 28488;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121274 WHERE id_relatorio_avaliativo_componente = 28487;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121273 WHERE id_relatorio_avaliativo_componente = 28484;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121269 WHERE id_relatorio_avaliativo_componente = 28491;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121276 WHERE id_relatorio_avaliativo_componente = 28492;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121310 WHERE id_relatorio_avaliativo_componente = 28944;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121311 WHERE id_relatorio_avaliativo_componente = 28948;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121312 WHERE id_relatorio_avaliativo_componente = 28947;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121314 WHERE id_relatorio_avaliativo_componente = 28946;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121315 WHERE id_relatorio_avaliativo_componente = 28945;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121313 WHERE id_relatorio_avaliativo_componente = 28943;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121308 WHERE id_relatorio_avaliativo_componente = 28949;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121309 WHERE id_relatorio_avaliativo_componente = 28950;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121316 WHERE id_relatorio_avaliativo_componente = 28951;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121318 WHERE id_relatorio_avaliativo_componente = 29111;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121319 WHERE id_relatorio_avaliativo_componente = 29112;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121320 WHERE id_relatorio_avaliativo_componente = 29106;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121321 WHERE id_relatorio_avaliativo_componente = 29110;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121322 WHERE id_relatorio_avaliativo_componente = 29109;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121324 WHERE id_relatorio_avaliativo_componente = 29108;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121325 WHERE id_relatorio_avaliativo_componente = 29107;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121326 WHERE id_relatorio_avaliativo_componente = 29113;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121323 WHERE id_relatorio_avaliativo_componente = 29105;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121343 WHERE id_relatorio_avaliativo_componente = 29177;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121340 WHERE id_relatorio_avaliativo_componente = 29178;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121344 WHERE id_relatorio_avaliativo_componente = 29180;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121345 WHERE id_relatorio_avaliativo_componente = 29179;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121338 WHERE id_relatorio_avaliativo_componente = 29183;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121339 WHERE id_relatorio_avaliativo_componente = 29184;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121341 WHERE id_relatorio_avaliativo_componente = 29182;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121342 WHERE id_relatorio_avaliativo_componente = 29181;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121346 WHERE id_relatorio_avaliativo_componente = 29185;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121373 WHERE id_relatorio_avaliativo_componente = 26024;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121368 WHERE id_relatorio_avaliativo_componente = 26030;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121369 WHERE id_relatorio_avaliativo_componente = 26031;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121370 WHERE id_relatorio_avaliativo_componente = 26025;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121371 WHERE id_relatorio_avaliativo_componente = 26029;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121372 WHERE id_relatorio_avaliativo_componente = 26028;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121374 WHERE id_relatorio_avaliativo_componente = 26027;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121375 WHERE id_relatorio_avaliativo_componente = 26026;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17121376 WHERE id_relatorio_avaliativo_componente = 26032;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17126642 WHERE id_relatorio_avaliativo_componente = 18825;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17126643 WHERE id_relatorio_avaliativo_componente = 18822;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17126636 WHERE id_relatorio_avaliativo_componente = 18820;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17126637 WHERE id_relatorio_avaliativo_componente = 18818;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17126638 WHERE id_relatorio_avaliativo_componente = 18819;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17126639 WHERE id_relatorio_avaliativo_componente = 18823;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17126640 WHERE id_relatorio_avaliativo_componente = 18824;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17126641 WHERE id_relatorio_avaliativo_componente = 18821;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17126644 WHERE id_relatorio_avaliativo_componente = 18817;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17137795 WHERE id_relatorio_avaliativo_componente = 27301;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17137796 WHERE id_relatorio_avaliativo_componente = 27300;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17137797 WHERE id_relatorio_avaliativo_componente = 27299;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17137799 WHERE id_relatorio_avaliativo_componente = 27302;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17137800 WHERE id_relatorio_avaliativo_componente = 27303;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17137801 WHERE id_relatorio_avaliativo_componente = 27297;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17137803 WHERE id_relatorio_avaliativo_componente = 27298;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17137804 WHERE id_relatorio_avaliativo_componente = 27296;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17137798 WHERE id_relatorio_avaliativo_componente = 27304;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17142946 WHERE id_relatorio_avaliativo_componente = 31851;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17142947 WHERE id_relatorio_avaliativo_componente = 31852;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17142948 WHERE id_relatorio_avaliativo_componente = 31846;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17142949 WHERE id_relatorio_avaliativo_componente = 31850;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17142950 WHERE id_relatorio_avaliativo_componente = 31849;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17142951 WHERE id_relatorio_avaliativo_componente = 31845;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17142952 WHERE id_relatorio_avaliativo_componente = 31848;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17142953 WHERE id_relatorio_avaliativo_componente = 31847;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente = 17142954 WHERE id_relatorio_avaliativo_componente = 31853;





UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 2469;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3053;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3058;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3059;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3061;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3063;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3065;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3066;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3069;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3076;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3306;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3427;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3434;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3448;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3580;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3631;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3649;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3657;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false  WHERE id_relatorio_avaliativo = 3997;





UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4237;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4356;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4359;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4360;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4362;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4363;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4365;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4366;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4369;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4373;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4355;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4361;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4357;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4372;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4364;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4368;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4370;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4371;
UPDATE ensino_infantil.relatorio_avaliativo SET ativo = true  WHERE id_relatorio_avaliativo = 4367;