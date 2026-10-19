--antigo
select *
from basico.curriculo_basico cb
where cb.codigo in ('AI6INT', 'AI7INT', 'AI8INT', 'AI9INT')
order by cb.codigo;

--novo
select *
from basico.curriculo_basico cb
where  cb.codigo in ('AF6INTE', 'AF7INTE', 'AF8INTE','AF9INTE')
order by cb.codigo;


select *
from basico.curriculo_basico cb
where  cb.id_curriculo_basico in (51878310,51878326,51878342,51878358)
order by cb.codigo;



select *
from basico.turma_serie ts
where  ts.id_curriculo_medio in (51878310,51878326,51878342,51878358,51878374)
and ts.id_escola = 1825
and ts.ano = 2026
and ts.id_turno = 1
and ativo
order by nome;

select e.nome, * from escola.escola e  where e.id_escola = 1825;

select * from basico.turma_serie ts where ts.id_curriculo_medio = 51878310;

select * from basico.turma_serie ts where ts.id_curriculo_medio = 52040695;

'AI1INT', 'AI2INT', 'AI3INT', 'AI4INT', 'AI5INT', 'AI1INTE', 'AI2INTE', 'AI3INTE', 'AI4INTE', 'AI5INTE'
select * from  basico.curriculo_basico_componente cbc  where cbc.id_curriculo_basico  in (51878310,52040695);


--1828 id escola ESCOLA MUNICIPAL CHAPEUZINHO VERMELHO 

select *
from basico.turma_serie ts
where ts.id_escola = 1828
and ts.ano = 2026
and ts.id_turno = 1
and ativo
order by ts.nome;



-- Auto-generated SQL script #202603231657
UPDATE basico.turma_serie  	SET id_curriculo_medio=52040695	WHERE id_turma_serie=52035120;





SELECT id_curriculo_medio
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || c_novo.id_curriculo_medio || ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS script_solucao,
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio     ||     ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS script_backup
FROM basico.turma_serie ts
JOIN basico.curriculo_basico c_antigo ON ts.id_curriculo_medio = c_antigo.id_curriculo_medio
JOIN basico.curriculo_basico c_novo ON c_novo.codigo = (c_antigo.codigo || 'AI1INTE', 'AI2INTE', 'AI3INTE', 'AI4INTE', 'AI5INTE')
WHERE ts.id_escola = 1828 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.ativo = true
  AND c_antigo.codigo IN ('AI1INT', 'AI2INT', 'AI3INT', 'AI4INT', 'AI5INT');


-- Auto-generated SQL script #202603241446
UPDATE basico.matricula_estudante_serie
	SET id_curriculo_medio=52035120
	WHERE id_matricula_discente_serie=1320067;

--Alteralção da Turma serie para o novo curriculo
SELECT 
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || c_novo.id_curriculo_basico ||     ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS script_solucao,
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio 		||     ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS script_backup,
    -- COLUNA DE CONFERÊNCIA: Para saberes o que está a acontecer em cada linha
    '-- Turma: ' || ts.id_turma_serie || ' | De: ' || c_antigo.codigo || ' Para: ' 		|| c_novo.codigo AS info_conferencia
FROM basico.turma_serie ts
JOIN basico.curriculo_basico c_antigo ON ts.id_curriculo_medio = c_antigo.id_curriculo_basico 
JOIN basico.curriculo_basico c_novo ON c_novo.codigo = (c_antigo.codigo || 'E')
WHERE ts.id_escola = 1828 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.ativo = true
  AND c_antigo.codigo IN ('AI1INT', 'AI2INT', 'AI3INT', 'AI4INT', 'AI5INT');


--Alteralção da Mes
SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 52040695  WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_solucao,
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio  || ' WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie IN (52035119); --AI1INT

SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 52040711  WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_solucao,
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio  || ' WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie IN (52035120); --AI2INT

SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 52040727  WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_solucao,
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio  || ' WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie IN (52035126); --AI3INT

SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 52040743  WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_solucao,
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio  || ' WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie IN (52035127); --AI4INT

SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 52050799  WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_solucao,
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio  || ' WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_backup
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie IN (52035128); --AI5INT





  
