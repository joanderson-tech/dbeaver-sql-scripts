select
	distinct  
	e2.id_escola,
    p.nome AS "NOME ALUNO",
    p.codigo_inep AS "INEP",
    e2.nome AS "ESCOLA",
    ee.denominacao AS "ETAPA DE ENSINO",
    s.descricao AS "SÉRIE",
    t.descricao AS "TURNO",
    tt.codigo AS "TURMA",
    TO_CHAR(p.data_nascimento, 'DD/MM/YYYY') AS "DATA DE NASCIMENTO",
    p.nome_mae AS "NOME MÃE" 
from basico.matricula_estudante_serie mes
join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie
left join basico.serie s_mult on (s_mult.id_serie = mes.id_serie_multisseriado)
join ensino.turma tt on tt.id_turma_serie = ts.id_turma_serie
join escola.escola e2 on e2.id_escola = ts.id_escola
join basico.serie s on s.id_serie = ts.id_serie
join basico.curriculo_basico cb on cb.id_serie = s.id_serie
join basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino
join ensino.turno t on t.id_turno = ts.id_turno
join public.discente d on d.id_discente = mes.id_estudante
join comum.pessoa p on p.id_pessoa = d.id_pessoa
where mes.ano_calendario = 2025
and  mes.id_situacao_matricula_serie = 1
and cb.ativo 
and cb.multisseriado = true
and s_mult.descricao IS null
--and p.nome ilike  'ANA CLEIA RODRIGUES SOUZA' 
order by e2.nome, p.nome ;


(mes.id_matricula_discente_serie) mes.ano_calendario as "ANO",
	d.matricula as "MATRÍCULA",
	upper(p.nome) as "NOME",
	REGEXP_REPLACE(REGEXP_REPLACE(UPPER(SIMPLE_UNACCENT(REGEXP_REPLACE(TRIM(translate(p.nome, './-''', '')), '(\W)(\s*\1)', '\1'))), '\s+', ' ', 'g'), '[^a-zA-ZÇç]+', ' ', 'g') as "NOME",
	upper(p.nome_mae) as "NOME DA MÃE",
	p.numero_identidade_mae as "RG MÃE",
	upper(p.nome_pai) as "NOME DO PAI",
	p.numero_identidade_pai as "RG PAI",
	to_char(p.data_nascimento, 'DD/MM/YYYY') as "DATA NASCIMENTO",
	case
		when p.sexo = 'M' then 'MASCULINO'
		when p.sexo = 'F' then 'FEMININO'
		else 'OUTRO'
	end as "SEXO DO ESTUDANTE",
	SUBSTRING(LPAD(cast(p.cpf_cnpj as TEXT), 11, '0') from 1 for 3) || '.' || SUBSTRING(LPAD(cast(p.cpf_cnpj as TEXT), 11, '0') from 4 for 3) || '.' || SUBSTRING(LPAD(cast(p.cpf_cnpj as TEXT), 11, '0') from 7 for 3) || '-' || SUBSTRING(LPAD(cast(p.cpf_cnpj as TEXT), 11, '0') from 10 for 2) as "CPF",
	upper(tr.descricao) as "RAÇA",
	p.numero_identidade as "NÚMERO IDENTIDADE",
	p.codigo_sus as "CARTÃO SUS",
	p.codigo_inep as "INEP",
	p.codigo_nis as "NIS",
	case
		when e.participa_bolsa_familia = true then 'SIM'
		when e.participa_bolsa_familia = false then 'NÃO'
	end as "PARTICIPA DO BOLSA FAMÍLIA",
	p.certidao_civil_matricula_nova as "CERTIDÃO DE NASCIMENTO MATRÍCULA NOVA",
	upper(p.certidao_civil_num_termo) as "CERTIDÃO DE NASCIMENTO TERMO",
	upper(p.certidao_civil_num_folha) as "CERTIDÃO DE NASCIMENTO FOLHA",
	upper(p.certidao_civil_num_livro) as "CERTIDÃO DE NASCIMENTO LIVRO",
	upper(p.pais_nacionalidade) as "NACIONALIDADE",
	upper(concat(m_naturalidade.nome, '/', uf_naturalidade.sigla)) as "NATURALIDADE",
	upper(p.endereco) as "RUA",
	upper(p.numero) as "NUMERO",
	upper(p.bairro) as "BAIRRO",
	upper(m.nome) as "MUNICÍPIO",
	upper(uf_estado.descricao) as "ESTADO",
	p.cep as "CEP",
	trim(concat(p.telefone_fixo, ' ', p.telefone_celular, ' ', p.telefone_celular2, ' ', p.telefone_celular3)) as "TELEFONES",
	case
		when nee.motivo is not null then 'SIM'
		else 'NÃO'
	end as "ALUNO ESPECIAL",
	upper(nee.motivo) as "MOTIVO NEE",
	upper(p.nome_responsavel_matricula) as "NOME DO RESPONSÁVEL",
	p.numero_documento_responsavel_matricula as "CPF DO RESPONSÁVEL",
	esc.nome as "ESCOLA",
	esc.codigo_inep as "INEP DA ESCOLA",
	ts.nome as "TURMA",
	t.descricao as "TURNO",
	es.denominacao as "ETAPA ENSINO",
	s.descricao as "SÉRIE",
	s_mult.descricao as "SÉRIE ASSOCIADA",
	sms.descricao as "SITUAÇÃO",
	p.email as "E-MAIL",
	case
		when im.possui_intolerancia_lactose = true then 'SIM'
		when im.possui_intolerancia_lactose = false then 'NÃO'
		else 'NÃO INFORMADO'
	end as "INTOLERÂNCIA À LACTOSE",
	case
		when im.possui_intolerancia_gluten = true then 'SIM'
		when im.possui_intolerancia_gluten = false then 'NÃO'
		else 'NÃO INFORMADO'
	end as "INTOLERÂNCIA À GLÚTEN",
	case
		when im.possui_alergia = true then coalesce(upper(im.tipo_alergia), 'NÃO INFORMADO')
		when im.possui_alergia = false then 'NÃO'
		else 'NÃO INFORMADO'
	end as "ALERGIA",
	case
		when upe.login is not null then 'SIM'
		else 'NÃO'
	end as "POSSUI CADASTRO PORTAL",
	upe.login as "LOGIN ESTUDANTE",
	to_char(mes.data_cadastro, 'DD/MM/YYYY') as "DATA EFETIVAÇÃO",
	to_char(d.data_cadastro, 'DD/MM/YYYY') as "DATA MATRÍCULA",
	upper(taee.nome) as "TIPO DE AEE",
	upper(nee.recurso) as "RECURSO AEE",
	case
		when p.id_localizacao_zona = 1 then 'URBANA'
		when p.id_localizacao_zona = 2 then 'RURAL'
		else 'NÃO INFORMADO'
	end as "ZONA DO ESTUDANTE",
	upper(ld.denominacao) as "LOCALIZAÇÃO DIFERENCIADA DE RESIDÊNCIA",
	case
		when e.utiliza_transporte_escolar_publico = true then 'SIM'
		else 'NÃO'
	end as "UTILIZA TRANSPORTE",
	upper(transporte.tipo_transporte) as "TIPO DE TRANSPORTE",
	case
		when e.utiliza_transporte_escolar_publico = false then null
		when e.utiliza_transporte_escolar_publico = true
		and r.descricao is null then 'SEM ROTA ALOCADA'
		else r.descricao
	end as "Rota"
	

