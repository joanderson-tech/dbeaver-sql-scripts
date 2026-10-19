begin;

UPDATE ensino_infantil.relatorio_avaliativo_habilidade_resposta dst
   SET id_opcao_grupo_avaliacao_relatorio = src.id_opcao_grupo_avaliacao_relatorio
  FROM ensino_infantil.relatorio_avaliativo_habilidade  h_dst,
       ensino_infantil.relatorio_avaliativo_componente  c_dst,
       ensino_infantil.relatorio_avaliativo             r_dst,
       basico.matricula_estudante_serie                 mes,
       ensino_infantil.relatorio_avaliativo             r_src,
       ensino_infantil.relatorio_avaliativo_componente  c_src,
       ensino_infantil.relatorio_avaliativo_habilidade  h_src,
       ensino_infantil.relatorio_avaliativo_habilidade_resposta src
 WHERE h_dst.id_relatorio_avaliativo_habilidade = dst.id_relatorio_avaliativo_habilidade
   AND c_dst.id_relatorio_avaliativo_componente = h_dst.id_relatorio_avaliativo_componente
   AND r_dst.id_relatorio_avaliativo = c_dst.id_relatorio_avaliativo
   AND r_dst.ativo
   AND mes.id_matricula_discente_serie = r_dst.id_matricula_discente_serie
   AND mes.id_turma_serie IN (51958442)
   AND r_src.id_matricula_discente_serie = r_dst.id_matricula_discente_serie
   AND NOT r_src.ativo
   AND c_src.id_relatorio_avaliativo = r_src.id_relatorio_avaliativo
   AND c_src.id_configuracao_relatorio_componente = c_dst.id_configuracao_relatorio_componente
   AND h_src.id_relatorio_avaliativo_componente = c_src.id_relatorio_avaliativo_componente
   AND h_src.id_configuracao_relatorio_componente_habilidade = h_dst.id_configuracao_relatorio_componente_habilidade
   AND src.id_relatorio_avaliativo_habilidade = h_src.id_relatorio_avaliativo_habilidade
   AND src.periodo IS NOT DISTINCT FROM dst.periodo
   AND dst.id_opcao_grupo_avaliacao_relatorio IS NULL
   AND src.id_opcao_grupo_avaliacao_relatorio IS NOT NULL;
   
   ROLLBACK;
-- ativação da configuração do relatório para lançamento das notas
UPDATE ensino_infantil.configuracao_relatorio
   SET ativo = true
 WHERE id_configuracao_relatorio IN (34, 35);
