SELECT distinct mes.*
from discente d 
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente 
WHERE p.nome = 'JALISON KAUE CARVALHO CHIOLA'
and mes.ano_calendario = 2026;
and sia

717725

select distinct fa.* 
from ensino.turma t 
join ensino.frequencia_aluno fa on fa.id_turma = t.id_turma 
where true
--and t.id_turma_serie =53766911 -- 53766013
and fa.id_discente = 990426
and t.ano = 2026;


717715



SELECT 
COUNT(fa.id_frequencia) AS total_frequencias, 
'UPDATE ensino.frequencia_aluno SET id_turma = 717715 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::TEXT, ', ') || ');' AS solucao, 
'UPDATE ensino.frequencia_aluno SET id_turma = ' || t.id_turma || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::TEXT, ', ') || ');' AS backup
FROM ensino.turma t
JOIN ensino.frequencia_aluno fa ON fa.id_turma = t.id_turma
WHERE fa.id_discente = 990426
AND fa.id_registro_atualizacao = 6105693
AND t.ano = 2026
GROUP BY t.id_turma;	



UPDATE ensino.frequencia_aluno SET id_turma = 717715 WHERE id_frequencia IN (147911375, 147946345, 147946346, 147946374, 147946347, 147946402, 147911313, 147911291, 147911189, 147911237, 147911234, 148106453, 148106471, 148106483, 148106503, 148106513, 148114644, 148114651, 148114654, 148114665, 148114667, 148114736, 148114739, 148114751, 148114795, 148114802, 148106440, 148266733, 148266734, 148266736, 148266751, 148266757, 148266762, 148266771, 148266773, 148266776, 148266780, 148266827, 148266830, 148266853, 148266908, 148266911, 148266924, 148266926, 148266936, 148266937, 148305302, 148305304, 148305314, 148305381, 148374894, 148374896, 148374933, 148374957, 148484498, 148693027, 148693032, 148693038, 148693045, 148693058, 148693070, 148693163, 148693169, 148693176, 148693182, 148693183, 148693189, 148693200, 148693206, 148693261, 148693272, 148809440, 148809447, 148809451, 148809461, 148809462, 148809468, 148809477, 148809479, 148809505, 148809554, 148809561, 148843319, 148843335, 148843347, 148843326, 148912784, 148912832, 148912833, 148912841, 148912882, 148912922, 148912931, 148912935, 149220510, 149220549, 149220587, 149220609, 149220648, 149220721, 149220799, 149221034, 149220885, 149221120, 149221224, 149221310, 149221351, 149221391, 149221475, 149221585, 149221607, 147911193, 147911212, 147911357, 148114821, 148106552, 148106636, 148106607, 148106462, 148266782, 148266787, 148266806, 148305383, 148305405, 148305326, 148305435, 148693073, 148693077, 148693087, 148693107, 148693110, 148693111, 148693112, 148693133, 148693149, 148693161, 148693209, 148693210, 148693212, 148693218, 148693225, 148693235, 148693237, 148693250, 148905908, 149220422, 149220444, 149220466, 149220488, 149220760, 149221266, 149221288, 149221413, 149221497, 149221519, 149221541, 149221563, 149221629);





select * from basico.registro_transferencia_entre_turmas rtet where 
rtet.id_matricula_estudante_serie in (1363344, 1364454, 1364455);

select * from matricula.movimentacao_estudante_escola mee where mee.id_matricula_estudante_serie  in (1363344, 1364454, 1364455);

select st.id_matricula_discente_serie ,stoe.*  from matricula.solicitacao_transferencia st
join matricula.solicitacao_transferencia_opcao_escola stoe on stoe.id_solicitacao = st.id_solicitacao_transferencia 
where st.id_matricula_discente_serie in (1363344, 1364454, 1364455);


select distinct fa.* 
from ensino.turma t 
join ensino.frequencia_aluno fa on fa.id_turma = t.id_turma 
where true
--and t.id_turma_serie = 53766911
and fa.id_discente = 990426
and t.ano = 2026
and fa.ativo;

select * from basico.turma_serie ts where ts.id_turma_serie = 53807056;

select ts.* from basico.turma_serie ts 
join basico.matricula_estudante_serie mes on mes.id_turma_serie = ts.id_turma_serie 
join matricula.solicitacao_transferencia st on st.id_matricula_discente_serie = mes.id_matricula_discente_serie 
where mes.ano_calendario = 2026
and ts.id_escola = 2280
and st.id_status = 4;




turma=717715

turma=717715