select * from basico.turma_serie ts  where id_curriculo_medio = 51883770;
select * from ensino.componente_curricular cc;
select sun(ch_ano) from basico.curriculo_basico_componente cbc 
where id_curriculo_basico =51883770
and cbc.id_categoria_componente = 2 

SELECT SUM(ch_ano) 
FROM basico.curriculo_basico_componente cbc 
WHERE cbc.id_curriculo_basico = 51883770
AND cbc.id_categoria_componente = 2;


SELECT x.* FROM basico.curriculo_basico x
WHERE id_curriculo_basico = 51883770;

SELECT SUM(cbc.ch_ano) FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = :idCurriculoBasico AND cbc.id_categoria_componente = :idCategoriaComponente;

EFEASFA06


	
select * from basico.categoria_componente cc;


 select
	*
from
	(
	select
		nu.id_nota_unidade,
		nu.faltas,
		nu.nota,
		nu.unidade as unidade_nota,
		nu.recuperacao as recuperacao_unidade,
		mc.id_matricula_componente,
		mc.media_anual,
		mc.media_final,
		(
		select
			coalesce(sum(freq.frequencia),
			0)
		from
			ensino.frequencia_aluno freq
		where
			freq.ativo
			and (freq.abonada is null
				or freq.abonada = false)
			and freq.id_discente = mes.id_estudante
			and freq.id_turma = tc.id_turma ) as numero_faltas,
		sm.id_situacao_matricula,
		sm.descricao,
		d.id_discente,
		d.matricula,
		p.id_pessoa,
		p.nome,
		tc.id_turma,
		tc.ano,
		cc.id_componente_curricular,
		cc.nome as componente_nome,
		mc.recuperacao,
		tc.ordem,
		ts.id_turma_serie,
		ts.id_proxima_turma,
		m.id_modulo,
		m.denominacao,
		mc.media_anual_modulo,
		mc.prova_especial,
		tc.tipo as tipo,
		ts.id_curriculo_medio,
		tc.periodo as periodo_turma,
		(
		select
			SUM(freq.frequencia)
		from
			ensino.frequencia_aluno freq
		join ensino.turma t
				using (id_turma)
		where
			ativo = trueValue()
			and freq.id_discente = mes.id_estudante
			and t.id_turma_serie = mes.id_turma_serie
			and t.agrupadora = trueValue() ) as faltas_polivalente,
		s.descricao as serie,
		nu.id_descricao_nota,
		dn.cod_nota,
		mc.nao_optou,
		mc.conselho_classe,
		mc.id_matricula_estudante_serie,
		sm.sigla
	from
		basico.matricula_estudante_serie mes
	join ensino.matricula_componente mc on
		mc.id_discente = mes.id_estudante
		and mc.ano = mes.ano_calendario
	left join ensino.nota_unidade nu on
		mc.id_matricula_componente = nu.id_matricula_componente
	left join ensino.descricao_nota dn on
		nu.id_descricao_nota = dn.id_descricao_nota
	inner join public.discente d on
		d.id_discente = mc.id_discente
	inner join comum.pessoa p on
		p.id_pessoa = d.id_pessoa
	inner join ensino.turma tc on
		tc.id_turma = mc.id_turma
		and tc.id_situacao_turma <> 4
	left join basico.modulo m on
		m.id_modulo = tc.id_modulo
	join basico.turma_serie ts on
		ts.id_turma_serie = mes.id_turma_serie
	join basico.curriculo_basico cb_ts on
		cb_ts.id_curriculo_basico = ts.id_curriculo_medio
		and ((tc.id_turma_serie = mes.id_turma_serie
			and not cb_ts.multisseriado)
		or (tc.id_turma_serie = mes.id_turma_serie_multisseriado
			and cb_ts.multisseriado))
	inner join ensino.componente_curricular cc on
		cc.id_componente_curricular = tc.id_disciplina
	inner join ensino.situacao_matricula sm on
		sm.id_situacao_matricula = mc.id_situacao_matricula
	inner join basico.serie s on
		s.id_serie = ts.id_serie
	where
		mes.id_matricula_discente_serie = :idMES
		and sm.id_situacao_matricula in (:situacoesConsolidadas)
		and tc.agrupadora = false
		and nu.ativo = :ativo
		and tc.id_categoria_componente = 1
union
	select
		nu.id_nota_unidade,
		nu.faltas,
		nu.nota,
		nu.unidade as unidade_nota,
		nu.recuperacao as recuperacao_unidade,
		mc.id_matricula_componente,
		mc.media_anual,
		mc.media_final,
		(
		select
			coalesce(sum(freq.frequencia),
			0)
		from
			ensino.frequencia_aluno freq
		where
			freq.ativo
			and (freq.abonada is null
				or freq.abonada = false)
			and freq.id_discente = mes.id_estudante
			and freq.id_turma = tc.id_turma ) as numero_faltas,
		sm.id_situacao_matricula,
		sm.descricao,
		d.id_discente,
		d.matricula,
		p.id_pessoa,
		p.nome,
		tc.id_turma,
		tc.ano,
		cc.id_componente_curricular,
		cc.nome as componente_nome,
		mc.recuperacao,
		tc.ordem,
		ts.id_turma_serie,
		ts.id_proxima_turma,
		m.id_modulo,
		m.denominacao,
		mc.media_anual_modulo,
		mc.prova_especial,
		tc.tipo as tipo,
		ts.id_curriculo_medio,
		tc.periodo as periodo_turma,
		(
		select
			SUM(freq.frequencia)
		from
			ensino.frequencia_aluno freq
		join ensino.turma t
				using (id_turma)
		where
			ativo = trueValue()
			and freq.id_discente = mes.id_estudante
			and t.id_turma_serie = mes.id_turma_serie
			and t.agrupadora = trueValue() ) as faltas_polivalente,
		s.descricao as serie,
		nu.id_descricao_nota,
		dn.cod_nota,
		mc.nao_optou,
		mc.conselho_classe,
		mc.id_matricula_estudante_serie,
		sm.sigla
	from
		basico.matricula_estudante_serie mes
	join ensino.matricula_componente mc on
		mc.id_discente = mes.id_estudante
		and mc.ano = mes.ano_calendario
	left join ensino.nota_unidade nu on
		mc.id_matricula_componente = nu.id_matricula_componente
	left join ensino.descricao_nota dn on
		nu.id_descricao_nota = dn.id_descricao_nota
	inner join public.discente d on
		d.id_discente = mc.id_discente
	inner join comum.pessoa p on
		p.id_pessoa = d.id_pessoa
	inner join ensino.turma tc on
		tc.id_turma = mc.id_turma
		and tc.id_situacao_turma <> 4
		and tc.tipo = 5
	left join basico.modulo m on
		m.id_modulo = tc.id_modulo
	join basico.turma_serie ts on
		ts.id_turma_serie = tc.id_turma_serie
	inner join ensino.componente_curricular cc on
		cc.id_componente_curricular = tc.id_disciplina
	inner join ensino.situacao_matricula sm on
		sm.id_situacao_matricula = mc.id_situacao_matricula
	inner join basico.serie s on
		s.id_serie = ts.id_serie
	where
		mes.id_matricula_discente_serie = 1317605
		and sm.id_situacao_matricula in (5, 6, 2, 8)
		and tc.agrupadora = false
		and nu.ativo = :ativo
		and tc.id_categoria_componente = 1 ) as consulta
