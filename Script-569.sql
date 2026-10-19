select *  --string_agg(id_turma ::varchar, ', ') 
from ensino.turma where codigo = 'EFAFM8C' and ano = 2025;


select string_agg(id_turma ::varchar, ', ') 
from ensino.turma where codigo = 'EFAFM7A' 
and ano = 2025 and id_turma_serie  = 55496643;


select  * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_aluno fa where fa.id_turma in (730574) and fa."data" IN ('2025-02-20', '2025-02-27');

select * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_turma ft   
where ft.id_turma in (730574); and ft."data" IN ('2025-02-20', '2025-02-27');

select * -- string_agg(id_horario_turma ::varchar, ', ') 
from ensino.horario_turma where id_turma  in (730574); and ativo and data_inicio is not null;



-- Auto-generated SQL script #202506050818
UPDATE ensino.horario_turma
	SET data_inicio='2025-02-17'
	WHERE id_horario_turma in (1595470, 1595472, 1595477, 1595484, 1595489, 1595469, 1595474, 1595481, 1595483, 1595488, 1595486, 1595491, 1595468, 1595475, 1595480, 1595467);


UPDATE ensino.horario_turma
	SET data_inicio='2025-02-17'
	WHERE id_horario_turma in (1595485, 1595490, 1595473, 1595478, 1595479, 1595471, 1595482, 1595487, 1595476);


-- Auto-generated SQL script #202506051410
UPDATE ensino.horario_turma
	SET hora_inicio='07:00:00',hora_fim='07:50:00'
	WHERE id_horario_turma=1595469;

UPDATE ensino.horario_turma
	SET hora_inicio='07:50:00',hora_fim='08:40:00'
	WHERE id_horario_turma=1595474;


--backup
UPDATE ensino.horario_turma
	SET data_inicio= null
	WHERE id_horario_turma in (1595470, 1595472, 1595477, 1595484, 1595489, 1595469, 1595474, 1595481, 1595483, 1595488, 1595486, 1595491, 1595468, 1595475, 1595480, 1595467);


UPDATE ensino.horario_turma
	SET data_inicio='2025-03-10'
	WHERE id_horario_turma in (1595485, 1595490, 1595473, 1595478, 1595479, 1595471, 1595482, 1595487, 1595476);


UPDATE ensino.horario_turma
	SET hora_inicio=null,hora_fim=null
	WHERE id_horario_turma=1595469;

UPDATE ensino.horario_turma
	SET hora_inicio=null,hora_fim=null
	WHERE id_horario_turma=1595474;





select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo  AND p.nome ILIKE '%HUGO ARNAUD MENDES%'