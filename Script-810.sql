SELECT ta.id_turma, ta."data",ta.descricao, ta.conteudo_ministrado, ta.programado
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND ta.conteudo_ministrado IS NOT null
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado;

SELECT *--ta.id_turma, ta."data", ta.fim, ta.bimestre, ta.descricao, ta.conteudo_ministrado, ta.programado
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado ; 

INSERT INTO ava.topico_aula (id_topico_aula, id_turma, descricao, "data", fim, id_topico_pai, conteudo, id_usuario, data_cadastro, visivel, ativo, id_docente_turma, aula_cancelada, id_aula_extra, bimestre, programado, bimestral, necessita_correcao, replica_conteudo, conteudo_ministrado) 
VALUES(hibernate_sequence, ta.id_turma, null, ta."data", ta.fim, NULL, null, 104946, now(), false, true, NULL, false, NULL, ta.bimestre, false, false, false, false,  ta.conteudo_ministrado);


begin;

SELECT
    'INSERT INTO ava.topico_aula (' ||
	'id_topico_aula, ' || 'id_turma, descricao, "data", fim, id_topico_pai, conteudo, id_usuario, data_cadastro, visivel, ativo, id_docente_turma, aula_cancelada, id_aula_extra, bimestre, programado, bimestral, necessita_correcao, replica_conteudo, conteudo_ministrado' ||
    ') VALUES(' ||
    'nextval(''hibernate_sequence''), ' ||
    ta.id_turma || ', ' ||
    'NULL, ' || -- descricao
    '''' || ta."data" || ''', ' || -- data (necessita aspas simples)
    CASE WHEN ta.fim IS NOT NULL THEN '''' || ta.fim || '''' ELSE 'NULL' END || ', ' || -- fim (pode ser NULL)
    'NULL, ' || -- id_topico_pai
    'NULL, ' || -- conteudo
    '104946, ' || -- id_usuario
    'now(), ' || -- data_cadastro
    'false, ' || -- visivel
    'true, ' || -- ativo
    'NULL, ' || -- id_docente_turma
    'false, ' || -- aula_cancelada
    'NULL, ' || -- id_aula_extra
    ta.bimestre || ', ' || -- Pega o bimestre da consulta
    'false, ' || -- programado
    'false, ' || -- bimestral
    'false, ' || -- necessita_correcao
    'false, ' || -- replica_conteudo
    CASE WHEN ta.conteudo_ministrado IS NOT NULL THEN '''' || REPLACE(ta.conteudo_ministrado, '''', '''''') || '''' ELSE 'NULL' END || -- conteudo_ministrado (trata aspas internas)
    ');' AS insert_statement
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado;