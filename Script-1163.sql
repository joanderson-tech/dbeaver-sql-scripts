select * from ensino.frequencia_turma ft where ft.id_turma = 700961 and ft."data" = '2025-06-23';

select string_agg(id_frequencia::varchar , ', ') from ensino.frequencia_aluno fa where fa.id_turma = 700961 and fa."data" = '2025-06-23';

select * from ava.aula_extra x where x.id_turma = 700961 and x.data_aula = '2025-06-23';


UPDATE ensino.frequencia_turma 	SET ativo=false	WHERE id_frequencia_turma=111797;
UPDATE ensino.frequencia_aluno 	SET ativo=false WHERE id_frequencia in (142436120, 142436121, 142436122, 142436123, 142436124, 142436125, 142436126, 142436127, 142436128, 142436129, 142436130, 142436131);
DELETE FROM ava.aula_extra WHERE id=54663516;


--backup

INSERT INTO ava.aula_extra (id, id_turma, observacoes, data_aula, criado_em, criado_por, numero_aulas, tipo, aula_reposta, descricao, id_servidor, id_registro_cadastro, id_registro_atualizacao, dia_equivalente, de_interrupcao) VALUES(54663516, 700961, '', '2025-06-23', '2025-09-01 22:16:00.073', NULL, 1, 1, NULL, 'reposição', NULL, 6165383, NULL, 'Quarta', false);

