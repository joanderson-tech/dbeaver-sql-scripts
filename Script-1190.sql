--solução GUSTAVO SOUZA SANTOS
UPDATE basico.matricula_estudante_serie	SET data_matricula_turma='2025-04-15 00:00:00.000',data_cadastro='2025-04-15 00:00:00.000' WHERE id_matricula_discente_serie=1320591;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-04-15',data_cadastro='2025-04-15 00:00:00.000',data_solicitacao ='2025-04-15'	WHERE id_movimentacao_estudante_escola=52268357;
UPDATE ensino.frequencia_aluno SET ativo=false WHERE id_frequencia in (137490871, 137490888, 137521325, 137521342, 137521359, 137521376, 137521393, 137521410, 137521427, 137521444, 137521461, 137521478, 137521495, 137521512, 137521529, 137521569, 137521586, 137521603, 137521620, 137521637, 137521654, 137521671, 137521688, 137521705, 137521722, 137521739, 137521756, 137521773, 137521790, 137521807, 137491092, 137491296)

--solução MYKE RIAN DIAS VICTOR FERNANDES
UPDATE basico.matricula_estudante_serie	SET data_matricula_turma='2025-04-15 00:00:00.000',data_cadastro='2025-04-15 00:00:00.000' WHERE id_matricula_discente_serie=1320590;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-04-15',data_cadastro='2025-04-15 00:00:00.000',data_solicitacao ='2025-04-15'	WHERE id_movimentacao_estudante_escola in (52268259,52268254);
UPDATE ensino.frequencia_aluno SET ativo=false WHERE id_frequencia in (137231235, 137231259, 137630654, 137630678, 137630702, 137630750, 137630726, 137630846, 137630894, 137630990, 137631014, 137630774, 137630798, 137630822, 137630870, 137630918, 137630942, 137630966, 137631038, 137656520, 137656394, 137656544, 137656568, 137656592, 137656370, 137656418, 137656442, 137656476, 137656646, 137656700, 137656744, 137656975, 137656999, 137232300, 137637911, 137637959, 137637935, 137638007, 137638055, 137638079, 137637983, 137638031, 137638151, 137638175, 137638223, 137638103, 137638127, 137638199, 137638271, 137638247, 137638295, 137638319, 137638481, 137638505, 137233561, 137638979, 137639003, 137638643, 137638739, 137638529, 137638553, 137638598, 137638667, 137638691, 137638715, 137638763, 137638787, 137638811, 137638883, 137638931, 137638835, 137638859, 137638907, 137638955, 137651177, 137652787, 137657138, 137657162, 137657210, 137657258, 137657186, 137657234, 137657282, 137236413, 137657306, 137657330, 137657426, 137657498, 137657354, 137657378, 137657402, 137657450, 137657474, 137680281, 137680305, 137680353, 137680377, 137680209, 137680233, 137680257, 137680329, 137680401, 137680542, 137680590, 137680638, 137680662, 137680494, 137680518, 137680566, 137680614, 137680686, 137666512, 137666632, 137666488, 137666536, 137666560, 137666584, 137666608, 137666656, 137666680);

--MUDANDO POIS IA CONSTA DUAS MATRICULAS COM STATUS MATRICULADO
UPDATE basico.matricula_estudante_serie	SET id_situacao_matricula_serie=5 WHERE id_matricula_discente_serie=1320589;

--UNIFICAÇÃO
select 'UPDATE ensino.matricula_componente SET id_discente = 974324 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	   COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (976393)
GROUP BY  mc.id_discente;	

SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 974324 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
    COUNT(fa.id_frequencia) AS quantidade_ids
FROM ensino.frequencia_aluno fa 
where fa.id_discente IN (976393)
GROUP BY fa.id_discente;

UPDATE basico.matricula_estudante_serie	SET id_estudante=974324 WHERE id_matricula_discente_serie in (1320590, 1320072);
update ensino.observacao_discente set id_discente = 974324 where id_observacao_discente = 522670900;
UPDATE basico.movimentacao_estudante SET id_discente=974324 WHERE id_movimentacao_estudante=68796;

DELETE FROM basico.estudante WHERE id_estudante=976393;
DELETE FROM public.discente WHERE id_discente=976393;
DELETE FROM comum.pessoa WHERE id_pessoa=749599

select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma_serie  = 52178595;


-- ANA VIVIANY SOARES DE LIMA  974221
select d.id_pessoa ,mes.id_estudante, mes.id_matricula_discente_serie, p.nome, d.matricula from comum.pessoa p 
join discente d on d.id_pessoa  = p.id_pessoa 
join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente 
where p.nome  ilike '%MARIA CECÍLIA SOARES DA SILVA%'
and mes.ano_calendario = 2025;

--202130007500	

select * from basico.matricula_estudante_serie mes where mes.id_estudante = 974217 and mes.ano_calendario = 2025;

select * from matricula.movimentacao_estudante_escola ee where ee.id_matricula_estudante_serie in (1325241);

select fa from ensino.turma t  
join ensino.frequencia_aluno fa on fa.id_turma = t.id_turma 
where t.id_turma_serie = 52178595 and fa.id_discente = 974221;
and "data" > '2025-06-03';

-- MARIA CECÍLIA SOARES DA SILVA  974255
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-06-03',data_cadastro='2025-06-03 00:00:00.000',data_solicitacao ='2025-06-03'	WHERE id_movimentacao_estudante_escola=52220459;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-06-03',data_cadastro='2025-06-03 00:00:00.000'	WHERE id_movimentacao_estudante_escola=52220497;


----BACKUP MARIA CECÍLIA SOARES DA SILVA  974255
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-08-19',data_cadastro='2025-08-19 09:22:50.055',data_solicitacao ='2025-08-19'	WHERE id_movimentacao_estudante_escola=52220459;
UPDATE matricula.movimentacao_estudante_escola SET "data"='2025-08-19',data_cadastro='2025-08-19 09:56:48.127'	WHERE id_movimentacao_estudante_escola=52220497;