select
	ts.id_turma_serie as idTurmaSerie,
	ts.nome as nomeTurmaSerie,
	ts.tipo_diario as tipoDiario,
	ts.ano as ano,
	ts.periodo as periodo,
	ts.id_curriculo_medio as idCurriculoMedio,
	curriculob3_.multisseriado as multisseriado,
	ts.id_tipo_turma_serie as idTipoTurmaSerie,
	tts.descricao as descricaoTipoTurmaSerie,
	case
		when coalesce(ts.capacidade_aluno, 0) > 0 then ts.capacidade_aluno
		when coalesce(serie9_.capacidade_maxima, 0) > 0 then (serie9_.capacidade_maxima + coalesce(serie9_.capacidade_excesso, 0))
		else (eens.capacidade_maxima + coalesce(eens.capacidade_excesso, 0))
	end as capacidade,
	ts.regra_nao as regraNao,
	ts.justificativa_regra_nao as justificativaRegraNao,
	ts.id_turno as idTurno,
	turno5_.descricao as descricaoTurno,
	turno5_.hora_inicio as horaInicio,
	turno5_.hora_fim as horaFim,
	ts.id_escola as idEscola,
	escola8_.nome as nomeEscola,
	ts.id_serie as idSerie,
	serie9_.descricao as descricaoSerie,
	serie9_.multisseriada as multisseriada,
	serie9_.id_etapa_ensino as idEtapaEnsino,
	eens.denominacao as denominacao,
	eens.periodicidade_etapa as periodicidadeEtapa,
	case
		when eens.id_etapa_ensino <> 14 then (
		select
			count(*)
		from
			basico.matricula_estudante_serie
		where
			id_turma_serie = ts.id_turma_serie
			and id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 ) )
		else (
		select
			count(distinct(eea.id_estudante))
		from
			educacao_especial.atendimento_educacao_especial_horario eeh
		inner join educacao_especial.atendimento_educacao_especial_turma eet on
			eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma
		inner join educacao_especial.atendimento_educacao_especial_estudante eea on
			eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario
		inner join ensino.turma t on
			t.id_turma = eet.id_turma
		where
			id_turma_serie = ts.id_turma_serie
			and eea.ativo = true )
	end as qtdMatriculados,
	case
		when eens.id_etapa_ensino <> 14 then (
		select
			count(distinct id_discente)
		from
			basico.matricula_estudante_serie mes
		join discente d on
			d.id_discente = mes.id_estudante
		join comum.pessoa_necessidade_especial pne on
			d.id_pessoa = pne.id_pessoa
		where
			id_turma_serie = ts.id_turma_serie
			and id_situacao_matricula_serie not in ( 4, 5, 6, 9, 12 ))
		else (
		select
			count(distinct(eea.id_estudante))
		from
			educacao_especial.atendimento_educacao_especial_horario eeh
		inner join educacao_especial.atendimento_educacao_especial_turma eet on
			eet.id_atendimento_educacao_especial_turma = eeh.id_atendimento_educacao_especial_turma
		inner join educacao_especial.atendimento_educacao_especial_estudante eea on
			eea.id_atendimento_educacao_especial_horario = eeh.id_atendimento_educacao_especial_horario
		inner join ensino.turma t on
			t.id_turma = eet.id_turma
		where
			id_turma_serie = ts.id_turma_serie
			and eea.ativo = true )
	end as qtdMatriculadosNEE,
	(
	select
		count(*)
	from
		ensino.docente_turma dt
	join ensino.turma t
			using (id_turma)
	join basico.turma_serie ts
			using (id_turma_serie)
	where
		t.id_turma_serie = ts.id_turma_serie
		and dt.ativo = true ) as qtdProfessores,
	escola8_.id_unidade_escola,
	aue.id_ambiente_unidade_escolar,
	aue.nome_numero,
	escola8_.habilita_ambientes
