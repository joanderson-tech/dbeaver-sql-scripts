WITH faltas AS ( SELECT fa.id_discente, ts.id_turma_serie, COALESCE(sum(CASE WHEN fa.abonada THEN fa.atual ELSE fa.frequencia END), 0) AS faltas
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON t.id_turma = fa.id_turma
AND t.ano = 2026
AND t.id_situacao_turma <> 4
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
AND ts.ativo
WHERE fa.frequencia > 0
AND fa.ativo
GROUP BY fa.id_discente, ts.id_turma_serie), periodo AS (SELECT max(periodo) AS periodo
FROM basico.turma_serie
WHERE ano = 2026
AND ativo) SELECT mes.ano_calendario, e.codigo_inep, ts.nome AS nome_turma,( CASE WHEN ee.periodicidade_etapa = 'ANUAL' THEN 0
WHEN ee.periodicidade_etapa = 'SEMESTRAL'
	AND ts.periodo = 1 THEN 1
	WHEN ee.periodicidade_etapa = 'SEMESTRAL'
	AND ts.periodo = 2 THEN 2 END ) AS periodo,( CASE WHEN trn.descricao ILIKE 'MATUTINO%' THEN 1
WHEN trn.descricao ILIKE 'VESPERTINO%' THEN 2
WHEN trn.descricao ILIKE 'NOTURNO%' THEN 3
WHEN trn.descricao ILIKE 'INTEGRAL%' THEN 4 END ) AS turno, sts.codigo AS idSerie,( CASE WHEN ee.id_modalidade <> 2
	AND ee.id_nivel_etapa = 51918782 THEN 1
	WHEN ee.id_modalidade <> 2
	AND ee.id_nivel_etapa IN (1, 2) THEN 2
	WHEN ee.id_modalidade <> 2
		AND ee.id_nivel_etapa = 3 THEN 3
		WHEN ee.id_modalidade = 2 THEN 4 END ) AS modalidade, d.matricula, to_char(COALESCE(mes.data_matricula_turma, mes.data_cadastro), 'YYYY-MM-DD') AS data_matricula,(SELECT f.faltas
FROM faltas f
WHERE f.id_discente = d.id_discente
AND f.id_turma_serie = ts.id_turma_serie) AS faltas,(mes.id_situacao_matricula_serie = 2) AS aprovado, p.cpf_cnpj, CAST(p.data_nascimento AS varchar) AS data_nascimento, p.nome,((SELECT count(*)
FROM comum.pessoa_necessidade_especial pne
WHERE pne.id_pessoa = p.id_pessoa) > 0) AS pessoa_com_ne,( CASE WHEN p.sexo = 'M' THEN 1
WHEN p.sexo = 'F' THEN 2
ELSE 3 END ) AS sexo, cc.nome AS disciplina, (t.id_situacao_turma = 3) AS turma_finalizada, FALSE AS multisseriada
FROM escola.escola e
JOIN comum.unidade u ON u.id_unidade = e.id_unidade_escola
JOIN basico.turma_serie ts ON ts.id_escola = e.id_escola
JOIN ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
JOIN basico.serie s ON s.id_serie = ts.id_serie
JOIN basico.mapeamento_series_tce_se mssts ON mssts.id_serie = ts.id_serie
JOIN basico.series_tce_se sts ON sts.id = mssts.id_serie_tce AND sts.ativo
JOIN basico.etapa_ensino ee ON ee.id_etapa_ensino = s.id_etapa_ensino
JOIN periodo pe ON (ts.periodo = pe.periodo 	OR ee.periodicidade_etapa = 'ANUAL')
JOIN ensino.turno trn ON trn.id_turno = ts.id_turno
JOIN basico.matricula_estudante_serie mes ON mes.id_turma_serie = ts.id_turma_serie --AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
JOIN basico.estudante est ON est.id_estudante = mes.id_estudante
JOIN discente d ON d.id_discente = est.id_estudante
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
/*JOIN ensino.horario_turma ht ON ht.id_turma = t.id_turma
JOIN ensino.horario h ON h.id_horario = ht.id_horario*/
JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
/*LEFT JOIN ensino.docente_turma dt ON dt.id_turma = t.id_turma
JOIN rh.servidor serv ON serv.id_servidor = dt.id_docente 
JOIN comum.pessoa p_prof ON p_prof.id_pessoa = serv.id_pessoa*/
WHERE u.ativo
AND ts.ativo
--AND ht.ativo
--AND dt.ativo
AND p.data_nascimento <= '2024-08-30'
AND t.id_situacao_turma <> 4
AND mes.ano_calendario = 2026
--AND COALESCE(mes.data_matricula_turma, mes.data_cadastro) <= CAST(date_trunc('month', CAST('2026-02-01' AS date)) + INTERVAL '1 month - 1 day' AS date)
GROUP BY mes.ano_calendario, e.codigo_inep, ee.periodicidade_etapa, ts.periodo, ts.nome, trn.descricao, sts.codigo, ee.id_modalidade, ee.id_nivel_etapa, d.matricula, mes.data_matricula_turma, mes.id_situacao_matricula_serie, p.cpf_cnpj, p.data_nascimento, p.nome, p.id_pessoa, cc.nome,  mes.data_cadastro, t.id_turma, d.id_discente, ts.id_turma_serie
ORDER BY mes.ano_calendario;



SELECT * FROM basico.turma_serie ts WHERE ts.ano = 2026
AND ativo;

EICRIMEIC2A
EICRIMEIC3A



