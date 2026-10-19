--Solução para pegar os ids da frequencia das turmas dessa escola
SELECT string_agg(id_frequencia  ::varchar, ', ')
FROM ensino.frequencia_aluno fa
WHERE fa.id_turma IN (
    SELECT t.id_turma
    FROM ensino.turma t
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    WHERE e.id_escola = 52232831
)
AND fa."data" = '2025-05-10';


begin;
rollback;

commit;

--Inserir os ids de produção
UPDATE ensino.frequencia_aluno
	SET "data"='2025-05-03'
	WHERE id_frequencia in (176713405, 176713406, 176713407, 176713408, 176713409, 176713410, 176713411, 176713412, 176713413, 176713414, 176713415, 176713416, 176713417, 176713418, 176713419, 176713420, 176713421, 177526864, 177526865, 177526866, 177526867, 177526868, 177526869, 177526870, 177526871, 177526872, 177526873, 177526874, 177526875, 177526876, 177526877, 177526878, 177526879, 177526880, 177526881, 177526882);

--Solução para pegar os ids da aula extra do dia 10 das turmas dessa escola
SELECT string_agg(ae.id::varchar, ', ')
FROM ava.aula_extra ae
WHERE ae.data_aula = '2025-05-10'
AND ae.id_turma IN (
    SELECT t.id_turma
    FROM ensino.turma t
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    WHERE e.id_escola = 52232831
);

--Inserir os ids de produção
UPDATE ava.aula_extra
	SET data_aula='2025-05-03'
	WHERE id in (72511108, 72511112, 72511076, 72511048, 72511072, 72511116, 72511068, 72511088, 72511100, 72511096, 72511120, 72511092, 72511080, 72511052, 72511104, 72511064, 72511060, 72511056, 72511084 );

--ESCOLA RICARDINA FERREIRA DA SILVA 
select e.nome , * from escola.escola e where e.id_escola = 52232831;

--Solução para pegar os ids da frequência das turmas dessa escola que não tenha frequência nesse dia para o mesmo aluno na mesma turma 
SELECT string_agg(fa.id_frequencia::varchar, ', ')
FROM ensino.frequencia_aluno fa
join ensino.turma tt on tt.id_turma = fa.id_turma
JOIN basico.turma_serie tss ON tss.id_turma_serie = tt.id_turma_serie
JOIN escola.escola ee ON ee.id_escola = tss.id_escola
WHERE NOT EXISTS (
    SELECT 1
    FROM ensino.frequencia_aluno fa1
    JOIN ensino.turma t ON fa1.id_turma = t.id_turma
    JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
    JOIN escola.escola e ON e.id_escola = ts.id_escola
    WHERE ts.ano = 2025
    AND fa1.id_turma = fa.id_turma
    AND fa1.id_discente = fa.id_discente
    AND fa1."data" = '2025-05-03'
    and e.id_escola = 52232831
)
AND fa."data" = '2025-05-10'
and ee.id_escola = 52232831;













select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    JOIN basico.turma_serie tss ON tss.id_turma_serie = t.id_turma_serie
	JOIN escola.escola ee ON ee.id_escola = tss.id_escola
    where dt.ativo 
 	and ee.id_escola = 52232831;

