

select * from  ensino_infantil.parecer_descritivo_individual pdi where pdi.id_matricula_discente_serie = 1353520;

select * from ensino_infantil.relatorio_avaliativo ra where ra.id_configuracao_relatorio = 23;
select * from ensino_infantil.configuracao_relatorio_componente crc; where crc.id_configuracao_relatorio  = 23;
select * from ensino_infantil.configuracao_relatorio_componente_habilidade crch; where crch.id_configuracao_relatorio_componente = 130;
select 	rac.parecer_final_descritivo, rac.id_matricula_componente as id_matricula_componente, rac.avaliacao_descritiva as avaliacao_descritiva
from ensino_infantil.relatorio_avaliativo_componente rac where  rac.id_matricula_componente  in (17445578 );

  
  select distinct  * from ensino.matricula_componente  WHERE id_matricula_componente in (17400691, 17400705, 17400719, 17400726, 17438673);


 select * --distinct id_serie_multisseriado 
 from basico.matricula_estudante_serie mes where mes.id_curriculo_medio in (52373522,52373537,52373474,52373504) and mes.ano_calendario = 2025;
 
 SELECT cb.* FROM basico.curriculo_basico AS cb
WHERE id_curriculo_basico in (52373522,52373537,52373474,52373504);
 
 select * from ensino.turma t where t.id_turma = 706171;

 select * from ensino.turma t where t.id_turma_serie = 53463587;
 
  select * from ensino.turma t where t.id_turma_serie in (53464571, 53464573) order by t.id_turma_serie;
 53468120
 
-- string_agg(id_frequencia  ::varchar, ', ') 
select * --string_agg(t.id_turma::varchar, ', ') 
from ensino.turma t where t.id_turma_serie = 53468120;
 
 select * from  ensino_infantil.configuracao_relatorio cr; where cr.id_curriculo_basico = 53620667;
 select * from  ensino_infantil.configuracao_relatorio cr;  
 
 select distinct id_serie_multisseriado 
 from basico.matricula_estudante_serie mes where mes.id_turma_serie = 53468124 and mes.ano_calendario = 2025;
 
 select * from basico.turma_serie ts where ts.id_turma_serie = 53468124;
 
 select * from  ensino_infantil.configuracao_relatorio cr where cr.id_configuracao_relatorio in (17,21,19,23);
 
 select * from  ensino_infantil.configuracao_relatorio_componente where id_configuracao_relatorio_componente in (130, 101, 113, 93);
 
  select string_agg(id_matricula_componente::varchar, ', ') 
  from  ensino.matricula_componente mc where mc.id_turma in (709034, 709041, 709048, 709055, 707568, 707575, 707735, 707742, 706171, 706178, 706185, 706192, 706970, 706977, 706984, 706991) ;
  
  select * from basico.curriculo_basico cb where cb.id_curriculo_basico = 53620667;
  
  select  * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_aluno fa where fa.id_turma in (709041);  and ativo;


select * from ensino.turma t where t.id_turma_serie in (53463591) order by t.id_turma_serie; 

--C.R.UNID.XVIII ESCOLA DONA EULALIA QUILIDÔNIA DE ARAÚJO
--706970, 706977, 706984, 706991

-- C.R UNID III EDGAR JOSE DE MORAIS
--709034, 709041, 709048, 709055

--C.R. UNID. XIV VEREADOR JOSÉ ALEXANDRE PEREIRA(VEREADOR ZÉ FILHO)
--707568, 707575, 707735, 707742

--C.R. UNID X MARIA BERNADETE MARQUES SOUZA GINANE
--706171, 706178, 706185, 706192

