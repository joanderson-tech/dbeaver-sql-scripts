SELECT
    'INSERT INTO ava.topico_aula (' || 
    'id_topico_aula, ' ||              
    'id_turma, descricao, "data", fim, id_topico_pai, conteudo, id_usuario, data_cadastro, visivel, ativo, id_docente_turma, aula_cancelada, id_aula_extra, bimestre, programado, bimestral, necessita_correcao, replica_conteudo, conteudo_ministrado' || -- Parte 2 das colunas
    ') VALUES(' ||                    
    'nextval(''hibernate_sequence''), ' || -
    ta.id_turma || ', ' ||
    'NULL, ' || 
    '''' || ta."data" || ''', ' || 
    CASE WHEN ta.fim IS NOT NULL THEN '''' || ta.fim || '''' ELSE 'NULL' END || ', ' || -- fim (pode ser NULL)
    'NULL, ' || 
    'NULL, ' || 
    '1, ' || 
    'now(), ' || 
    'false, ' || 
    'true, ' || 
    'NULL, ' || 
    'false, ' || -- aula_cancelada
    'NULL, ' || -- id_aula_extra
    ta.bimestre || ', ' || -- Pega o bimestre da consulta
    'false, ' || -- programado
    'false, ' || -- bimestral
    'false, ' || -- necessita_correcao
    'false, ' || -- replica_conteudo
    CASE WHEN ta.conteudo_ministrado IS NOT NULL THEN '''' || REPLACE(ta.conteudo_ministrado, '''', '''''') || '''' ELSE 'NULL' END || -- conteudo_ministrado (trata aspas internas)
    ');' AS insert_statement -- Fim da string
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado = true;
  and ta.id_turma = 681952;