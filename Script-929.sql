select string_agg(id_turma :: varchar, ', ')
from ensino.turma t where t.id_turma_serie = 52241253;

select *from ensino.horario_turma ht where ht.id_turma in (688617, 688614, 688613, 688620, 688621, 688615, 688616, 688618, 688619);

select * from ensino.frequencia_aluno fa where fa.id_turma in (688617, 688614, 688613, 688620, 688621, 688615, 688616, 688618, 688619) ;


-- Auto-generated SQL script #202508061738
UPDATE ensino.horario_turma	SET data_alteracao='2025-06-12 09:48:53.000', data_fim= '2025-06-12' WHERE id_horario_turma in (1412625, 1412620, 1412630, 1412635, 1412640);
UPDATE ensino.horario_turma	SET data_alteracao=null, data_fim=null WHERE id_horario_turma in (1412625, 1412620, 1412630, 1412635, 1412640);

UPDATE ensino.horario_turma	SET data_inicio='2025-06-11',data_fim= '2025-06-11', data_alteracao= '2025-06-11 09:48:53.000' WHERE id_horario_turma in (1412623, 1412624, 1412621, 1412622, 1412626, 1412627, 1412628, 1412629, 1412631, 1412632, 1412633, 1412634, 1412636, 1412637, 1412638, 1412639, 1412641, 1412642, 1412643, 1412644, 1412620, 1412625, 1412630, 1412635, 1412640);

SELECT to_char(f.data, 'YYYY-MM-DD') as data_aula  	FROM ensino.frequencia_aluno f  	JOIN ensino.turma t ON t.id_turma = f.id_turma     JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie    JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie AND mes.id_estudante = f.id_discente AND mes.id_situacao_matricula_serie IN  ( 2,3,1,7,8,10,6 ) WHERE f.ativo = true  	AND f.id_turma = 688613 GROUP BY data_aula  ORDER BY data_aula 

select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma in (688613);



DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412330;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412331;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412332;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412320;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412321;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412322;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412323;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412324;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412325;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412326;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412327;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412328;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412329;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412333;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412334;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412335;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412336;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412337;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412338;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412339;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412340;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412341;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412342;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412343;
DELETE FROM ensino.horario_turma WHERE id_horario_turma=1412344;