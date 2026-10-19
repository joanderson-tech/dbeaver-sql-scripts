select * from escola.configuracao_escola ce;
select * from escola.configuracao_escola ce
where ce.bloqueia_transferencia_estudante_menu_estudante = true ;

	
begin;
rollback;
end
commit;
	52340728
	52232930
	
	select * from escola.configuracao_escola ce
	where ce.id_escola = 27224059;

	
ALTER TABLE escola.configuracao_escola
ADD COLUMN bloqueia_transferencia_estudante_menu_matricula BOOLEAN DEFAULT false,
ADD COLUMN bloqueia_transferencia_estudante_menu_estudante BOOLEAN DEFAULT false;

ALTER TABLE escola.configuracao_escola
DROP COLUMN bloqueia_transferencia_estudante_menu_matricula,
DROP COLUMN bloqueia_transferencia_estudante_menu_estudante;

UPDATE escola.configuracao_escola
SET id_escola=52232895, permite_ofertar_vaga_componente=false, ceja=false, prioridade_militar_processamento=false, gestao_turmas_sem_matriculas=false, exige_matricula_faixa_etaria=true, cadastra_estudante_sem_controle_vaga=NULL, id_tipo_militar_prioridade=NULL, centro_educacional_especial=false, centro_formacao_virtual=false, porcentagem_vagas_militares=NULL, data_limite_vagas_militares=NULL, centro_educacao_ensino_superior=false, bloqueia_acesso_novos_estudantes=false, bloqueia_transferencia_estudante_menu_matricula=false, bloqueia_transferencia_estudante_menu_estudante=false
WHERE id_configuracao_escola=52340830;

ALTER TABLE escola.configuracao_escola ALTER COLUMN bloqueia_transferencia_estudante_menu_matricula SET NOT NULL;
ALTER TABLE escola.configuracao_escola ALTER COLUMN bloqueia_transferencia_estudante_menu_estudante SET NOT NULL;


select
	ce.bloqueia_transferencia_estudante_menu_matricula,
	ce.bloqueia_transferencia_estudante_menu_estudante
from
	escola.configuracao_escola ce
where
	ce.id_escola  = :idEscola;
	








select * from escola.un





select
	e.id_escola,
	e.nome ,
	e.endereco
from escola.escola e  
where e.id_dependencia_administrativa = 3
	and e.id_municipio  = 2611101
	and upper( to_ascii(upper(e.nome), 'LATIN9')) like to_ascii('%%%%%',
	'LATIN9')
order by
	e.nome
	
	select
	escola.id,
	escola.nome,
	escola.endereco,
	escola.municipio.nome,
	escola.regionalEnsino.nome,
	escola.bairro.denominacao
from
	Escola escola
inner join escola.unidadeEscola u
inner join escola.municipio municipio
left join escola.bairro
left join escola.regionalEnsino dired
where
	u.ativo = true
	and escola.dependenciaAdm = 3
	and municipio.id = 2611101
	and upper( to_ascii(upper(escola.nome), 'LATIN9')) like to_ascii('%%%%%',
	'LATIN9')
order by
	escola.nome