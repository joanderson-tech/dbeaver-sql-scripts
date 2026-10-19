select * from ensino_infantil.relatorio_avaliativo_habilidade h where h.id_relatorio_avaliativo_habilidade = 7;

SELECT cr.* FROM ensino_infantil.configuracao_relatorio AS cr WHERE id_configuracao_relatorio = 7;

select * from ensino_infantil.configuracao_relatorio_componente_habilidade crh where crh.id_configuracao_relatorio_componente  = 37;

select * from ensino_infantil.habilidade_competencia hc 
where hc.descricao LIKE '(EI03CG01)%';

select *
from ensino_infantil.habilidade_competencia hc
where hc.ativo = true and hc.descricao similar to '%((EF01MA09)|(EF01MA10)|(EF01MA12))%';

SELECT *
FROM ensino_infantil.habilidade_competencia hc
WHERE hc.ativo = TRUE
  AND hc.descricao SIMILAR TO 'EF15AR(09|11|14)%';


select * from ensino_infantil.configuracao_relatorio_componente crc 
where crc.id_configuracao_relatorio = 7; and crc.id_componente_curricular = 518;

select mes.id_matricula_discente_serie,  * from discente d join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente where d.matricula = '202530019815';
	
select * from ensino_infantil.relatorio_avaliativo ra where ra.id_matricula_discente_serie = 1319121;
select *
from ensino_infantil.habilidade_competencia hc
where hc.ativo = true and hc.descricao similar to  '%(EF01MA14)%'
ORDER BY hc.data_cadastro ASC
LIMIT 1;
string_agg(id_configuracao_relatorio_componente_habilidade::varchar, ', ')



select  string_agg(id_relatorio_avaliativo_habilidade_resposta::varchar, ', ')  from ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr  where rahr.id_relatorio_avaliativo_habilidade  in (507, 554, 601, 648, 695, 742, 789, 836, 883);

select string_agg(id_relatorio_avaliativo_habilidade_resposta::varchar, ', ') from ensino_infantil.relatorio_avaliativo_habilidade rah where rah.id_configuracao_relatorio_componente_habilidade  = 251;

select * from ensino_infantil.configuracao_relatorio_componente_habilidade where id_habilidade_competencia = 51870142;

Erro SQL [23503]: ERROR: update or delete on table "relatorio_avaliativo_habilidade" violates foreign key constraint "relatorio_avaliativo_habilidade_fk" on table "relatorio_avaliativo_habilidade_resposta"
  Detalhe: Key (id_relatorio_avaliativo_habilidade)=(262) is still referenced from table "relatorio_avaliativo_habilidade_resposta".

/*
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (2057, 92, 440);
INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (2074, 83, 442);
INSERT INTO ensino_infantil.habilidade_competencia (id_habilidade_competencia, descricao, ativo, data_cadastro) VALUES(51870142, '(EF01MA14) Identificar e nomear figuras planas (círculo, quadrado, retângulo e triângulo) em desenhos apresentados em diferentes disposições ou em contornos de faces de sólidos geométricos.', true, '2021-02-08 00:00:00.000');
*/

EF01MA14

begin;

rollback;

--EDUCAÇÃO FINANCEIRA
WITH habilidades_competencia_novas AS (
	SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.descricao SIMILAR TO  '%(EF01MA01|EF01MA08|EF01MA09|EF01MA19|EF01MA21)%' ORDER BY hc.data_cadastro asc LIMIT 5
), configuracoes_relatorio_componente_habilidades_novas AS (
	SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 43 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
	SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 7 AND crc.id_componente_curricular = 518
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

