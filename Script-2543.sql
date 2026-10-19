SELECT p.nome, u.login, t.codigo 
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
WHERE dt.ativo
AND t.ano = 2026;
AND t.id_disciplina = 225;

UPDATE ensino.item_abono_frequencia
SET
id_abono_frequencia =?, id_frequencia =?, quantidade_faltas_abonadas =?, quantidade_faltas_anterior =?, id_registro_entrada =?
WHERE id_item_abono_frequencia =?