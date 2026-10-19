select *  --string_agg(id_turma ::varchar, ', ') 
from ensino.turma where codigo = 'EFAFM8C' and ano = 2025;


select string_agg(id_turma ::varchar, ', ') 
from ensino.turma where codigo = 'EFAFM7A' 
and ano = 2025 and id_turma_serie    = 55496643;


select  * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_aluno fa where fa.id_turma in (730574) and fa."data" IN ('2025-02-20', '2025-02-27');

select * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_turma ft   
where ft.id_turma in (730574); and ft."data" IN ('2025-02-20', '2025-02-27');

select * --string_agg(id_horario_turma ::varchar, ', ') 
from ensino.horario_turma where  id_turma  in (730573, 730574, 730575, 730578, 730577, 730580, 730581, 730576, 730579, 730582) and ativo = false;



--id_turma  in (730726, 730734, 730727, 730728, 730729, 730730, 730731, 730732, 730733, 730725) and ativo = false;

UPDATE ensino.horario_turma SET data_inicio='2025-02-17' WHERE id_horario_turma in (1595470, 1595472, 1595477, 1595484, 1595489, 1595469, 1595474, 1595481, 1595483, 1595488, 1595486, 1595491, 1595468, 1595475, 1595480, 1595467, 1595485, 1595490, 1595473, 1595478, 1595479, 1595471, 1595482, 1595487, 1595476);



--Solução
DELETE FROM ensino.horario_turma WHERE id_horario_turma in (1573134, 1573139, 1573120, 1573121, 1573126, 1573130, 1573132, 1573119, 1573125, 1573131, 1573137, 1573142, 1573143, 1573122, 1573127, 1573135, 1573138, 1573140, 1573128, 1573123, 1573124, 1573133, 1573136, 1573141, 1573129);

UPDATE ensino.horario_turma SET data_inicio='2025-02-17' WHERE id_horario_turma in (1595518, 1595519, 1595524, 1595532, 1595537, 1595529, 1595535, 1595540, 1595521, 1595526, 1595522, 1595527);

UPDATE ensino.horario_turma SET data_inicio='2025-02-17' WHERE id_horario_turma in (1595520, 1595517, 1595523, 1595528, 1595525, 1595530, 1595541, 1595533, 1595536, 1595538, 1595531, 1595534, 1595539);


--backup
UPDATE ensino.horario_turma SET data_inicio= null WHERE id_horario_turma in (1595518, 1595519, 1595524, 1595532, 1595537, 1595529, 1595535, 1595540, 1595521, 1595526, 1595522, 1595527);

UPDATE ensino.horario_turma SET data_inicio='2025-03-10' WHERE id_horario_turma in (1595520, 1595517, 1595523, 1595528, 1595525, 1595530, 1595541, 1595533, 1595536, 1595538, 1595531, 1595534, 1595539);


select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo  AND p.nome ILIKE '%HUGO ARNAUD MENDES%'
    
    
    
    
    
    --Solução  7º Ano - EFAFM7A - Matemática
DELETE FROM ensino.horario_turma WHERE id_horario_turma in (1572974, 1572979, 1572982, 1572986, 1572991, 1572971, 1572972, 1572976, 1572977, 1572983, 1572985, 1572990, 1572975, 1572980, 1572981, 1572973, 1572984, 1572989, 1572988, 1572993, 1572970, 1572978, 1572987, 1572992, 1572969);

UPDATE ensino.horario_turma SET data_inicio='2025-02-17' WHERE id_horario_turma in (1595470, 1595472, 1595477, 1595484, 1595489, 1595469, 1595474, 1595481, 1595483, 1595488, 1595486, 1595491, 1595468, 1595475, 1595480, 1595467);
UPDATE ensino.horario_turma SET data_inicio='2025-02-17' WHERE id_horario_turma in (1595485, 1595490, 1595473, 1595478, 1595479, 1595471, 1595482, 1595487, 1595476);

--Solução  9º Ano - EFAFM9A - Ciências
DELETE FROM ensino.horario_turma WHERE id_horario_turma in (1573134, 1573139, 1573120, 1573121, 1573126, 1573130, 1573132, 1573119, 1573125, 1573131, 1573137, 1573142, 1573143, 1573122, 1573127, 1573135, 1573138, 1573140, 1573128, 1573123, 1573124, 1573133, 1573136, 1573141, 1573129);
UPDATE ensino.horario_turma SET data_inicio='2025-02-17' WHERE id_horario_turma in (1595518, 1595519, 1595524, 1595532, 1595537, 1595529, 1595535, 1595540, 1595521, 1595526, 1595522, 1595527);
UPDATE ensino.horario_turma SET data_inicio='2025-02-17' WHERE id_horario_turma in (1595520, 1595517, 1595523, 1595528, 1595525, 1595530, 1595541, 1595533, 1595536, 1595538, 1595531, 1595534, 1595539);