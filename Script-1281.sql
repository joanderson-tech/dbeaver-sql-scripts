SELECT *
FROM basico.curriculo_basico cb
WHERE cb.id_curriculo_basico = 51883942;

SELECT *
FROM basico.curriculo_basico_componente cbc WHERE cbc.id_curriculo_basico = 51883942;


--SOLUÇÃO
UPDATE basico.curriculo_basico SET permite_multiplos_professores_polivalente = TRUE WHERE id_curriculo_basico = 51883942;

UPDATE basico.curriculo_basico_componente SET permite_multiplos_professores = TRUE WHERE id_curriculo_basico_componente IN (51883943, 51883944, 51883945, 51883946, 51883947, 51884818);

UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto = TRUE WHERE id_curriculo_basico_componente IN (51883943, 51883944, 51883945, 51883946, 51883947);

UPDATE ensino.turma SET permite_multiplos_professores=true	WHERE id_turma IN (685330, 682906, 682907, 682908, 682909, 682910, 686446, 686447, 686448, 686449, 686450, 686451, 686452, 686468, 686469, 686470, 686471, 686472, 686473, 686474, 686544, 686545, 686546, 686547, 686548, 686549, 686550, 685331, 686516, 686517, 686513, 686514, 686515, 686518, 686519, 686481, 686482, 686483, 686484, 686485, 686486, 686487);


--BACKUP
UPDATE basico.curriculo_basico SET permite_multiplos_professores_polivalente = FALSE WHERE id_curriculo_basico = 51883942;

UPDATE basico.curriculo_basico_componente SET permite_multiplos_professores = FALSE WHERE id_curriculo_basico_componente IN (51883943, 51883944, 51883945, 51883946, 51883947, 51884818);

UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto = FALSE WHERE id_curriculo_basico_componente IN (51883943, 51883944, 51883945, 51883946, 51883947);

UPDATE ensino.turma SET permite_multiplos_professores=true	FALSE id_turma IN (685330, 682906, 682907, 682908, 682909, 682910, 686446, 686447, 686448, 686449, 686450, 686451, 686452, 686468, 686469, 686470, 686471, 686472, 686473, 686474, 686544, 686545, 686546, 686547, 686548, 686549, 686550, 685331, 686516, 686517, 686513, 686514, 686515, 686518, 686519, 686481, 686482, 686483, 686484, 686485, 686486, 686487);




FOI ALTERADA A ESTRUTURA DO berçário II integral - EICIB2 PARA PERMITIR MULTIPLOS PROFESSORES E ADJUNTO COM FOI ALTERADO CURRICULO BASICO NO COMPONENTE DO CURRIRICULO E NAS TURMAS FORAM APLICADAS ESSA CONFIGURAÇÃO.

SELECT t.id_turma
FROM ensino.turma t
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE ts.id_curriculo_medio = 51883942
AND T.permite_multiplos_professores = FALSE;

UPDATE ensino.turma SET permite_multiplos_professores=true	WHERE id_turma IN (685330, 682906, 682907, 682908, 682909, 682910, 686446, 686447, 686448, 686449, 686450, 686451, 686452, 686468, 686469, 686470, 686471, 686472, 686473, 686474, 686544, 686545, 686546, 686547, 686548, 686549, 686550, 685331, 686516, 686517, 686513, 686514, 686515, 686518, 686519, 686481, 686482, 686483, 686484, 686485, 686486, 686487);

SELECT string_agg(t.id_turma:: varchar , ', ')
FROM ensino.turma t
JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
WHERE ts.id_curriculo_medio = 51883942
AND t.permite_multiplos_professores = FALSE;

ROLLBACK;

