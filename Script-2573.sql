BEGIN;

-- Ajuste do relatorio para pegar as matricula ativa 
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20947084 WHERE id_relatorio_avaliativo_componente=926524;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20947082 WHERE id_relatorio_avaliativo_componente=926525;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20947081 WHERE id_relatorio_avaliativo_componente=926526;
UPDATE ensino_infantil.relatorio_avaliativo_componente SET id_matricula_componente=20947083 WHERE id_relatorio_avaliativo_componente=926527;
--Cancela EFAIINT3A que estva com o avanço de estudo
UPDATE ensino.matricula_componente SET id_situacao_matricula=7 WHERE id_matricula_componente IN (20940475, 20940476, 20940477, 20940478, 20940479, 20940480, 20940481, 20940482, 20940483, 20940484, 20940486, 20940487, 20940485);
--Faz o avanço na turma correta EFAIINT2A 
UPDATE ensino.matricula_componente SET id_situacao_matricula=11 WHERE id_matricula_componente IN (20564414, 20564415, 20564416, 20564417, 20564418, 20564419, 20564420, 20564421, 20564422, 20564423, 20564424, 20564425, 20564426);
--Ajusta a matricula do estudante de acordo com o cadastro, informações da Auditoria
UPDATE basico.matricula_estudante_serie SET id_turma_serie= 84519780, id_curriculo_medio = 51876233 , id_vaga_serie = 83916415, id_serie_escola = 52236815 WHERE id_matricula_discente_serie = 1628303;


COMMIT;