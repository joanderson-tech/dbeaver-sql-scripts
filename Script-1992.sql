SELECT anf.id_avaliacao_nota_frequencia, anf.id_usuario, anf.id_registro_entrada, anf.id_situacao_acompanhamento_pedagogico, anf.data_cadastro, anf.bimestre, anf.id_turma, anf.parecer, anf.mensagem_devolutiva
FROM ava.avaliacao_nota_frequencia anf;
WHERE anf.id_turma = ?
AND anf.bimestre = ?
LIMIT ?