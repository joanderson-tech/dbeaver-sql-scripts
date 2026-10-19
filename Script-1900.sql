SELECT *
FROM ensino.solicitacao_avanco_estudo_componente;

SELECT DISTINCT vs.id_vaga_serie, vs.periodo, s.id_serie, s.descricao AS serie, ee.id_etapa_ensino, ee.denominacao AS etapa_ensino, t.id_turno, t.descricao AS turno
FROM matricula.vaga_serie vs
JOIN basico.serie s
	USING (id_serie)
JOIN basico.etapa_ensino ee
	USING (id_etapa_ensino)
JOIN ensino.turno t
	USING (id_turno)
WHERE vs.ano_letivo = ?
AND vs.id_escola = ?
AND vs.vagas_validadas > 0
AND vs.removida = FALSE
AND vs.id_serie IN ( SELECT st.id_serie_destino
FROM basico.serie_transicao st
WHERE st.id_serie_origem = ?
UNION SELECT se.id_serie_equivalente
FROM basico.serie_transicao st
JOIN basico.serie_equivalencia se ON
(se.id_serie = st.id_serie_destino
OR se.id_serie_equivalente = st.id_serie_destino)
WHERE st.id_serie_origem = ? )