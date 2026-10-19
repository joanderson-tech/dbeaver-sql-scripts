SELECT *
FROM matricula.estudante_inscrito ei
WHERE ei.nome = 'MARIA BIATRIZ NEVES DE LUNA SILVA';
-- Auto-generated SQL script #202603041407
UPDATE matricula.estudante_inscrito
SET
cpf = NULL
WHERE id_estudante_inscrito = 85291463;
-- Auto-generated SQL script #202603041407
UPDATE matricula.estudante_inscrito
SET
cpf = 65537939053
WHERE id_estudante_inscrito = 85291463;

SELECT t.permite_multiplos_professores
FROM ensino.turma t
WHERE t.ano = 2026;