UPDATE ensino.turma SET id_situacao_turma = 4 WHERE id_turma in (709034, 709041, 709048, 709055, 707568, 707575, 707735, 707742, 706171, 706178, 706185, 706192, 706970, 706977, 706984, 706991) ;
UPDATE ensino.matricula_componente SET id_situacao_matricula =7 WHERE id_matricula_componente in (17400691, 17400705, 17400719, 17400726, 17438673, 17400656, 17422202, 17448342, 17452897, 17400670, 17400677, 17400698, 17445324, 17446810, 17400712, 17400663, 17400684, 17400849, 17400870, 17400877, 17450590, 17400856, 17440753, 17400842, 17400863, 17400891, 17441902, 17450982, 17400884, 17400899, 17409542, 17409549, 17409556, 17409563, 17409570, 17409577, 17409598, 17409605, 17453037, 17409535, 17409584, 17409591, 17440384, 17438434, 17409801, 17409815, 17409822, 17409836, 17409843, 17409871, 17409885, 17409808, 17409829, 17409850, 17409857, 17409864, 17409878, 17434841, 17452627, 17452635, 17421976, 17421983, 17421990, 17422004, 17421997, 17422011, 17422018, 17448076);
UPDATE ensino_infantil.configuracao_relatorio_componente SET ativo=false WHERE id_configuracao_relatorio_componente in (130, 101, 113, 93);

  
--Backup C.R UNID III EDGAR JOSE DE MORAIS  Turma: EIUMEICPA
UPDATE ensino.turma SET id_situacao_turma=1 WHERE id_turma in (709034, 709041, 709048, 709055, 707568, 707575, 707735, 707742, 706171, 706178, 706185, 706192, 706970, 706977, 706984, 706991) ;
UPDATE ensino.matricula_componente SET id_situacao_matricula=2 WHERE id_matricula_componente in (17400691, 17400705, 17400719, 17400726, 17438673, 17400656, 17422202, 17448342, 17452897, 17400670, 17400677, 17400698, 17445324, 17446810, 17400712, 17400663, 17400684, 17400849, 17400870, 17400877, 17450590, 17400856, 17440753, 17400842, 17400863, 17400891, 17441902, 17450982, 17400884, 17400899, 17409542, 17409549, 17409556, 17409563, 17409570, 17409577, 17409598, 17409605, 17453037, 17409535, 17409584, 17409591, 17440384, 17438434, 17409801, 17409815, 17409822, 17409836, 17409843, 17409871, 17409885, 17409808, 17409829, 17409850, 17409857, 17409864, 17409878, 17434841, 17452627, 17452635, 17421976, 17421983, 17421990, 17422004, 17421997, 17422011, 17422018, 17448076);
UPDATE ensino_infantil.configuracao_relatorio_componente SET ativo=true WHERE id_configuracao_relatorio_componente in (130, 101, 113, 93);


 SELECT DISTINCT  ra.id_relatorio_avaliativo as id_relatorio,  ra.id_configuracao_relatorio as id_configuracao,  cr.possui_parecer_descritivo as possui_parecer_descritivo,  ra.id_matricula_discente_serie as id_mes,  mes.id_turma_serie,  mes.id_turma_serie_multisseriado,  ra.id_situacao_relatorio_avaliativo as id_situacao_relatorio,  ra.ativo as ativo_relatorio,  ra.id_parecer_descritivo_individual as id_parecer,  pdi.ativo as ativo_parecer ,  ra.situacao as relatorio_situacao,  ra.justificativa_situacao as relatorio_justificativa_situacao,  cb.possui_parte_diversificada,  cb.tipo_diario,  cb.tipo_diario_diversificado,  rac.id_configuracao_relatorio_componente as id_configuracao_componente,  crc.possui_parecer_final_fixo,  crc.possui_parecer_final_descritivo,  rac.id_relatorio_avaliativo_componente as id_relatorio_componente,  rac.parecer_final_fixo,  rac.parecer_final_descritivo,  rac.id_matricula_componente as id_matricula_componente,  rac.avaliacao_descritiva as avaliacao_descritiva,  rac.id_situacao_relatorio_avaliativo_componente as situacao_componente,  rac.avaliacao_descritiva_2 as avaliacao_descritiva_2,  rac.avaliacao_descritiva_3 as avaliacao_descritiva_3,  rac.avaliacao_descritiva_4 as avaliacao_descritiva_4,  rah.id_relatorio_avaliativo_habilidade as id_relatorio_habilidade,  rah.id_configuracao_relatorio_componente_habilidade as id_configuracao_habilidade,  crch.ativo as configuracao_habilidade_ativo,  rahr.id_relatorio_avaliativo_habilidade_resposta as id_relatorio_resposta,  rahr.id_opcao_grupo_avaliacao_relatorio as id_opcao_resposta,  rahr.periodo as resposta_periodo,  pdi.descricao as parecer_descricao,  pdi.descricao_medial as parecer_descricao_medial,  pdi.descricao_final as parecer_descricao_final,  p.nome as pessoa_nome,  p.nome_mae as nome_mae,  p.nome_pai as nome_pai,  d.matricula as matricula,  sms.descricao as situacao_descricao,  pr.id_periodicidade_relatorio AS periodicidade_relatorio,  pr.descricao AS periodicidade_descricao,  pr.quantidade_repeticoes as periodicidade_qtd_repeticoes,  pr.unidade_descricao as unidade_descricao,  tacr.id_tipo_avaliacao_componente_relatorio as id_tipo_avaliacao,  ogar.id_opcao_grupo_avaliacao_relatorio as opcao_id,  ogar.sigla as opcao_sigla,  ogar.descricao AS opcao_descricao,  cc.nome as componente_nome,  cc.id_componente_curricular as id_componente_curricular,  ac.descricao as area_conhecimento_descricao,  hc.id_habilidade_competencia as id_habilidade_competencia,  hc.descricao as habilidade_descricao,  crc.maximo_caracteres_relatorio,  t.id_categoria_componente  FROM basico.matricula_estudante_serie mes   JOIN public.discente d ON d.id_discente = mes.id_estudante  JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa  JOIN basico.situacao_matricula_serie sms ON sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie  JOIN ensino_infantil.relatorio_avaliativo ra  ON mes.id_matricula_discente_serie = ra.id_matricula_discente_serie  LEFT JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo  LEFT JOIN ensino_infantil.parecer_descritivo_individual pdi ON pdi.id_parecer_descritivo_individual = ra.id_parecer_descritivo_individual  LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente  LEFT JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr ON rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade  LEFT JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente  LEFT JOIN ensino_infantil.configuracao_relatorio cr ON cr.id_configuracao_relatorio = ra.id_configuracao_relatorio  LEFT JOIN ensino_infantil.grupo_avaliacao_relatorio gar ON gar.id_grupo_avaliacao_relatorio = cr.id_grupo_avaliacao_relatorio  LEFT JOIN ensino_infantil.opcao_grupo_avaliacao_relatorio ogar ON ogar.id_grupo_avaliacao_relatorio  = gar.id_grupo_avaliacao_relatorio  LEFT JOIN ensino_infantil.periodicidade_relatorio pr ON pr.id_periodicidade_relatorio = cr.id_periodicidade_relatorio  LEFT JOIN ensino_infantil.tipo_avaliacao_componente_relatorio tacr ON tacr.id_tipo_avaliacao_componente_relatorio = crc.id_tipo_avaliacao_componente_relatorio  LEFT JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = crc.id_componente_curricular  LEFT JOIN ensino_infantil.area_conhecimento ac ON ac.id_area_conhecimento = cc.id_area_conhecimento  LEFT JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON crch.id_configuracao_relatorio_componente_habilidade = rah.id_configuracao_relatorio_componente_habilidade  LEFT JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia  LEFT JOIN ensino.matricula_componente mc ON mc.id_matricula_componente = rac.id_matricula_componente AND mc.id_discente = d.id_discente  LEFT JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = cr.id_curriculo_basico  LEFT JOIN ensino.turma t ON t.id_turma = mc.id_turma AND t.id_disciplina = mc.id_componente_curricular  WHERE ra.ativo  AND crc.ativo     AND ((cr.possui_parecer_descritivo AND pdi.ativo) OR NOT cr.possui_parecer_descritivo)     AND d.status <> 2    AND ((ra.id_situacao_relatorio_avaliativo <> 4        AND rac.id_situacao_relatorio_avaliativo_componente <> 4)        or (mes.id_situacao_matricula_serie =4 and (            select count(*)             from basico.movimentacao_estudante me             where me.id_discente = mc.id_discente             and me.ativo             and me.id_tipo_movimentacao_estudante = 3            and ano_escolar = mes.ano_calendario         ) > 0)     ) AND mes.id_matricula_discente_serie IN  ( 1354385 ) AND mc.id_situacao_matricula IN  ( 5,6,2,8,9,4 )




