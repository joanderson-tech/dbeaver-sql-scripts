SELECT mes.ano_calendario, mes.id_turma_serie, mes.id_situacao_matricula_serie,  mes.data_matricula_turma, *
FROM basico.matricula_estudante_serie mes
WHERE --mes.id_turma_serie = 84519989;
mes.id_estudante = 1388821;
AND mes.ano_calendario = 2026;
