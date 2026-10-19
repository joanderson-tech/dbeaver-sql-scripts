BEGIN;

CREATE TEMP TABLE bkp_pessoa_necessidade_especial AS
SELECT pne_antigo.*
FROM comum.pessoa_necessidade_especial pne_antigo
WHERE pne_antigo.id_necessidade_especial = 9
  AND EXISTS (
      SELECT 1 
      FROM comum.pessoa_necessidade_especial pne_novo
      WHERE pne_novo.id_pessoa = pne_antigo.id_pessoa
        AND pne_novo.id_necessidade_especial = 52717915
  );

--BACKUP
SELECT 
    'INSERT INTO comum.pessoa_necessidade_especial (' ||
    'id_pessoa_necessidade_especial, observacao, id_necessidade_especial, id_pessoa, id_pessoa_transferencia, codmergcomperve) ' ||
    'VALUES (' ||
    COALESCE(id_pessoa_necessidade_especial::TEXT, 'NULL') || ', ' ||
    COALESCE('''' || REPLACE(observacao, '''', '''''') || '''', 'NULL') || ', ' ||
    COALESCE(id_necessidade_especial::TEXT, 'NULL') || ', ' ||
    COALESCE(id_pessoa::TEXT, 'NULL') || ', ' ||
    COALESCE(id_pessoa_transferencia::TEXT, 'NULL') || ', ' ||
    COALESCE(codmergcomperve::TEXT, 'NULL') || 
    ');' AS comando_insert_backup
FROM bkp_pessoa_necessidade_especial;

--SOLUÇÃO
DELETE FROM comum.pessoa_necessidade_especial pne_antigo
WHERE pne_antigo.id_necessidade_especial = 9
  AND EXISTS (
      SELECT 1 
      FROM comum.pessoa_necessidade_especial pne_novo
      WHERE pne_novo.id_pessoa = pne_antigo.id_pessoa
        AND pne_novo.id_necessidade_especial = 52717915
  );

--BACKUP  
SELECT 'UPDATE comum.pessoa_necessidade_especial SET id_necessidade_especial=9 WHERE  IN ( ' || string_agg(pne.id_pessoa_necessidade_especial::TEXT,',') || ');' AS backup
FROM comum.pessoa_necessidade_especial pne 
WHERE pne.id_necessidade_especial = 9;

--SOLUÇÃO
UPDATE comum.pessoa_necessidade_especial
SET id_necessidade_especial = 52717915
WHERE id_necessidade_especial = 9;

--BACKUP
SELECT 
'UPDATE comum.recurso_avaliacao_tipo_necessidade_especial SET id_tipo_necessidade_especial=9 WHERE  IN ( ' || string_agg(ratne.id_recurso_avaliacao_nee::TEXT,',') || ');' AS backup
FROM comum.recurso_avaliacao_tipo_necessidade_especial ratne 
WHERE ratne.id_tipo_necessidade_especial = 9;

--SOLUÇÃO
UPDATE comum.recurso_avaliacao_tipo_necessidade_especial
SET id_tipo_necessidade_especial = 52717915
WHERE id_tipo_necessidade_especial = 9;

--BACKUP
SELECT 
'UPDATE matricula.estudante_inscrito_necessidade_especial SET id_tipo_necessidade=9 WHERE  IN ( ' || string_agg(eine.id_estudante_inscrito_necessidade_especial::TEXT,',') || ');' AS backup
FROM matricula.estudante_inscrito_necessidade_especial eine 
WHERE eine.id_tipo_necessidade = 9;

--SOLUÇÃO
UPDATE matricula.estudante_inscrito_necessidade_especial 
SET id_tipo_necessidade=52717915
WHERE id_tipo_necessidade = 9;
   
--BACKUP
SELECT 
'UPDATE matricula.renovacao_matricula_necessidade_especial SET id_tipo_necessidade=9 WHERE  IN ( ' || string_agg(rmne.id_renovacao_matricula_necessidade_especial::TEXT,',') || ');' AS backup
FROM matricula.renovacao_matricula_necessidade_especial rmne 
WHERE rmne.id_tipo_necessidade = 9;

--SOLUÇÃO
UPDATE matricula.renovacao_matricula_necessidade_especial 
SET id_tipo_necessidade=52717915
WHERE id_tipo_necessidade = 9;

--SOLUÇÃO
DELETE FROM comum.tipo_necessidade_especial WHERE id_tipo_necessidade_especial=9;

--BACKUP comentado para não precisar executar
--INSERT INTO comum.tipo_necessidade_especial (id_tipo_necessidade_especial, descricao, ativo, presente_censo_escolar, id_subtipo_necessidade_especial, quantidade_vaga) VALUES(9, 'Transtorno do espectro autista', true, true, 53937841, 2);


--SOLUÇÃO
UPDATE comum.tipo_necessidade_especial
    SET id_subtipo_necessidade_especial=53937841,
    presente_censo_escolar=true
    WHERE id_tipo_necessidade_especial=52717915;


--BACKUP comentado para não precisar executar
/*
UPDATE comum.tipo_necessidade_especial
    SET id_subtipo_necessidade_especial=8,
    presente_censo_escolar=false
    WHERE id_tipo_necessidade_especial=52717915;
*/


--ROLLBACK;

COMMIT;





