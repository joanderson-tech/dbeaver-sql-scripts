select *
from ava.aula_extra ae where ae.data_aula = '2025-03-13';


select string_agg(id::varchar, ', ')
from ava.aula_extra ae where ae.data_aula = '2025-03-13';


INSERT INTO ava.aula_extra (id, id_turma, observacoes, data_aula, criado_em, criado_por, numero_aulas, tipo, aula_reposta, descricao, id_servidor, id_registro_cadastro, id_registro_atualizacao, dia_equivalente, de_interrupcao) VALUES((select string_agg(id::varchar, ', ')
from ava.aula_extra ae where ae.data_aula = '2025-03-13), 681760, NULL, '2025-03-13', '2025-05-02 19:02:55.124', NULL, 1, 3, NULL, 'Sábado Letivo', NULL, NULL, NULL, NULL, false);


UPDATE ava.aula_extra
	SET data_aula='2025-03-15'
	WHERE id=51922219;
