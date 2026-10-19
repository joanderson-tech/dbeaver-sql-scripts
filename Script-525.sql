WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.descricao SIMILAR TO '%(EI03CG01|EI03CG02|EI03CG04|EI03CG05)%'
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 23 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 5 AND crc.id_componente_curricular = 507
), relatorios_avaliativos_habilidades_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
	SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;



begin;
rollback;


UPDATE comum.sistema SET url = 'http://testes-professor-portalsigeduc.esig.com.br' WHERE id = 17;