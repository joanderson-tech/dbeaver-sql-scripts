--solução
--17
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade 
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) 
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), 80, 751, TRUE);

INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade 
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) 
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), 80, 752, TRUE);

--18
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade 
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) 
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), 91, 751, TRUE);

INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade 
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) 
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), 91, 752, TRUE);

--19
INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade 
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) 
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), 95, 751, TRUE);

INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade 
(id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) 
VALUES(nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq'), 95, 752, TRUE);

--cria habilidade (aproximadamente 21400 inserts)
insert into ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade )
select 
nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq'), rac.id_relatorio_avaliativo_componente, crch.id_configuracao_relatorio_componente_habilidade 
from ensino_infantil.configuracao_relatorio_componente_habilidade crch 
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_configuracao_relatorio_componente = crch.id_configuracao_relatorio_componente 
join ensino_infantil.relatorio_avaliativo ra on ra.id_relatorio_avaliativo  = rac.id_relatorio_avaliativo 
join basico.matricula_estudante_serie mes on mes.id_matricula_discente_serie = ra.id_matricula_discente_serie 
where crch.id_configuracao_relatorio_componente in (80, 91, 95) and crch.id_habilidade_competencia in (751, 752)
and mes.ano_calendario =2024 and not exists (
	select 1 from ensino_infantil.relatorio_avaliativo_habilidade rah 
	where rah.id_configuracao_relatorio_componente_habilidade = crch.id_configuracao_relatorio_componente_habilidade 
		and rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente);
	
--cria resposta para cada habilidade de cada período	 (aproximadamente 85600 inserts)
insert into ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo)
with periodos (periodo) as (values (1), (2), (3), (4))
select 
nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq'), rah.id_relatorio_avaliativo_habilidade, null, p.periodo
from ensino_infantil.relatorio_avaliativo_habilidade rah 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on rah.id_configuracao_relatorio_componente_habilidade = crch.id_configuracao_relatorio_componente_habilidade, 
periodos p
where crch.id_configuracao_relatorio_componente in (80, 91, 95) and crch.id_habilidade_competencia in (751, 752) and not exists (
	select 1 from ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr 
	where rahr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade 
		and rahr.periodo = p.periodo);
