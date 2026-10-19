SELECT DISTINCT
    mes.id_matricula_discente_serie, 
    p.id_pessoa, 
    p.nome, 
    p.cpf_cnpj, 
    p.data_nascimento, 
    p.nome_mae, 
    p.nome_pai, 
    p.cep, 
    p.complemento, 
    p.endereco, 
    p.numero, 
    p.bairro, 
    p.id_uf_contato, 
    p.id_municipio_contato, 
    p.id_uf_naturalidade, 
    m2.id_unidade_federativa AS m2_id_unidade_federativa, 
    m2.id_municipio AS m2_id_municipio, 
    p.id_localizacao_zona, 
    p.certidao_civil_matricula_nova, 
    p.certidao_civil_modelo, 
    estudante.id_estudante, 
    estudante.codigo_inep, 
    d.id_discente, 
    d.matricula, 
    sms.id_situacao_matricula_serie, 
    sms.descricao, 
    ts.id_turma_serie, 
    s.id_serie, 
    ee.id_etapa_ensino, 
    estudante.utiliza_transporte_escolar_publico, 
    m.id_unidade_federativa, 
    p.sexo, 
    p.id_raca, 
    pi.id_povo_indigena, 
    p.estrangeiro, 
    p.codigo_nis
FROM basico.matricula_estudante_serie mes 
JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie
JOIN basico.serie s ON s.id_serie = ts.id_serie
JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
JOIN basico.estudante estudante ON estudante.id_estudante = mes.id_estudante
JOIN public.discente d ON d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
JOIN basico.situacao_matricula_serie sms ON sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
LEFT JOIN comum.municipio m ON m.id_municipio = p.id_municipio_contato
LEFT JOIN comum.municipio m2 ON m2.id_municipio = p.id_municipio_naturalidade
LEFT JOIN comum.povo_indigena pi ON pi.id_povo_indigena = p.id_povo_indigena
LEFT JOIN matricula.solicitacao_transferencia sol ON sol.id_matricula_discente_serie = mes.id_matricula_discente_serie
    AND mes.ano_calendario = 2026 
LEFT JOIN basico.movimentacao_estudante me ON me.ano_escolar = 2026
    AND me.id_tipo_movimentacao_estudante = 3
    AND me.id_discente = mes.id_estudante
LEFT JOIN matricula.movimentacao_estudante_escola mee ON mee.id_matricula_estudante_serie = mes.id_matricula_discente_serie
WHERE mes.id_turma_serie = 54868537
  AND CASE WHEN ( mes.id_matricula_discente_serie IS NOT NULL
      AND mes.data_cadastro IS NOT NULL
      AND mes.id_situacao_matricula_serie = 1 )
  OR ( (sol.id_solicitacao_transferencia IS NOT NULL
      AND mes.id_situacao_matricula_serie = 6
      AND sol.data_solicitacao > '10/09/2026')
  OR (mee.id_movimentacao_estudante_escola IS NOT NULL
      AND mes.id_situacao_matricula_serie = 6
      AND mee.data > '10/09/2026') ) THEN mes.data_cadastro IS NOT NULL
  AND mes.data_cadastro <= 'Thu Sep 10 23:59:59 GFT 2026'
  ELSE TRUE END
  AND (CASE WHEN sol.id_solicitacao_transferencia IS NOT NULL
      AND mes.id_situacao_matricula_serie = 6
      AND sol.data_solicitacao < '10/09/2026' THEN FALSE
      ELSE TRUE END)
  AND (CASE WHEN me.id_movimentacao_estudante IS NOT NULL
      AND mes.id_situacao_matricula_serie = 5
      AND me.data_ocorrencia < '10/09/2026' THEN FALSE
      ELSE TRUE END)
  AND (CASE WHEN mee.id_movimentacao_estudante_escola IS NOT NULL
      AND mes.id_situacao_matricula_serie = 6
      AND mee.data < '10/09/2026' THEN FALSE
      ELSE TRUE END)
ORDER BY p.nome;