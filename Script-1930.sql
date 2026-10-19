BEGIN;


SELECT s.* FROM rh.servidor s 
JOIN comum.pessoa p ON P.id_pessoa = s.id_pessoa  
WHERE p.id_pessoa IN (747145,747146,748690,748954);


SELECT * FROM  comum.pessoa p
WHERE p.id_pessoa IN (747145,747146,748690,748954);

SELECT *
FROM ensino.docente_turma dt
WHERE dt.id_docente_turma IN (52024834, 52024833, 52068698, 52068701, 52068704, 52068708);

ROLLBACK;

SELECT t.ano, t.id_turma, dt.id_docente_turma , t.nome_professor 
INTO TEMP novo_docente
FROM ensino.docente_turma dt
JOIN ensino.turma t ON t.id_turma = dt.id_turma
WHERE dt.id_docente = 208
AND t.ano IN (2024, 2025)
AND dt.ativo;

SELECT 'UPDATE ensino.turma SET nome_professor = ''ANA LARA COSTA LUCENA'' WHERE id_turma= ' || id_turma || ';' AS solução_script,
			 'UPDATE ensino.turma SET nome_professor ='  || COALESCE('''' || nome_professor || '''', 'NULL') || ' WHERE id_turma= ' || id_turma || ';' AS backup_script
FROM novo_docente h;

SELECT 'UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= ' || id_docente_turma || ';' AS solução_script,
			 'UPDATE ensino.docente_turma	SET id_docente=208 WHERE id_docente_turma= ' || id_docente_turma || ';' AS backup_script
FROM novo_docente h;


UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 684629;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 684666;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 684989;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 685015;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 685037;
UPDATE ensino.turma SET nome_professor = 'ANA LARA COSTA LUCENA' WHERE id_turma= 685050;

UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52024833;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52024834;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52068698;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52068701;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52068704;
UPDATE ensino.docente_turma	SET id_docente=233 WHERE id_docente_turma= 52068708;

UPDATE comum.pessoa SET cpf_cnpj=13388677417	WHERE id_pessoa=747145;
UPDATE comum.pessoa SET cpf_cnpj=13383429407	WHERE id_pessoa=747146;
UPDATE rh.servidor 	SET id_pessoa=747145	WHERE id_servidor IN (232, 208);
UPDATE rh.servidor 	SET id_pessoa=747146	WHERE id_servidor = 233;
UPDATE comum.alteracao_pessoa 	SET id_pessoa=747145	WHERE id_alteracao_pessoa IN (520248240, 521104710);
UPDATE comum.alteracao_pessoa 	SET id_pessoa=747146	WHERE id_alteracao_pessoa IN (521104800,521104801,521104802);
UPDATE comum.usuario	SET id_pessoa=747145	WHERE id_usuario=105103;
UPDATE comum.usuario	SET id_pessoa=747146	WHERE id_usuario=105210;
UPDATE educacenso.educacenso_pessoa SET id_pessoa=747145	WHERE id_educacenso_pessoa=567;
UPDATE educacenso.educacenso_pessoa	SET id_pessoa=747146	WHERE id_educacenso_pessoa=568;
DELETE FROM comum.pessoa WHERE id_pessoa=748690;
DELETE FROM comum.pessoa WHERE id_pessoa=748954;


COMMIT;