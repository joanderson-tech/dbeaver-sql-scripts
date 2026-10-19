SELECT *
FROM matricula.vaga_serie vs
WHERE vs.id_escola = 973
AND vs.id_serie = 1005218
AND vs.ano_letivo =2026;
AND (vs.vagas_validadas > vs.vagas_ocupadas	OR vs.vagas_validadas > 0	AND (vs.vagas_ocupadas <> 0))
AND vs.aceita_novas_matriculas_nee =true;


SELECT * FROM comum.alteracao_pessoa ap WHERE ap.id_pessoa = 777897;
select * from comum.pessoa_necessidade_especial pne where id_pessoa = 777897;

SELECT* FROM educacenso.educacenso_pessoa ep WHERE ep.id_pessoa = 777897;





BEGIN;
--solução 
UPDATE public.discente 	SET id_pessoa=755776	WHERE id_discente=989745;
UPDATE comum.pessoa_necessidade_especial	SET id_pessoa=755776	WHERE id_pessoa_necessidade_especial=56129805;
UPDATE comum.pessoa_recurso_avaliacao_nee SET id_pessoa=755776	WHERE id_pessoa_recurso_avaliacao_nee=130284494;
--
UPDATE comum.alteracao_pessoa 	SET id_pessoa=755776	WHERE id_alteracao_pessoa=567088982;
UPDATE comum.pessoa_necessidade_especial SET id_pessoa=755776	WHERE id_pessoa_necessidade_especial=56708931;
UPDATE educacenso.educacenso_pessoa SET id_pessoa=755776 WHERE id_educacenso_pessoa=2721;


--rodar no banco comum tambem
DELETE FROM comum.pessoa WHERE id_pessoa=777897;

COMMIT;

ROLLBACK;
