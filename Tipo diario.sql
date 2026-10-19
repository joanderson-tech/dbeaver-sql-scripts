BEGIN ;
 
-- criando tabela tem para buscar os curriculos
SELECT 
cb.id_curriculo_basico,
cb.tipo_diario diario_antigo,
CASE 
WHEN cb.id_curriculo_basico = 52224881 THEN 1
WHEN cb.id_curriculo_basico = 52224887 THEN 1
ELSE cb.tipo_diario
END diario_novo
INTO TEMP temp_curriculos_alterar
FROM basico.curriculo_basico cb 
WHERE cb.id_curriculo_basico IN (52224881,52224887);

DROP TABLE temp_curriculos_alterar;

-- Ajustando currículo 
SELECT 'UPDATE basico.curriculo_basico SET tipo_diario = '|| tcb.diario_novo || ' WHERE id_curriculo_basico = ' || cb.id_curriculo_basico||';' solucao,
       'UPDATE basico.curriculo_basico SET tipo_diario = '|| tcb.diario_antigo || ' WHERE id_curriculo_basico = ' || cb.id_curriculo_basico||';' backup
FROM temp_curriculos_alterar tcb
JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico= tcb.id_curriculo_basico ;


-- Ajustando curriculo das turmas.
SELECT 'UPDATE basico.turma_serie SET tipo_diario = '|| tcb.diario_novo || ' WHERE id_turma_serie =  '||  id_turma_serie || ';' solucao,
       'UPDATE basico.turma_serie SET tipo_diario ' || tcb.diario_antigo || '  WHERE id_turma_serie =  '||  id_turma_serie || ';' backup
FROM basico.turma_serie ts 
JOIN temp_curriculos_alterar tcb ON tcb.id_curriculo_basico = ts.id_curriculo_medio 
WHERE ts.ano = 2025
AND ts.ativo;

BEGIN ;

rollback; 

commit;

select * from basico.curriculo_basico cb where cb.id_curriculo_basico in (52224881, 52224887);


rollback;

select * from ensino.turma   dt where dt.id_turma in (687592,687593,687594,687591,688755);


select dt
from basico.turma_serie ts
join basico.serie s2 on s2.id_serie = ts.id_serie 
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie
left join ensino.docente_turma dt on dt.id_turma = t.id_turma 
join escola.escola e on e.id_escola  = ts.id_escola
left join rh.servidor s on s.id_servidor = dt.id_docente
 join comum.pessoa p on p.id_pessoa = s.id_pessoa 
where ts.id_curriculo_medio  in (52224881,52224887)
--and not dt.id_turma = 688755;
--and dt.ch_dedicada_periodo  is not null
order by e.nome, t.codigo;

EIMSMEICREA-M1

select distinct ts.nome, s2.descricao, e.nome, p.nome
from basico.turma_serie ts
join basico.serie s2 on s2.id_serie = ts.id_serie 
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie
left join ensino.docente_turma dt on dt.id_turma = t.id_turma 
left join escola.escola e on e.id_escola  = ts.id_escola
left join rh.servidor s on s.id_servidor = dt.id_docente
left join comum.pessoa p on p.id_pessoa = s.id_pessoa 
where ts.id_turma_serie  in ( 52229834, 52229835, 52230764, 52230765, 52230935, 52230936, 52231238, 52231239, 52240040, 52240041, 52231366)
--and dt.ch_dedicada_periodo  is not null
order by e.nome, ts.nome;


select * from ensino.turma t where t.id_turma=  687189;
select * from ensino.turma t where t.id_turma_serie = 52229902; --52229902,52231390, 52231388, 52229792
select * from basico.matricula_estudante_serie mes where mes.id_turma_serie = 52229902;

select 
' UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = ' || dt.id_docente_turma|| ' ;' as Solução,
' UPDATE ensino.docente_turma SET ativo=true WHERE  id_docente_turma  = ' || dt.id_docente_turma|| ' ;' as Backup
from ensino.docente_turma dt where dt.id_turma in (687189, 687190, 687194, 687199, 687191, 687192, 688723, 687591, 688238, 688239, 688232, 688233, 688234, 688235, 688236, 688237, 687595, 687592, 687593, 687594, 688240, 688241);


