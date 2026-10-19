begin;
commit;
rollback;
--update 
UPDATE public.discente
	SET id_pessoa=52052930
	WHERE id_discente=1002723;
-- Auto-generated SQL script #202406141613
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1002723
	WHERE id_matricula_discente_serie=1390633;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1002723
	WHERE id_matricula_discente_serie=1401939;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1002723
	WHERE id_matricula_discente_serie=1473077;


-- Auto-generated SQL script #202406141614
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1022550
	WHERE id_matricula_discente_serie=1385765;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1022550
	WHERE id_matricula_discente_serie=1405414;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1022550
	WHERE id_matricula_discente_serie=1468768;





--backup
UPDATE public.discente
	SET id_pessoa=52094597
	WHERE id_discente=1002723;

-- Auto-generated SQL script #202406141600
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1022550
	WHERE id_matricula_discente_serie=1390633;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1022550
	WHERE id_matricula_discente_serie=1401939;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1022550
	WHERE id_matricula_discente_serie=1473077;

-- Auto-generated SQL script #202406141614
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1002723
	WHERE id_matricula_discente_serie=1385765;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1002723
	WHERE id_matricula_discente_serie=1405414;
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1022550
	WHERE id_matricula_discente_serie=1468768;

