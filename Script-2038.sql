-- Turma: 52035120 | De: AI2INT Para: AI2INTE
-- Turma: 52035128 | De: AI5INT Para: AI5INTE
-- Turma: 52035127 | De: AI4INT Para: AI4INTE
-- Turma: 52035119 | De: AI1INT Para: AI1INTE
-- Turma: 52035126 | De: AI3INT Para: AI3INTE


select *
from basico.matricula_estudante_serie mes
where mes.id_turma_serie = 52035120;


SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = 52040695  WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS backup,
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio  ||    
    ' WHERE id_matricula_estudante_serie = ' || mes.id_matricula_discente_serie  || ';' AS script_solucao_matricula,
FROM basico.matricula_estudante_serie mes
WHERE mes.id_turma_serie IN (52035119); --AI1INT

SELECT 
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || ts.id_curriculo_medio ||  ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_solucao,
    'UPDATE basico.matricula_estudante_serie SET id_curriculo_medio = ' || mes.id_curriculo_medio || ' WHERE id_matricula_discente_serie = ' || mes.id_matricula_discente_serie || ';' AS script_backup,
    -- COLUNA DE CONFERÊNCIA
    '-- ID novo: ' || mes.id_curriculo_medio || ' | ID antigo: ' || ts.id_curriculo_medio AS info_aluno
FROM basico.matricula_estudante_serie mes
JOIN basico.turma_serie ts ON mes.id_turma_serie = ts.id_turma_serie
where ts.id_escola = 1828
and ts.ano = 2026
and ts.id_turno = 1
and ativo
order by ts.nome;
