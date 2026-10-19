SELECT DISTINCT *, CASE WHEN convocado = TRUE
OR convocacao_nao_efetivada = TRUE THEN NULL
ELSE ROW_NUMBER() OVER (PARTITION BY nome_escola, descricao
ORDER BY CASE WHEN convocado
OR convocacao_nao_efetivada = TRUE THEN 1
ELSE 0 END, nome_escola, descricao, sq.possui_matricula_rede DESC, nee DESC, possui_irmao DESC, data_cadastro_original ASC) END AS ordem
FROM( SELECT DISTINCT ei.id_estudante_inscrito, ei.numero_inscricao, ei.nome AS nome_estudante, lpad(CAST(ei.cpf AS varchar), 11, '0') AS cpf, to_char(ei.data_nascimento, 'DD/MM/YYYY') AS data_nascimento, ei.nome_mae AS filiacao_1, ei.nome_pai AS filiacao_2, ei.logradouro, ei.numero_endereco, COALESCE(NULLIF(ei.bairro, ''), 'Não Informado') bairro, ei.cep, ei.nome_responsavel, ei.telefone_contato, ei.email, e.id_escola, e.nome AS nome_escola, ee.id_etapa_ensino, ee.denominacao, s.id_serie, s.descricao, t.descricao turno, to_char(ei."data", 'DD/MM/YYYY HH24:MI:SS') AS data_hora, EXISTS ( SELECT 1
FROM basico.matricula_estudante_serie mes
JOIN public.discente d ON
d.id_discente = mes.id_estudante
JOIN comum.pessoa p ON
p.id_pessoa = d.id_pessoa
WHERE mes.ano_calendario = cm.ano
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
AND ( ( p.cpf_cnpj IS NOT NULL
	AND ei.cpf IS NOT NULL
	AND p.cpf_cnpj = ei.cpf )
OR ( trim(upper(retira_acentuacao(p.nome))) = ei.nome
	AND trim(upper(retira_acentuacao(p.nome_mae))) = ei.nome_mae
		AND p.data_nascimento = ei.data_nascimento ) ) ) AS possui_matricula_rede, ei.convocado, EXISTS ( SELECT 1
FROM matricula.historico_convocacao_cadastro_reserva hccr
WHERE hccr.tipo_convocacao = 2
AND hccr.id_estudante_inscrito = ei.id_estudante_inscrito
AND hccr.ativo = TRUE ) AS convocacao_nao_efetivada, EXISTS ( SELECT 1
FROM matricula.estudante_inscrito_necessidade_especial eine
WHERE eine.id_estudante_inscrito = ei.id_estudante_inscrito) AS nee, eioe.possui_irmao, EXISTS (SELECT 1
FROM escola.bairro_escola be
WHERE be.id_bairro_escola = e.id_bairro_escola
AND lower(unaccent(REPLACE(be.denominacao, ' ', ''))) = lower(unaccent(REPLACE(ei.bairro, ' ', ''))) ) is_bairro_escola, CASE WHEN ei.bairro IS NULL
OR ei.bairro = '' THEN 1
ELSE 0 END AS ordem_bairro, ei."data" AS data_cadastro_original
FROM matricula.calendario_matricula cm
JOIN matricula.estudante_inscrito ei ON
ei.id_calendario_matricula = cm.id_calendario_matricula
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
eioe.id_estudante_inscrito = ei.id_estudante_inscrito
JOIN escola.escola e ON
e.id_escola = eioe.id_escola
JOIN matricula.vaga_serie vs ON
vs.id_vaga_serie = eioe.id_vaga_serie
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN ensino.turno t ON
t.id_turno = vs.id_turno
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
WHERE ei.id_status <> 5
AND ei.estudante_cadastro_reserva
--aND ei.id_estudante_inscrito IN (51903164, 51906674, 51907162, 51903161)
AND cm.ano = 2026
AND e.id_escola = 51877856 ) AS sq
WHERE 1 = 1
ORDER BY nome_escola , descricao , sq.possui_matricula_rede DESC, nee DESC, possui_irmao DESC, data_cadastro_original ASC;



SELECT * FROM matricula.calendario_matricula cm ;



