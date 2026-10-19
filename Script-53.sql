SELECT * 
FROM basico.matricula_estudante_serie mes
INNER JOIN public.discente d ON d.id_discente = mes.id_estudante
INNER JOIN  comum.pessoa p ON p.id_pessoa = d.id_pessoa
INNER JOIN basico.situacao_matricula_serie sms ON sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
INNER JOIN escola.escola_etapa_ensino_serie eees ON eees.id_escola_etapa_ensino_serie = mes.id_serie_escola
INNER JOIN basico.serie s ON s.id_serie = eees.id_serie
LEFT JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie
INNER JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
INNER JOIN ensino.turno t ON t.id_turno = mes.id_turno
WHERE mes.ano_calendario = 2023
   AND d.matricula = '202330004030'; 
 
--mes idTurmaserie 52763073
  
--frequencia aluno idTurma
  
--Matricula componete id turma antiga/ id estudante 
  
 -- IdTumas mc 700242,700248,700247,700244,700243,700245,700240,700241,700246
 


SELECT x.* FROM basico.serie x
WHERE id_serie = 15290013;





SELECT mc.nome, * 
FROM ensino.turma x
inner join ensino.componente_curricular mc on mc.id_componente_curricular = x.id_disciplina 
WHERE id_turma_serie = 52763073;

select * 
from ensino.matricula_componente mc
where mc.id_turma in (700242,700248,700247,700244,700243,700245,700240,700241,700246)
and id_discente = 980373;

select * 
from ensino.turma x
where x.codigo = 'EJAF2N6P7A'
and id_turma_serie = 52763072
;

select * from basico.turma_serie ts 
where ts.id_escola = 1229
and ts.nome = 'EJAF2N6P7A';

select * 
from ensino.turma x
where x.codigo = 'EJAF2N6P7B'
and id_turma_serie = 52802796
;


select * from ensino.turma t 
where t.id_turma_serie = 52763072;

select * 
from ensino.matricula_componente mc ;

SELECT mc.nome, * 
FROM ensino.turma x
inner join ensino.componente_curricular mc on mc.id_componente_curricular = x.id_disciplina 
WHERE id_turma_serie = 52763072;

select * from ensino.turma t 
where t.id_turma_serie = 52802796;

SELECT x.* FROM escola.escola_etapa_ensino_serie x
WHERE x.id_escola  = 1229
and x.id_serie = 51872460;

--agora

-- CONSULTA DO COMPONENTE
select * 
from ensino.matricula_componente mc
where mc.id_turma in (700242,700248,700247,700244,700243,700245,700240,700241,700246)
and id_discente = 980373; 

-- CONSULTA DO COMPONENTE DA TURMA DE TRANSFERENCIA
select * 
from ensino.turma x
where x.codigo = 'EJAF2N6P7A'
and id_turma_serie = 52763072
;

select * 
from basico.matricula_estudante_serie mes 
where mes.id_turma_serie = 52763072
and id_matricula_discente_serie = 1339544;

-------------
--Id_serie
51872460

--ID_TurmaSerie
52763072

--ID_curriculo medio 
35558311

-- id_serie_escola
51877389
-----------



begin
commit	
rollback

--solução
UPDATE basico.matricula_estudante_serie
	SET id_turma_serie=52763072, id_curriculo_medio=35558311, id_serie_escola=51877388
	WHERE id_matricula_discente_serie=1339544;

--solução

UPDATE ensino.matricula_componente SET id_turma=700232 WHERE id_matricula_componente=17245402;
UPDATE ensino.matricula_componente SET id_turma=700231 WHERE id_matricula_componente=17245399;
UPDATE ensino.matricula_componente SET id_turma=700236 WHERE id_matricula_componente=17245414;
UPDATE ensino.matricula_componente SET id_turma=700234 WHERE id_matricula_componente=17245408;
UPDATE ensino.matricula_componente SET id_turma=700235 WHERE id_matricula_componente=17245411;
UPDATE ensino.matricula_componente SET id_turma=700238 WHERE id_matricula_componente=17245420;
UPDATE ensino.matricula_componente SET id_turma=700239 WHERE id_matricula_componente=17245423;
UPDATE ensino.matricula_componente SET id_turma=700233 WHERE id_matricula_componente=17245405;
UPDATE ensino.matricula_componente SET id_turma=700237 WHERE id_matricula_componente=17245417;

