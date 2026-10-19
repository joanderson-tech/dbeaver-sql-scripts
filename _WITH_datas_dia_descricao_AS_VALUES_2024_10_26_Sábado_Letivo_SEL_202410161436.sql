INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693770,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693642,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692228,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693157,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694078,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694730,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694783,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694773,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693699,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694211,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694758,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692186,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693274,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693493,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692887,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693548,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693262,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693976,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695184,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695072,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694003,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694692,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693346,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693263,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693258,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694847,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695165,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694739,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694553,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694248,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693338,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694126,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692194,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692240,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694422,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694516,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692649,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692524,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692190,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694762,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694267,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694794,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692640,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694772,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692599,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692065,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694680,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692600,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694731,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694693,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694753,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694041,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693994,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692683,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695044,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692302,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692586,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692793,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692160,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693110,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692999,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692182,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692764,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692692,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692587,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692520,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693054,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692452,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694768,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695053,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693703,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692604,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694800,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693341,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694338,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693947,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692384,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695183,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694301,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693586,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693779,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695187,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694229,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695202,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692584,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694515,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693259,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692590,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694769,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692105,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692588,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694487,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692403,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694792,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693576,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694059,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693751,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694987,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695146,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692344,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692078,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694702,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693700,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693693,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695006,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694799,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694819,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693339,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694751,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693285,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694978,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692952,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692774,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694116,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694460,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695174,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693483,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694807,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694782,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694393,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694145,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693695,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692658,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694744,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693167,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694668,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692678,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692504,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692202,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695211,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694607,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692236,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692306,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694784,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693260,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692052,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693465,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693549,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694300,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694144,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693595,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693337,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693257,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692592,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693082,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693920,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694745,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694749,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694329,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694543,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694748,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694756,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693558,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694572,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693577,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695128,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694810,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694688,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695015,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694611,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692583,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694374,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692925,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694590,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692594,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692123,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693148,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694402,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694913,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693073,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694804,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694506,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694404,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692682,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692198,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693351,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693651,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692981,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694786,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692508,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692765,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692869,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692670,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694117,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693752,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694950,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692897,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694581,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692838,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694239,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692465,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694776,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694571,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694811,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693836,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692380,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693854,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694764,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692336,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693863,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692178,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694941,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694785,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692151,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694741,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692595,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694752,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692701,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694672,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694838,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694809,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693129,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694774,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693492,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694818,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692142,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692332,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694740,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694779,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693975,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694276,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692605,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692839,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695191,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694787,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692906,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694384,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694816,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693882,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694777,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694808,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694763,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694107,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693938,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694172,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693261,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692394,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694032,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693733,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694789,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692478,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694403,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694310,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694790,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694988,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693957,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693845,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693724,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692132,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694781,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695188,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694737,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693266,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694760,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694684,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695043,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694757,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694805,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694771,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692601,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693340,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692246,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694488,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692990,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692915,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695189,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695137,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692232,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694173,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692603,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692385,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693101,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694257,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694627,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692662,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693271,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694755,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693166,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693780,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694903,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693272,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693714,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694191,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694319,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693303,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693265,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694088,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694931,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692364,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694182,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693045,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693985,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692840,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694413,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692953,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694736,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693696,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694534,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693873,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694791,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694812,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692878,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694031,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694813,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693864,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694814,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692220,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692376,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693083,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693702,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693614,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694788,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694004,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693632,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694469,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693027,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694220,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693269,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692598,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695062,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694623,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694525,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693347,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693120,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694734,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694098,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693139,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694798,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693185,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692841,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693036,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695034,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693055,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694060,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694747,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692372,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694450,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693342,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693511,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694759,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694793,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693275,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694154,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693798,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692420,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694089,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694328,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694729,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694767,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693919,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694202,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693789,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694478,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695190,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692980,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694817,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693270,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695071,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695081,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693723,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692416,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692211,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694711,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693343,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695155,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693742,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693633,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694562,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692589,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694857,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695185,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693948,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694803,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692934,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695025,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692340,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694796,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693273,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693268,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693064,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692169,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695192,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695193,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693704,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694013,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693092,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693567,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693502,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693761,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694615,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694802,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694866,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694441,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694431,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693835,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692811,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693345,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694459,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694746,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694432,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692666,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692320,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693705,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695016,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693691,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694932,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695090,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695156,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693111,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694775,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694163,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694022,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693701,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694743,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694959,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694797,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694742,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692943,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694780,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693623,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694258,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694766,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692591,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694806,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693294,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693690,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693692,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692582,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694848,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694754,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692316,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694969,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694997,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693138,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692039,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692516,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694201,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693176,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692114,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694497,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694795,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695186,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694544,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694750,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693698,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692224,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694676,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694375,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694347,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692868,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694738,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694770,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693350,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692859,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692593,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693697,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),695127,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694606,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692491,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692091,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692596,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693464,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693605,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692630,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693474,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693344,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694960,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692783,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694922,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692328,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692585,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692971,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693966,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694820,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694735,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693026,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692924,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692368,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693264,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694904,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694815,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694829,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693349,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694801,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694619,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693267,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694050,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694761,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693694,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694732,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693276,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692802,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693348,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692631,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693604,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),693929,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694230,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692792,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692597,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694069,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692602,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694135,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692674,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692962,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694765,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692850,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692512,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694733,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),692896,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');'),
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694778,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
INSERT INTO "WITH datas (dia, descricao) AS (VALUES
   ('2024-10-26', 'Sábado Letivo'))
SELECT DISTINCT  'INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),'||CASE WHEN t.id_turma_agrupadora IS NOT NULL THEN t.id_turma_agrupadora ELSE t.id_turma END ||','''|| d.dia || ''','''||current_date||''',1,3,'''||d.descricao||''');'
	FROM ensino.turma t, datas d
WHERE id_situacao_turma NOT IN (4,9) 
AND t.ano = 2024 
--para não repetir o que já tem
AND NOT exists(SELECT 1 FROM ava.aula_extra ae WHERE ae.id_turma = t.id_turma AND ae.data_aula = d.dia::date)
" ("?column?") VALUES
	 ('INSERT INTO ava.aula_extra (id,id_turma,data_aula,criado_em,numero_aulas,tipo,descricao) 
	VALUES(nextval(''hibernate_sequence''),694087,''2024-10-26'',''2024-10-16'',1,3,''Sábado Letivo'');');
