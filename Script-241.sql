SELECT  d.id_discente, d.matricula, d.status, d.nivel, d.tipo, p.nome as nome_discente, d.ano_ingresso, d.periodo_ingresso, esc.id_escola, esc.nome as nome_escola, mun_esc.nome as nome_mun_escola,  mee.id_matricula_discente_serie as id_matricula_estudante_serie, s.id_serie, s.descricao as serie_nome, etapa.id_etapa_ensino as id_etapa, etapa.denominacao as etapa_nome, mee.id_situacao_matricula_serie, sms.descricao as situacaoMatricula, t.descricao as turnoDescricao, ts.nome as nomeTurma, est.participa_bolsa_familia as participaBolsaFamilia, cb.possui_parte_diversificada 
from discente d
inner join comum.pessoa p on
(p.id_pessoa = d.id_pessoa)
inner join basico.estudante est on
(est.id_estudante = d.id_discente)
LEFT JOIN basico.matricula_estudante_serie mee 
    ON mee.id_estudante = est.id_estudante
    AND mee.data_cadastro  = (
        SELECT MAX(mee2.data_cadastro)
        FROM basico.matricula_estudante_serie mee2
        WHERE mee2.id_estudante = est.id_estudante
    )
left join basico.curriculo_basico cb on
cb.id_curriculo_basico = mee.id_curriculo_medio
left join basico.turma_serie ts on
(mee.id_turma_serie = ts.id_turma_serie)
left join ensino.turno t on
(mee.id_turno = t.id_turno)
left join basico. situacao_matricula_serie sms
	using(id_situacao_matricula_serie)
left join escola.escola_etapa_ensino_serie esc_serie on
(esc_serie.id_escola_etapa_ensino_serie = mee.id_serie_escola)
left join escola.escola esc on
(esc.id_escola = esc_serie.id_escola)
left join escola.configuracao_escola ce on
(esc.id_escola = ce.id_Escola)
left join comum.municipio as mun_esc on
(mun_esc.id_municipio = esc.id_municipio)
left join basico.serie s on
(s.id_serie = esc_serie.id_serie)
left join basico.grupo_serie gs on
(gs.id_serie = s.id_serie)
left join basico.etapa_ensino etapa on
(etapa.id_etapa_ensino = s.id_etapa_ensino)
where
1 = 1
and mee.ano_calendario = '2024'
and d.nivel = 'B'
and ( upper(p.nome) like '%ANA JULIA MENDES DA SILVA%'
	or upper(p.nome_ascii) like '%ANA JULIA MENDES DA SILVA%')
and sms.id_situacao_matricula_serie in ( 1, 2, 3,-1, 8, 5, 4, 7, 10, 6, 9, 11 )
order by
mun_esc.nome,
esc.nome,
p.nome;


if (anoEscolar != null && !anoEscolar.trim().isEmpty()) {
   LEFT JOIN basico.matricula_estudante_serie mee 
    ON mee.id_estudante = est.id_estudante
    AND mee.data_cadastro  = (
        SELECT MAX(mee2.data_cadastro)
        FROM basico.matricula_estudante_serie mee2
        WHERE mee2.id_estudante = est.id_estudante
    )
} else {
    "	left join basico.matricula_estudante_serie mee on (mee.id_estudante = est.id_estudante) "
}



SELECT mee.*, 
           ROW_NUMBER() OVER (PARTITION BY mee.id_estudante ORDER BY mee.data_atualizacao DESC) AS rn
    FROM basico.matricula_estudante_serie mee
    where id_estudante = 1339097;
   
   SELECT mee.id_matricula_discente_serie, 
           ROW_NUMBER() OVER (PARTITION BY mee.id_estudante ORDER BY mee.data_atualizacao DESC) AS rn
    FROM basico.matricula_estudante_serie mee
    where id_estudante = 1339097;
   
   WITH cte_matricula AS (
    SELECT mee.id_matricula_discente_serie, 
           ROW_NUMBER() OVER (PARTITION BY mee.id_estudante ORDER BY mee.data_atualizacao DESC) AS rn
    FROM basico.matricula_estudante_serie mee
)
SELECT d.id_discente, d.matricula, d.status, d.nivel, d.tipo, p.nome as nome_discente, 
       d.ano_ingresso, d.periodo_ingresso, esc.id_escola, esc.nome as nome_escola, 
       mun_esc.nome as nome_mun_escola, cte_matricula.id_matricula_discente_serie as id_matricula_estudante_serie, 
       s.id_serie, s.descricao as serie_nome, etapa.id_etapa_ensino as id_etapa, 
       etapa.denominacao as etapa_nome, mee.id_situacao_matricula_serie, 
       sms.descricao as situacaoMatricula, t.descricao as turnoDescricao, 
       ts.nome as nomeTurma, est.participa_bolsa_familia as participaBolsaFamilia, 
       cb.possui_parte_diversificada
FROM discente d
INNER JOIN comum.pessoa p ON (p.id_pessoa = d.id_pessoa)
INNER JOIN basico.estudante est ON (est.id_estudante = d.id_discente)
LEFT JOIN cte_matricula ON (cte_matricula.id_matricula_discente_serie = mee.id_matricula_discente_serie AND cte_matricula.rn = 1)
LEFT JOIN basico.matricula_estudante_serie mee ON (mee.id_estudante = est.id_estudante AND mee.data_atualizacao = (SELECT MAX(data_atualizacao) FROM basico.matricula_estudante_serie WHERE id_estudante = est.id_estudante))
LEFT JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = mee.id_curriculo_medio
LEFT JOIN basico.turma_serie ts ON (mee.id_turma_serie = ts.id_turma_serie)
LEFT JOIN ensino.turno t ON (mee.id_turno = t.id_turno)
LEFT JOIN basico.situacao_matricula_serie sms USING(id_situacao_matricula_serie)
LEFT JOIN escola.escola_etapa_ensino_serie esc_serie ON (esc_serie.id_escola_etapa_ensino_serie = mee.id_serie_escola)
LEFT JOIN escola.escola esc ON (esc.id_escola = esc_serie.id_escola)
LEFT JOIN escola.configuracao_escola ce ON (esc.id_escola = ce.id_Escola)
LEFT JOIN comum.municipio as mun_esc ON (mun_esc.id_municipio = esc.id_municipio)
LEFT JOIN basico.serie s ON (s.id_serie = esc_serie.id_serie)
LEFT JOIN basico.grupo_serie gs ON (gs.id_serie = s.id_serie)
LEFT JOIN basico.etapa_ensino etapa ON (etapa.id_etapa_ensino = s.id_etapa_ensino)
WHERE
    1 = 1
    AND mee.ano_calendario = '2024'
    AND d.nivel = 'B'
    AND (UPPER(p.nome) LIKE '%ANA JULIA MENDES DA SILVA%' 
         OR UPPER(p.nome_ascii) LIKE '%ANA JULIA MENDES DA SILVA%')
    AND sms.id_situacao_matricula_serie IN (1, 2, 3, -1, 8, 5, 4, 7, 10, 6, 9, 11)
ORDER BY
    mun_esc.nome,
    esc.nome,
    p.nome;


