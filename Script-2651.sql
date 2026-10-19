SELECT * FROM comum.tipo_necessidade_especial tne WHERE tne.descricao ILIKE '%Transtorno do espectro autista%';

SELECT sne.* FROM comum.subtipo_necessidade_especial AS sne;
WHERE id_subtipo_necessidade_especial = 8

BEGIN;

DELETE FROM comum.tipo_necessidade_especial WHERE id_tipo_necessidade_especial=9;


SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_necessidade_especial = 9;

SELECT * FROM comum.recurso_avaliacao_tipo_necessidade_especial ratne WHERE ratne.id_tipo_necessidade_especial = 9;

SELECT * FROM matricula.estudante_inscrito_necessidade_especial eine WHERE eine.id_tipo_necessidade = 9;

SELECT * FROM matricula.renovacao_matricula_necessidade_especial rmne WHERE rmne.id_tipo_necessidade = 9;


SELECT 
'UPDATE matricula.renovacao_matricula_necessidade_especial SET id_tipo_necessidade=9 WHERE  IN ( ' || string_agg(rmne.id_renovacao_matricula_necessidade_especial::TEXT,',') || ');' AS backup
FROM matricula.renovacao_matricula_necessidade_especial rmne 
WHERE rmne.id_tipo_necessidade = 9;

-- Auto-generated SQL script #202609041625
UPDATE matricula.renovacao_matricula_necessidade_especial SET id_tipo_necessidade=52717915
    WHERE id_tipo_necessidade = 9;



SELECT 
'UPDATE matricula.estudante_inscrito_necessidade_especial SET id_tipo_necessidade=9 WHERE  IN ( ' || string_agg(eine.id_estudante_inscrito_necessidade_especial::TEXT,',') || ');' AS backup
FROM matricula.estudante_inscrito_necessidade_especial eine 
WHERE eine.id_tipo_necessidade = 9;



-- Auto-generated SQL script #202609041619
UPDATE matricula.estudante_inscrito_necessidade_especial 
SET id_tipo_necessidade=52717915
   WHERE eine.id_tipo_necessidade = 9;


-- Auto-generated SQL script #202609041558


SELECT 
'UPDATE comum.pessoa_necessidade_especial SET id_necessidade_especial=52717915 WHERE  IN ( ' || string_agg(pne.id_pessoa_necessidade_especial::TEXT,',') || ');' AS backup
FROM comum.pessoa_necessidade_especial pne 
WHERE pne.id_necessidade_especial = 9;


SELECT 
'UPDATE comum.recurso_avaliacao_tipo_necessidade_especial SET id_tipo_necessidade_especial=9 WHERE  IN ( ' || string_agg(ratne.id_recurso_avaliacao_nee::TEXT,',') || ');' AS backup
FROM comum.recurso_avaliacao_tipo_necessidade_especial ratne 
WHERE ratne.id_tipo_necessidade_especial = 9;


-- Auto-generated SQL script #202609041610
UPDATE comum.recurso_avaliacao_tipo_necessidade_especial SET id_tipo_necessidade_especial=52717915 WHERE id_recurso_avaliacao_nee=130284084;


ROLLBACK ;


-- Passo 1: Iniciar a transação de segurança
BEGIN;


DELETE FROM comum.pessoa_necessidade_especial pne_antigo
WHERE pne_antigo.id_necessidade_especial = 9
  AND EXISTS (
      SELECT 1 
      FROM comum.pessoa_necessidade_especial pne_novo
      WHERE pne_novo.id_pessoa = pne_antigo.id_pessoa
        AND pne_novo.id_necessidade_especial = 52717915
  );

UPDATE comum.pessoa_necessidade_especial
SET id_necessidade_especial = 52717915
WHERE id_necessidade_especial = 9;



COMMIT;