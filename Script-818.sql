 select * FROM ava.topico_aula ta
    WHERE ta.descricao IS NULL
      AND (ta.conteudo_ministrado IS NOT NULL AND ta.descricao IS NULL)
      AND ta.data_cadastro >= '2025-01-01'
      AND ta.programado = true
      AND ta.id_turma = 681952;