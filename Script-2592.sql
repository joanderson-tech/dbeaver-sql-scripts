--Solução estrutura MULTIMAP    

BEGIN;

-- Associa a série correta à estrutura multisseriada.
INSERT INTO basico.serie_multisseriada (id_serie_multisseriada, id_serie, id_serie_associada, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao) 
VALUES(nextval('basico.serie_multisseriada_seq'), 51900646, 51893825, true, null, NULL, now(), NULL);

-- Atualiza o currículo associado à estrutura multisseriada para utilizar a série correta.
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51894087 WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=FALSE WHERE id_curriculo_basico=51893832 AND id_curriculo_basico_serie_associada=51892878;

-- Desativa os vínculos incorretos da estrutura multisseriada.
UPDATE basico.serie_multisseriada SET ativo=false    WHERE id_serie_multisseriada IN (41,42);

-- Gera os scripts de solução e backup para desativar os vínculos de turma/série associados à série incorreta.
SELECT 
'UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET ativo=true WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)
AND ts.id_serie IN (51892871);

UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( 51903797,51904194,51906753,51906796,51906838,51916697);



-- Gera os scripts de solução e backup para atualizar a série e o currículo das turmas para a estrutura correta.
SELECT 
'UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET id_serie=51892870, id_curriculo_medio=51892872 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693) 
AND ts.ativo 
AND ts.id_serie = 51892870
AND ts.id_curriculo_medio = 51892872;

UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( 51903796,51904193,51906752,51906795,51906837,51916696);


-- Gera os scripts de solução e backup para atualizar a situação das matrículas dos componentes dos estudantes, conforme alinhamento com o suporte.
SELECT 
'UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS solução,
'UPDATE ensino.matricula_componente SET id_situacao_matricula='||mc.id_situacao_matricula ||'  WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
WHERE ts.id_turma_serie IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693)  
OR ts.id_turma_serie_agrupadora IN (51903793, 51904190, 51906749, 51906792, 51906834, 51916693) 
GROUP BY mc.id_situacao_matricula;

UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( 17018962,17018963,17018964,17018965,17018966,17018967,17018968,17018969,17018970,17018971,17018998,17018999,17019000,17019001,17019002,17019003,17019004,17019005,17019006,17019007,17019008,17019009,17019010,17019011,17019012,17019013,17019014,17019015,17019016,17019017,17019018,17019019,17019020,17019021,17019022,17019023,17019024,17019025,17019026,17019027,17019028,17019029,17019030,17019031,17019032,17019033,17019034,17019035,17019036,17019037,17019038,17019039,17019040,17019041,17019042,17019043,17019044,17019045,17019046,17019047,17019048,17019049,17019050,17019051,17019052,17019053,17019054,17019055,17019056,17019057,17019222,17019223,17019224,17019225,17019226,17019227,17019228,17019229,17025576,17025577,17025578,17025579,17025580,17025581,17025582,17025583,17029241,17029242,17029243,17029244,17029245,17029246,17029247,17029248,17029249,17029250,17029251,17029252,17029301,17029302,17029303,17029304,17029305,17029306,17029307,17029308,17029309,17029310,17035317,17035318,17035319,17035320,17035321,17035322,17035323,17035324,17035325,17035326,17035327,17035328,17035329,17035330,17035331);

--Solução estrutura SEC    

-- Associa a série correta à estrutura multisseriada.
INSERT INTO basico.serie_multisseriada (id_serie_multisseriada, id_serie, id_serie_associada, ativo, id_registro_cadastro, id_registro_atualizacao, data_cadastro, data_alteracao) 
VALUES(nextval('basico.serie_multisseriada_seq'), 51869737, 51893825, true, null, NULL, now(), NULL);

-- Atualiza o currículo associado à estrutura multisseriada para utilizar a série correta.
UPDATE basico.curriculo_basico_serie_multisseriada SET id_curriculo_basico_serie_associada=51894087 WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892872 AND ativo=true;
UPDATE basico.curriculo_basico_serie_multisseriada SET ativo=FALSE WHERE id_curriculo_basico=51906797 AND id_curriculo_basico_serie_associada=51892878;

-- Desativa os vínculos incorretos da estrutura multisseriada.
UPDATE basico.serie_multisseriada SET ativo=false    WHERE id_serie_multisseriada IN (39, 40);

-- Gera os scripts de solução e backup para desativar os vínculos de turma/série associados à série incorreta.
SELECT 
'UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET ativo=true WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51906811, 51908329)
AND ts.id_serie IN (51892871);

UPDATE basico.turma_serie SET ativo=false WHERE id_turma_serie IN ( 51906814,51908332);

-- Gera os scripts de solução e backup para atualizar a série e o currículo das turmas para a estrutura correta.
SELECT 
'UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS solução,
'UPDATE basico.turma_serie SET id_serie=51892870, id_curriculo_medio=51892872 WHERE id_turma_serie IN ( ' || string_agg(id_turma_serie::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
WHERE ts.id_turma_serie_agrupadora IN (51906811, 51908329) 
AND ts.ativo 
AND ts.id_serie = 51892870
AND ts.id_curriculo_medio = 51892872;

UPDATE basico.turma_serie SET id_serie=51893825, id_curriculo_medio=51894087 WHERE id_turma_serie IN ( 51906813,51908331);

-- Gera os scripts de solução e backup para atualizar a situação das matrículas dos componentes dos estudantes, conforme alinhamento com o suporte.
SELECT 
'UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS solução,
'UPDATE ensino.matricula_componente SET id_situacao_matricula='||mc.id_situacao_matricula ||'  WHERE id_matricula_componente IN ( ' || string_agg(mc.id_matricula_componente::TEXT,',') || ');' AS backup
FROM basico.turma_serie ts
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie  
WHERE ts.id_turma_serie IN (51906811, 51908329)  
OR ts.id_turma_serie_agrupadora IN (51906811, 51908329) 
GROUP BY mc.id_situacao_matricula;


UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( 17029253,17029254,17029255,17029256,17029257,17029258,17029259,17029260,17029261);
UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN ( 17029262,17029263,17029264,17029265,17029266,17029267,17029268,17029269,17029270,17029271,17029272,17029273,17029496,17029497,17029498,17029499,17029500,17029501,17029502,17029503,17029504,17041272,17041273,17041274,17041275,17041276,17041277,17041278,17041279,17041280,17041281,17041282,17041283,17041284,17041285,17041286,17041287,17041288,17041289,17041290,17041291,17041292,17041293,17041294,17041295,17041296,17041297,17041298,17041299,17041300,17041301,17041302,17041303,17041304,17041305,17041306,17041307,17041308,17041309,17041310,17041311,17041312,17041313,17041314,17041315,17041316,17041317,17041318,17041319,17041320,17041321,17041322,17041323,17041324,17041325,17041326,17041327,17041328,17041329,17041330,17041331,17041332,17041333,17041334,17041335,17041336,17041337,17041338,17041339,17041340,17041341,17041342,17041343);

COMMIT;