where
	id_matricula_estudante_serie = :idMES
	or id_matricula_estudante_serie is null
order by
	consulta.tipo asc,
	consulta.id_proxima_turma,
	consulta.periodo_turma,
	consulta.componente_nome,
	consulta.unidade_nota asc;
	
SELECT * FROM ( SELECT  nu.id_nota_unidade, nu.faltas, nu.nota, nu.unidade AS unidade_nota, nu.recuperacao AS recuperacao_unidade,  mc.id_matricula_componente, mc.media_anual, mc.media_final, ( SELECT coalesce(sum(freq.frequencia), 0)  FROM ensino.frequencia_aluno freq WHERE freq.ativo   AND (freq.abonada IS NULL OR freq.abonada = FALSE)  AND freq.id_discente = mes.id_estudante  AND freq.id_turma  = tc.id_turma ) AS numero_faltas, sm.id_situacao_matricula,  sm.descricao, d.id_discente, d.matricula, p.id_pessoa, p.nome,  tc.id_turma, tc.ano, cc.id_componente_curricular, cc.nome AS componente_nome, mc.recuperacao,  tc.ordem, ts.id_turma_serie, ts.id_proxima_turma, m.id_modulo, m.denominacao,  mc.media_anual_modulo, mc.prova_especial, tc.tipo AS tipo, ts.id_curriculo_medio, tc.periodo AS periodo_turma,  (select SUM(freq.frequencia) from ensino.frequencia_aluno freq join ensino.turma t using (id_turma) where ativo = trueValue() and freq.id_discente = mes.id_estudante and t.id_turma_serie = mes.id_turma_serie and t.agrupadora = trueValue() ) as faltas_polivalente, s.descricao as serie,   nu.id_descricao_nota, dn.cod_nota, mc.nao_optou, mc.conselho_classe, mc.id_matricula_estudante_serie, sm.sigla  FROM basico.matricula_estudante_serie mes  JOIN ensino.matricula_componente mc ON mc.id_discente = mes.id_estudante  AND mc.ano = mes.ano_calendario  LEFT JOIN ensino.nota_unidade nu ON  mc.id_matricula_componente = nu.id_matricula_componente  LEFT JOIN ensino.descricao_nota dn ON nu.id_descricao_nota = dn.id_descricao_nota  INNER JOIN public.discente d on d.id_discente = mc.id_discente  INNER JOIN comum.pessoa p on p.id_pessoa = d.id_pessoa  INNER JOIN ensino.turma tc on tc.id_turma = mc.id_turma  AND tc.id_situacao_turma <> 4 LEFT JOIN basico.modulo m on m.id_modulo = tc.id_modulo  JOIN basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie  JOIN basico.curriculo_basico cb_ts ON cb_ts.id_curriculo_basico = ts.id_curriculo_medio  AND ((tc.id_turma_serie = mes.id_turma_serie AND NOT cb_ts.multisseriado) or (tc.id_turma_serie = mes.id_turma_serie_multisseriado AND cb_ts.multisseriado))  INNER JOIN ensino.componente_curricular cc on cc.id_componente_curricular = tc.id_disciplina  INNER JOIN ensino.situacao_matricula sm on sm.id_situacao_matricula = mc.id_situacao_matricula  INNER JOIN basico.serie s ON s.id_serie = ts.id_serie  WHERE mes.id_matricula_discente_serie = ? AND sm.id_situacao_matricula in (?, ?, ?, ?) AND tc.agrupadora = false  AND nu.ativo = ?  AND tc.id_categoria_componente = 1 UNION  SELECT  nu.id_nota_unidade, nu.faltas, nu.nota, nu.unidade AS unidade_nota, nu.recuperacao AS recuperacao_unidade,  mc.id_matricula_componente, mc.media_anual, mc.media_final, ( SELECT coalesce(sum(freq.frequencia), 0)  FROM ensino.frequencia_aluno freq WHERE freq.ativo   AND (freq.abonada IS NULL OR freq.abonada = FALSE)  AND freq.id_discente = mes.id_estudante  AND freq.id_turma  = tc.id_turma ) AS numero_faltas, sm.id_situacao_matricula,  sm.descricao, d.id_discente, d.matricula, p.id_pessoa, p.nome,  tc.id_turma, tc.ano, cc.id_componente_curricular, cc.nome AS componente_nome, mc.recuperacao,  tc.ordem, ts.id_turma_serie, ts.id_proxima_turma, m.id_modulo, m.denominacao,  mc.media_anual_modulo, mc.prova_especial, tc.tipo AS tipo, ts.id_curriculo_medio, tc.periodo AS periodo_turma,  (select SUM(freq.frequencia) from ensino.frequencia_aluno freq join ensino.turma t using (id_turma) where ativo = trueValue() and freq.id_discente = mes.id_estudante and t.id_turma_serie = mes.id_turma_serie and t.agrupadora = trueValue() ) as faltas_polivalente, s.descricao as serie,   nu.id_descricao_nota, dn.cod_nota, mc.nao_optou, mc.conselho_classe, mc.id_matricula_estudante_serie, sm.sigla  FROM basico.matricula_estudante_serie mes  JOIN ensino.matricula_componente mc ON mc.id_discente = mes.id_estudante  AND mc.ano = mes.ano_calendario  LEFT JOIN ensino.nota_unidade nu ON  mc.id_matricula_componente = nu.id_matricula_componente  LEFT JOIN ensino.descricao_nota dn ON nu.id_descricao_nota = dn.id_descricao_nota  INNER JOIN public.discente d on d.id_discente = mc.id_discente  INNER JOIN comum.pessoa p on p.id_pessoa = d.id_pessoa  INNER JOIN ensino.turma tc on tc.id_turma = mc.id_turma  AND tc.id_situacao_turma <> 4 AND tc.tipo = 5 LEFT JOIN basico.modulo m on m.id_modulo = tc.id_modulo  JOIN basico.turma_serie ts on ts.id_turma_serie = tc.id_turma_serie  INNER JOIN ensino.componente_curricular cc on cc.id_componente_curricular = tc.id_disciplina  INNER JOIN ensino.situacao_matricula sm on sm.id_situacao_matricula = mc.id_situacao_matricula  INNER JOIN basico.serie s ON s.id_serie = ts.id_serie  WHERE mes.id_matricula_discente_serie = ? AND sm.id_situacao_matricula in (?, ?, ?, ?) AND tc.agrupadora = false  AND nu.ativo = ?  AND tc.id_categoria_componente = 1 ) AS consulta  WHERE id_matricula_estudante_serie = ? OR id_matricula_estudante_serie IS NULL  ORDER BY consulta.tipo asc, consulta.id_proxima_turma, consulta.periodo_turma, consulta.componente_nome, consulta.unidade_nota asc
