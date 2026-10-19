--antigo
select *
from basico.curriculo_basico cb
where cb.codigo in ('AI1INT', 'AI2INT', 'AI3INT', 'AI4INT', 'AI5INT');
--novo
select *
from basico.curriculo_basico cb
where cb.codigo in ( 'AI1INTE', 'AI2INTE', 'AI3INTE', 'AI4INTE', 'AI5INTE');


select *
from basico.turma_serie ts
where ts.id_escola = 1828
and ts.ano = 2026
and ts.id_turno = 1
and ativo;

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
and ativo;



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



SELECT 
    -- COLUNA DE BACKUP: Gera o comando para restaurar o valor atual
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio 		||     ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS script_backup,
    -- COLUNA DE SOLUÇÃO: Gera o comando para aplicar o novo currículo
    'UPDATE basico.turma_serie SET id_curriculo_medio = ' || c_novo.id_curriculo_basico ||     ' WHERE id_turma_serie = ' || ts.id_turma_serie || ';' AS script_solucao,
    -- COLUNA DE CONFERÊNCIA: Para saberes o que está a acontecer em cada linha
    '-- Turma: ' || ts.id_turma_serie || ' | De: ' || c_antigo.codigo || ' Para: ' 		|| c_novo.codigo AS info_conferencia
FROM basico.turma_serie ts
-- Liga a turma ao currículo atual (Antigo)
JOIN basico.curriculo_basico c_antigo ON ts.id_curriculo_medio = c_antigo.id_curriculo_basico 
-- Procura o currículo que tem o mesmo código + a letra 'E'
JOIN basico.curriculo_basico c_novo ON c_novo.codigo = (c_antigo.codigo || 'E')
WHERE ts.id_escola = 1828 
  AND ts.ano = 2026 
  AND ts.id_turno = 1
  AND ts.ativo = true
  AND c_antigo.codigo IN ('AI1INT', 'AI2INT', 'AI3INT', 'AI4INT', 'AI5INT');
