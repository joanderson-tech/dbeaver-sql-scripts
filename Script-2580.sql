BEGIN;
ROLLBACK;



SELECT *
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693);

--associa a serie_multisseriada.
INSERT INTO basico.serie_multisseriada (id_serie_multisseriada, id_serie, id_serie_associada, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao) 
VALUES(nextval('basico.serie_multisseriada_seq'), 51900646, 51893825, true, null, NULL, now(), NULL);

-- backup
DELETE
FROM basico.serie_multisseriada sm1
WHERE sm1.id_serie_multisseriada IN (SELECT id_serie_multisseriada
FROM basico.serie_multisseriada sm
WHERE sm.id_serie = 51900646
AND sm.id_serie_associada = 51893825
AND sm.ativo ) ;


--Atualiza curriculo associado a estrutura multiseriada associada a serie.
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51894087 WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=FALSE WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892878;

--backup desativa os curriculos associado a estrutura multiseriada 
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51892872 WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=true WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892878;

--desativa as series erradas 
UPDATE basico.serie_multisseriada SET ativo=false    WHERE id_serie_multisseriada IN (41,42);

--backup desativa as series erradas 
UPDATE basico.serie_multisseriada SET ativo=false    WHERE id_serie_multisseriada IN (41,42);


--backup e solução desativa as tumas series vinculada a serie errada. 
SELECT 
'UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET ativo=true WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)
AND ts.id_serie IN (51892871);

UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( 51903797,51904194,51906753,51906796,51906838,51916697);

--Atualiza as turmas seria da para a serie e curriculo da nova serie.
SELECT 
'UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET id_serie=51892870, id_curriculo_medio=51892872 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693) 
AND ts.ativo 
AND ts.id_serie = 51892870
AND ts.id_curriculo_medio = 51892872;

UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( 51906752,51903796,51904193,51906795,51906837,51916696);

UPDATE basico.turma_serie SET id_serie=51892870, id_curriculo_medio=51892872 WHERE id_turma_serie IN ( 51906752,51903796,51904193,51906795,51906837,51916696);

-- solução desativa as matriculas do estudante alinhado com suporte.
SELECT 
'UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS solução,
'UPDATE ensino.matricula_componente SET id_situacao_matricula='||mc.id_situacao_matricula ||'  WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
WHERE ts.id_turma_serie IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)  
OR ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693) 
GROUP BY mc.id_situacao_matricula;

UPDATE ensino.matricula_componente SET id_situacao_matricula=3 WHERE id_matricula_componente IN ( 17018963,17018962,17018964,17018965,17018966,17018967,17018968,17018969,17018970,17018971,17018998,17018999,17019000,17019001,17019002,17019003,17019004,17019005,17019006,17019007,17019008,17019009,17019010,17019011,17019012,17019013,17019014,17019015,17019016,17019017,17019018,17019019,17019020,17019021,17019022,17019023,17019024,17019025,17019026,17019027,17019028,17019029,17019030,17019031,17019032,17019033,17019034,17019035,17019036,17019037,17019038,17019039,17019040,17019041,17019042,17019043,17019044,17019045,17019046,17019047,17019048,17019049,17019050,17019051,17019052,17019053,17019054,17019055,17019056,17019057,17019222,17019223,17019224,17019225,17019226,17019227,17019228,17019229,17025576,17025577,17025578,17025579,17025580,17025581,17025582,17025583,17029241,17029242,17029243,17029244,17029245,17029246,17029247,17029248,17029249,17029250,17029251,17029252,17029301,17029302,17029303,17029304,17029305,17029306,17029307,17029308,17029309,17029310,17035317,17035318,17035319,17035320,17035321,17035322,17035323,17035324,17035325,17035326,17035327,17035328,17035329,17035330,17035331);