-- Backup

UPDATE ensino.matricula_componente SET id_turma=700242 WHERE id_matricula_componente=17245405;
UPDATE ensino.matricula_componente SET id_turma=700248 WHERE id_matricula_componente=17245423;
UPDATE ensino.matricula_componente SET id_turma=700247 WHERE id_matricula_componente=17245420;
UPDATE ensino.matricula_componente SET id_turma=700244 WHERE id_matricula_componente=17245411;
UPDATE ensino.matricula_componente SET id_turma=700243 WHERE id_matricula_componente=17245408;
UPDATE ensino.matricula_componente SET id_turma=700245 WHERE id_matricula_componente=17245414;
UPDATE ensino.matricula_componente SET id_turma=700240 WHERE id_matricula_componente=17245399;
UPDATE ensino.matricula_componente SET id_turma=700241 WHERE id_matricula_componente=17245402;
UPDATE ensino.matricula_componente SET id_turma=700246 WHERE id_matricula_componente=17245417;


---------------------------------------------------

--solução
UPDATE basico.matricula_estudante_serie
	SET id_turma_serie=52802796, id_curriculo_medio=35558311, id_serie_escola=51877388
	WHERE id_matricula_discente_serie=1339544;

--solução
UPDATE ensino.matricula_componente SET id_turma=700505 WHERE id_matricula_componente=17245405;
UPDATE ensino.matricula_componente SET id_turma=700511 WHERE id_matricula_componente=17245423;
UPDATE ensino.matricula_componente SET id_turma=700510 WHERE id_matricula_componente=17245420;
UPDATE ensino.matricula_componente SET id_turma=700507 WHERE id_matricula_componente=17245411;
UPDATE ensino.matricula_componente SET id_turma=700506 WHERE id_matricula_componente=17245408;
UPDATE ensino.matricula_componente SET id_turma=700508 WHERE id_matricula_componente=17245414;
UPDATE ensino.matricula_componente SET id_turma=700503 WHERE id_matricula_componente=17245399;
UPDATE ensino.matricula_componente SET id_turma=700504 WHERE id_matricula_componente=17245402;
UPDATE ensino.matricula_componente SET id_turma=700509 WHERE id_matricula_componente=17245417;


--Backup
UPDATE basico.matricula_estudante_serie
	SET id_turma_serie=52763073, id_curriculo_medio=35550998, id_serie_escola=51877389
	WHERE id_matricula_discente_serie=1339544;

-- Backup

UPDATE ensino.matricula_componente SET id_turma=700242 WHERE id_matricula_componente=17245405;
UPDATE ensino.matricula_componente SET id_turma=700248 WHERE id_matricula_componente=17245423;
UPDATE ensino.matricula_componente SET id_turma=700247 WHERE id_matricula_componente=17245420;
UPDATE ensino.matricula_componente SET id_turma=700244 WHERE id_matricula_componente=17245411;
UPDATE ensino.matricula_componente SET id_turma=700243 WHERE id_matricula_componente=17245408;
UPDATE ensino.matricula_componente SET id_turma=700245 WHERE id_matricula_componente=17245414;
UPDATE ensino.matricula_componente SET id_turma=700240 WHERE id_matricula_componente=17245399;
UPDATE ensino.matricula_componente SET id_turma=700241 WHERE id_matricula_componente=17245402;
UPDATE ensino.matricula_componente SET id_turma=700246 WHERE id_matricula_componente=17245417;