from
	ensino.turma tc
inner join basico.turma_serie ts on
	tc.id_turma_serie = ts.id_turma_serie
left outer join ambiente.ambiente_unidade_escolar aue on
	aue.id_ambiente_unidade_escolar = ts.id_ambiente_unidade_escolar
left outer join basico.tipo_turma_serie tts on
	ts.id_tipo_turma_serie = tts.id_tipo_turma_serie,
	basico.curriculo_basico curriculob3_,
	ensino.turno turno5_,
	escola.escola escola8_,
	basico.serie serie9_,
	basico.etapa_ensino eens
where
	ts.id_curriculo_medio = curriculob3_.id_curriculo_basico
	and ts.id_turno = turno5_.id_turno
	and ts.id_escola = escola8_.id_escola
	and ts.id_serie = serie9_.id_serie
	and serie9_.id_etapa_ensino = eens.id_etapa_ensino
	and ts.ativo = true
	and (tts.id_tipo_turma_serie in ( 1, 3, 5, 4, 4 ))
	and (tc.tipo not in ( 10, 5, 8, 15, 11 ))
	--and ts.id_escola = :idEscola
	--and ts.ano = :ano
group by
	ts.id_turma_serie,
	ts.nome,
	ts.tipo_diario,
	ts.ano,
	ts.periodo,
	ts.id_curriculo_medio,
	curriculob3_.multisseriado,
	ts.id_tipo_turma_serie,
	tts.descricao,
	ts.capacidade_aluno,
	ts.regra_nao,
	ts.justificativa_regra_nao,
	ts.id_turno,
	turno5_.descricao,
	turno5_.hora_inicio,
	turno5_.hora_fim,
	ts.id_escola,
	escola8_.nome,
	ts.id_serie,
	serie9_.descricao,
	serie9_.multisseriada,
	serie9_.id_etapa_ensino,
	serie9_.capacidade_maxima,
	serie9_.capacidade_excesso,
	eens.denominacao,
	eens.periodicidade_etapa,
	eens.id_etapa_ensino,
	eens.capacidade_maxima,
	eens.capacidade_excesso,
	escola8_.id_unidade_escola,
	aue.id_ambiente_unidade_escolar,
	aue.nome_numero,
	escola8_.habilita_ambientes
order by
	serie9_.descricao;