SELECT *--ta.id_turma, ta."data", ta.fim, ta.bimestre, ta.descricao, ta.conteudo_ministrado, ta.programado
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado;

select * from ava.topico_aula ta where 1 = 1
and ta.descricao is not null 
and ta.conteudo is not null 
and ta.programado = ativo ;

 SELECT
        ta.id_topico_aula,
        ta."data",
        ta.conteudo_ministrado,
        ta.descricao,
        ta.data_cadastro,
        ta.programado,
        ta.id_turma
    FROM ava.topico_aula ta
    WHERE ta.descricao IS NOT NULL
        AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
        AND ta.data_cadastro >= '2025-01-01'
        AND ta.programado = true;