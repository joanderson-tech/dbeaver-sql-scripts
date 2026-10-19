
select distinct
	e.nome as escola,
	u.nome as zona,
	ee.denominacao as etapa_ensino,
	s.descricao as serie,
	t.descricao as turno,
	count(distinct eip.id_estudante_inscrito) as total_alunos,
	count(distinct e.id_escola) as total_escola
from
	matricula.estudante_inscrito ei
INNER join matricula.estudante_inscrito_processamento eip on
	eip.id_estudante_inscrito = ei.id_estudante_inscrito
join matricula.listagem_processamento_matricula lpm on
	lpm.id_listagem_processamento_matricula = eip.id_listagem_processamento_matricula
join matricula.calendario_matricula cm on
	cm.id_calendario_matricula = lpm.id_calendario_matricula
join matricula.estudante_inscrito_opcao_escola eioe on
	eioe.id_estudante_inscrito = ei.id_estudante_inscrito
join matricula.vaga_serie vs on
	vs.id_vaga_serie = eioe.id_vaga_serie
join basico.serie s on
	s.id_serie = vs.id_serie
join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
join ensino.turno t on
	t.id_turno = vs.id_turno
join escola.escola e on
	e.id_escola = eioe.id_escola
join comum.unidade u on
	u.id_unidade = e.id_regional_ensino
where  eioe.prioridade_pre_matricula  = 1
	and ei.id_status not in ( 5, 8 )
	and cm.ano = 2023
	and t.id_turno = 2
	and eioe.id_escola = 52232930
	group by 
	s.descricao,
	e.nome,
	ee.denominacao,
	u.nome,
	t.descricao
	
	
	
	
	
	
select * from escola.configuracao_escola ce
where ce.bloqueia_transferencia_estudante_menu_matricula = true ;
	
begin;
rollback;
end
commit;

	
	
ALTER TABLE escola.configuracao_escola
ADD COLUMN bloqueia_transferencia_estudante_menu_matricula BOOLEAN DEFAULT FALSE,
ADD COLUMN bloqueia_transferencia_estudante_menu_estudante BOOLEAN DEFAULT FALSE;

ALTER TABLE escola.configuracao_escola
DROP COLUMN bloqueia_transferencia_estudante_menu_matricula,
DROP COLUMN bloqueia_transferencia_estudante_menu_estudante;

UPDATE escola.configuracao_escola
SET id_escola=52232895, permite_ofertar_vaga_componente=false, ceja=false, prioridade_militar_processamento=false, gestao_turmas_sem_matriculas=false, exige_matricula_faixa_etaria=true, cadastra_estudante_sem_controle_vaga=NULL, id_tipo_militar_prioridade=NULL, centro_educacional_especial=false, centro_formacao_virtual=false, porcentagem_vagas_militares=NULL, data_limite_vagas_militares=NULL, centro_educacao_ensino_superior=false, bloqueia_acesso_novos_estudantes=false, bloqueia_transferencia_estudante_menu_matricula=false, bloqueia_transferencia_estudante_menu_estudante=false
WHERE id_configuracao_escola=52340830;