SELECT CAST(p.cpf_cnpj AS varchar), string_agg(DISTINCT p.nome, ', ') AS nomes
FROM escola.escola e
JOIN comum.unidade u ON
u.id_unidade = e.id_unidade_escola
JOIN basico.turma_serie ts ON
ts.id_escola = e.id_escola
JOIN ensino.turma t ON
t.id_turma_serie = ts.id_turma_serie
JOIN basico.matricula_estudante_serie mes ON
mes.id_turma_serie = ts.id_turma_serie
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
JOIN basico.estudante est ON
est.id_estudante = mes.id_estudante
JOIN discente d ON
d.id_discente = est.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE u.ativo
AND ts.ativo
AND p.data_nascimento <= '2024-08-30'
AND t.id_situacao_turma <> 4
AND mes.ano_calendario = 2026
AND COALESCE(mes.data_matricula_turma, mes.data_cadastro) <= CAST(date_trunc('month', CAST('2026-01-01' AS date)) + INTERVAL '1 month - 1 day' AS date)
AND p.cpf_cnpj IS NOT NULL
GROUP BY p.cpf_cnpj
HAVING count(DISTINCT p.nome) > 1


with faltas as (    select fa.id_discente,         ts.id_turma_serie,         coalesce(sum(case when fa.abonada then fa.atual else fa.frequencia end), 0) AS faltas     from ensino.frequencia_aluno fa     join ensino.turma t on t.id_turma = fa.id_turma        and t.ano = 2026       and t.id_situacao_turma <> 4    join basico.turma_serie ts on ts.id_turma_serie = t.id_turma_serie        and ts.ativo     where fa.frequencia > 0        and fa.ativo     group by fa.id_discente, ts.id_turma_serie),  periodo as (select max(periodo) as periodo from basico.turma_serie where ano = 2026 and ativo)  select   e.codigo_inep,   ts.nome as nome_turma,   (     case       when ee.periodicidade_etapa = 'ANUAL' then 0       when ee.periodicidade_etapa = 'SEMESTRAL' and ts.periodo = 1 then 1       when ee.periodicidade_etapa = 'SEMESTRAL' and ts.periodo = 2 then 2     end   ) as periodo,   (     case       when trn.descricao ilike 'MATUTINO%' then 1       when trn.descricao ilike 'VESPERTINO%' then 2       when trn.descricao ilike 'NOTURNO%' then 3       when trn.descricao ilike 'INTEGRAL%' then 4     end   ) as turno,   sts.codigo as idSerie,   (     case       when ee.id_modalidade <> 2 and ee.id_nivel_etapa = 51918782 then 1       when ee.id_modalidade <> 2 and ee.id_nivel_etapa in (1, 2) then 2       when ee.id_modalidade <> 2 and ee.id_nivel_etapa = 3 then 3       when ee.id_modalidade = 2 then 4     end   ) as modalidade,   d.matricula,   to_char(coalesce(mes.data_matricula_turma, mes.data_cadastro), 'YYYY-MM-DD') as data_matricula,   (SELECT f.faltas FROM faltas f WHERE f.id_discente = d.id_discente AND f.id_turma_serie = ts.id_turma_serie) as faltas,   (mes.id_situacao_matricula_serie = 2) as aprovado,   p.cpf_cnpj,   cast(p.data_nascimento as varchar) as data_nascimento,   p.nome,   ((select count(*) from comum.pessoa_necessidade_especial pne where pne.id_pessoa = p.id_pessoa) > 0) as pessoa_com_ne,   (     case       when p.sexo = 'M' then 1       when p.sexo = 'F' then 2       else 3     end   ) as sexo,   cc.nome as disciplina,   (t.id_situacao_turma = 3) as turma_finalizada,   false as multisseriada  from escola.escola e  join comum.unidade u on u.id_unidade = e.id_unidade_escola  join basico.turma_serie ts on ts.id_escola = e.id_escola  join ensino.turma t on t.id_turma_serie = ts.id_turma_serie  join basico.serie s on s.id_serie = ts.id_serie  join basico.mapeamento_series_tce_se mssts on mssts.id_serie = ts.id_serie  join basico.series_tce_se sts on sts.id = mssts.id_serie_tce     and sts.ativo  join basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino  join periodo pe on (ts.periodo = pe.periodo or ee.periodicidade_etapa = 'ANUAL')  join ensino.turno trn on trn.id_turno = ts.id_turno  join basico.matricula_estudante_serie mes on mes.id_turma_serie = ts.id_turma_serie and mes.id_situacao_matricula_serie in  ( 2,3,1,7,8,10,-1 ) join basico.estudante est on est.id_estudante = mes.id_estudante  join discente d on d.id_discente = est.id_estudante  join comum.pessoa p on p.id_pessoa = d.id_pessoa  join ensino.componente_curricular cc on cc.id_componente_curricular = t.id_disciplina  where u.ativo  and ts.ativo  and p.data_nascimento <= '2024-08-30'  and t.id_situacao_turma <> 4 and mes.ano_calendario = 2026 group by e.codigo_inep, ee.periodicidade_etapa, ts.periodo, ts.nome, trn.descricao, sts.codigo, ee.id_modalidade, ee.id_nivel_etapa,  d.matricula, mes.data_matricula_turma, mes.id_situacao_matricula_serie, p.cpf_cnpj, p.data_nascimento, p.nome, p.id_pessoa,  cc.nome,  mes.data_cadastro, t.id_turma, d.id_discente, ts.id_turma_serie  order by e.codigo_inep, periodo, ts.nome, turno, d.matricula;