select * from ensino.docente_turma dt where dt.id_turma in (687194, 687199, 688723, 687189, 687190, 687191, 687192, 688240, 688241, 687594, 687595, 688237, 688238, 688239, 687591, 687592, 687593, 688232, 688233, 688234, 688235, 688236) and dt.ativo;

 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52242505 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52242506 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52254758 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52254759 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52241136 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52242504 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52232131 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52232132 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52232133 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52232134 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52232161 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52247546 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52247547 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52247548 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52247549 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52247550 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52246422 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52246423 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52246424 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52246425 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52246453 ;
 UPDATE ensino.docente_turma SET ativo=false WHERE  id_docente_turma  = 52260665 ;


-- Auto-generated SQL script #202507090838
UPDATE ensino.docente_turma
	SET id_turma=688755,ch_dedicada_periodo=25
	WHERE id_docente_turma=52232131;



-- Auto-generated SQL script #202507090838
UPDATE ensino.docente_turma
	SET id_turma=687591,ch_dedicada_periodo=5
	WHERE id_docente_turma=52232131;



52229792
52229794
52229795
52229902
52229902
52231388
52231390
52231390

SELECT 
  'INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES 
	( 2025, 1, 1, ' || ts.capacidade_aluno || ', 220, ''' || ts.nome || ''', 1, false, false, true, ' || ts.id_turma_serie || ', false, false, 0  );'
FROM (
  SELECT DISTINCT ON (t.id_turma_serie)  t.capacidade_aluno,  ts.nome,  ts.id_turma_serie
  FROM ensino.turma t
  JOIN basico.turma_serie ts  ON ts.id_turma_serie = t.id_turma_serie
  WHERE t.id_turma_serie IN (52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366)
  AND NOT EXISTS (
    SELECT 1 
    FROM ensino.turma t2 
    WHERE t2.id_turma_serie = t.id_turma_serie 
      AND t2.id_disciplina = 220
  )
) t
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie;


INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES 
	( 2025, 1, 1, 30, 220, 'EICRMEICREA', 1, false, false, true, 52229792, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES 
	( 2025, 1, 1, 30, 220, 'EICRVEICREB', 1, false, false, true, 52229794, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES 
	( 2025, 1, 1, 30, 220, 'EICRMEICREA', 1, false, false, true, 52229795, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES 
	( 2025, 1, 1, 30, 220, 'EICRMEICREA', 1, false, false, true, 52229902, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES 
	( 2025, 1, 1, 30, 220, 'EICRVEICREC', 1, false, false, true, 52231390, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES 
	( 2025, 1, 1, 30, 220, 'EICRVEICREB', 1, false, false, true, 52231388, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES 
	( 2025, 1, 1, 30, 220, 'EICRMEICREA', 1, false, false, true, 52231366, false, false, 0  );
----=

WITH turma_agrupadora_existente AS (
    SELECT
        t.id_turma_serie,
        t.id_turma AS turma_agrupadora_id
    FROM
        ensino.turma t
    WHERE
        t.id_disciplina = 220
        AND t.agrupadora
        AND t.id_situacao_turma <> 4 
        AND t.ano = 2025 
        and t.id_turma_serie IN (52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366)
)
UPDATE ensino.turma AS t_main
SET id_turma_agrupadora = tai.turma_agrupadora_id
FROM
    turma_agrupadora_existente tai
WHERE
    t_main.id_turma_serie = tai.id_turma_serie
    AND t_main.id_disciplina <> 220 
    AND t_main.id_categoria_componente <> 2
    AND t_main.id_turma IN (SELECT tt.id_turma FROM ensino.turma tt where tt.id_turma_serie IN (52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366)
 ); 

-- ## Criação de Novas Matrículas Componentes

    SELECT nextval('ensino.matricula_componente_seq') AS id_matricula_componente,
           CASE 
               WHEN mes.id_situacao_matricula_serie = 1 THEN 2 
               WHEN mes.id_situacao_matricula_serie = 2 THEN 5
               WHEN mes.id_situacao_matricula_serie = 3 THEN 6
               WHEN mes.id_situacao_matricula_serie = 4 OR mes.id_situacao_matricula_serie = 9 THEN 4
               WHEN mes.id_situacao_matricula_serie = 5 THEN 3
               WHEN mes.id_situacao_matricula_serie = 6 THEN 9
               ELSE 2
           END AS id_situacao_matricula,
           t.id_turma, 
           t.id_disciplina AS id_componente_curricular,
           mes.id_estudante AS id_discente,
           ts.ano,
           ts.periodo,
           ts.id_curriculo_medio AS id_curriculo_basico,
           ts.id_turma_serie
           INTO TEMP novas_mc
    FROM basico.turma_serie ts 
    JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie 
    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie AND t.id_situacao_turma <> 4
   	where ts.id_turma_serie IN (52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366);

INSERT INTO ensino.matricula_componente (id_matricula_componente, id_situacao_matricula, id_turma, id_componente_curricular, id_discente, ano, periodo)
SELECT tm.id_matricula_componente, tm.id_situacao_matricula, tm.id_turma, tm.id_componente_curricular, tm.id_discente, tm.ano, tm.periodo
FROM novas_mc tm
WHERE NOT EXISTS (
    SELECT 1 
    FROM ensino.matricula_componente mc 
    WHERE mc.id_turma = tm.id_turma 
      AND mc.ano = tm.ano 
      AND mc.id_situacao_matricula = tm.id_situacao_matricula
      AND mc.id_discente = tm.id_discente
);

 SELECT  'DELETE from ensino.matricula_componente where id_matricula_componente = ' || id_matricula_componente || '; ' backup
 FROM novas_mc;

select * from novas_mc;

commit;

select * from basico.matricula_estudante_serie mes where mes.id_turma_serie IN (52229902);

select t.id_turma_agrupadora, *  from ensino.turma t where t.id_turma_serie = 52229902;

select * from ensino.turma t where t.id_turma_serie in (52229792, 52229794, 52229795, 52229902, 52231366, 52231388, 52231390) and t.id_disciplina = 220;



begin;
rollback;

--Solução
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES ( 2025, 1, 1, 30, 220, 'EICRMEICREA', 1, false, false, true, 52229792, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES ( 2025, 1, 1, 30, 220, 'EICRVEICREB', 1, false, false, true, 52229794, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES ( 2025, 1, 1, 30, 220, 'EICRMEICREA', 1, false, false, true, 52229795, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES ( 2025, 1, 1, 30, 220, 'EICRMEICREA', 1, false, false, true, 52229902, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES ( 2025, 1, 1, 30, 220, 'EICRMEICREA', 1, false, false, true, 52231366, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES ( 2025, 1, 1, 30, 220, 'EICRVEICREB', 1, false, false, true, 52231388, false, false, 0  );
INSERT INTO ensino.turma ( ano, periodo, id_situacao_turma, capacidade_aluno, id_disciplina, codigo, tipo, processada, processada_rematricula, agrupadora, id_turma_serie, nota, extra, ordem ) VALUES ( 2025, 1, 1, 30, 220, 'EICRVEICREC', 1, false, false, true, 52231390, false, false, 0  );


UPDATE basico.curriculo_basico SET tipo_diario = 1 WHERE id_curriculo_basico in (52224881,52224887);
UPDATE basico.turma_serie SET tipo_diario = 1 WHERE id_turma_serie  in ( 52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366);

---backup
UPDATE basico.curriculo_basico SET tipo_diario = 0 WHERE id_curriculo_basico in (52224881,52224887);
UPDATE basico.turma_serie SET tipo_diario = 0 WHERE id_turma_serie  in ( 52229792, 52229794, 52229795, 52229834, 52229835, 52230764, 52230765, 52229902, 52230935, 52230936, 52231390, 52231388, 52231238, 52231239, 52240040, 52240041, 52231366,);
