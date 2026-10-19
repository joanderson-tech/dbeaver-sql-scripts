 with notas as (
select
	nu.nota,
	cc.nome as componente,
	mc.id_discente,
	t.id_turma_serie
from
	ensino.nota_unidade nu
join ensino.matricula_componente mc on
	mc.id_matricula_componente = nu.id_matricula_componente
join ensino.turma t on
	t.id_turma = mc.id_turma
join ensino.componente_curricular cc on
	cc.id_componente_curricular = mc.id_componente_curricular
	and cc.id_componente_curricular <> 220
where
	nu.unidade = 4
	and nu.ativo
	and (nu.id_descricao_nota in (4, 6, 21)
		or nu.id_descricao_nota is null)
	and mc.ano = 2023
	and mc.id_situacao_matricula in ( 5, 6, 2, 8 ) ),
levantamento as (
select
	e.nome as unidade,
	ee.sigla as etapa_Ensino,
	s.descricao as serie,
	t.descricao as turno,
	n.componente as componente_Curricular,
	count(distinct ts.id_turma_serie) as total_turmas,
	count(distinct n.id_discente) filter (
	where n.nota >= 6.0 ) as total_alunos_acima_media,
	count(distinct mes.id_matricula_discente_serie) as total_alunos
from
	escola.escola e
join basico.turma_serie ts on
	ts.id_escola = e.id_escola
join basico.serie s on
	s.id_serie = ts.id_serie
join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
join ensino.turno t on
	t.id_turno = ts.id_turno
join basico.matricula_estudante_serie mes on
	coalesce(mes.id_turma_serie_multisseriado,
	mes.id_turma_serie) = ts.id_turma_serie
left join notas n on
	n.id_discente = mes.id_estudante
		and n.id_turma_serie = coalesce(mes.id_turma_serie_multisseriado,
		mes.id_turma_serie)
	where
		ts.ano = 2023
		and ts.ativo
		and ts.tipo_diario in ( 0, 2, 3, 4, 5, 10, 11, 12, 13, 15, 17, 28, 29, 30, 32, 33, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 55, 56, 57, 58, 59, 60 )
			and mes.id_situacao_matricula_serie in ( 2, 3, 1, 7, 8, 10,-1 )
				and e.id_escola = 52232803
				and (case
					when ts.tipo_diario = 11 then mes.id_turma_serie_multisseriado is not null
					else true
				end)
			group by
				e.nome,
				ee.sigla,
				s.descricao,
				t.descricao,
				n.componente
			order by
				e.nome )
select
	*,
	ROUND((cast(total_alunos_acima_media as numeric) * 100 / total_alunos),
	2) as percent_alunos_acima_media
from
	levantamento
	
	
	
	
	
	sql.append(" WITH notas AS ( ");
		sql.append("    SELECT nu.nota, cc.nome AS componente, mc.id_discente, t.id_turma_serie ");
		sql.append("    FROM ensino.nota_unidade nu ");
		sql.append("    JOIN ensino.matricula_componente mc ON mc.id_matricula_componente = nu.id_matricula_componente ");
		sql.append("    JOIN ensino.turma t ON t.id_turma = mc.id_turma ");
		sql.append("    JOIN ensino.componente_curricular cc ");
		sql.append("        ON cc.id_componente_curricular = mc.id_componente_curricular ");
		sql.append("        AND cc.id_componente_curricular <> " + ComponenteCurricular.ATIVIDADE_POLIVALENTE);
		sql.append("    WHERE nu.unidade = " + bimestreBusca);
		sql.append("       AND nu.ativo ");
		sql.append("       AND (nu.id_descricao_nota IN (4, 6, 21) OR nu.id_descricao_nota IS NULL) ");
		sql.append("       AND mc.ano = " + anoBusca);
		sql.append("       AND mc.id_situacao_matricula IN " + UFRNUtils.gerarStringIn(SituacaoMatriculaUtil.getSituacoesAtivas()) + " ");
		sql.append(" ), levantamento AS ( ");
		sql.append("    SELECT ");
		sql.append("       e.nome AS unidade, ");
		sql.append("       ee.denominacao AS etapa_Ensino, ");
		sql.append("       s.descricao AS serie, ");
		sql.append("       t.descricao AS turno, ");
		sql.append("       n.componente AS componente_Curricular, ");
		sql.append("       count(DISTINCT n.id_discente) FILTER (WHERE n.nota >= " + media + " ) AS total_alunos_acima_media, ");
		sql.append("       count(DISTINCT mes.id_matricula_discente_serie) AS total_alunos ");
		sql.append("    FROM escola.escola e ");
		sql.append("    JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola ");
		sql.append("    JOIN basico.serie s ON s.id_serie = ts.id_serie ");
		sql.append("    JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino ");
		sql.append("    JOIN ensino.turno t ON t.id_turno = ts.id_turno ");
		sql.append("    JOIN basico.matricula_estudante_serie mes ON COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie) = ts.id_turma_serie ");
		sql.append("    LEFT JOIN notas n ");
		sql.append("       ON n.id_discente = mes.id_estudante ");
		sql.append("       AND n.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie) ");
		sql.append("    WHERE ts.ano = " + anoBusca);
		sql.append("       AND ts.ativo ");
		sql.append("       AND ts.tipo_diario IN ");
		sql.append(UFRNUtils.gerarStringIn(TipoDiario.getTiposDiarioPorNota()));
		sql.append("       AND mes.id_situacao_matricula_serie IN " + UFRNUtils.gerarStringIn(SituacaoMatriculaSerieUtil.getSituacoesAtivas()));
		if (ValidatorUtil.isNotEmpty(escolaBusca.getId())) {
			sql.append("       AND e.id_escola = " + escolaBusca.getId());
		}
		sql.append("       AND (CASE WHEN ts.tipo_diario = " + TipoDiario.MULTISSERIADA.ordinal() + " THEN mes.id_turma_serie_multisseriado IS NOT NULL ELSE TRUE END)");
		sql.append("    GROUP BY e.nome, ee.denominacao, s.descricao, t.descricao, n.componente ");
		sql.append("    ORDER BY e.nome ");
		sql.append(" ) ");
		sql.append(" 	SELECT *,  ROUND((CAST(total_alunos_acima_media AS NUMERIC) * 100 / total_alunos), 2) AS percent_alunos_acima_media ");
		sql.append("    FROM levantamento ");