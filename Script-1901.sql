BEGIN;

UPDATE ensino.matricula_componente SET id_discente = 1017348 WHERE id_matricula_componente IN (18289142, 18289143, 18289144, 18289145, 18289146, 18289147, 18289148, 18289149, 18289150, 18289151, 18289152);
UPDATE public.discente 	SET matricula='202630034073'	WHERE id_discente=1017348;
UPDATE basico.matricula_estudante_serie 	SET id_estudante=1017348	WHERE id_matricula_discente_serie=1414046;
UPDATE matricula.estudante_inscrito 	SET id_estudante=1017348	WHERE id_estudante_inscrito=54902249;
UPDATE basico.movimentacao_estudante 	SET id_discente=1017348	WHERE id_movimentacao_estudante=80045;
UPDATE ensino.observacao_discente 	SET id_discente=1017348	WHERE id_observacao_discente=550024841;
DELETE FROM basico.estudante WHERE id_estudante=1017185;
DELETE FROM public.discente WHERE id_discente=1017185;

COMMIT;