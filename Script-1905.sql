BEGIN;

-- Solução
CREATE TEMP TABLE alterar_turmas AS
SELECT t.id_turma
FROM ensino.turma t
JOIN basico.turma_serie ts 
    ON
ts.id_turma_serie = t.id_turma_serie
WHERE ts.id_curriculo_medio IN 
(51896209, 51896220, 51878013, 51869719, 51869717, 51896227, 51869718, 1012879);

UPDATE ensino.turma
SET
permite_multiplos_professores = TRUE
WHERE id_turma IN (SELECT id_turma
FROM alterar_turmas);

UPDATE basico.curriculo_basico
SET
permite_multiplos_professores_polivalente = TRUE
WHERE id_curriculo_basico IN (1012879, 51896209, 51896220, 51878013, 51869719, 51869717, 51869718, 51896227);

UPDATE basico.curriculo_basico_componente
SET
permite_multiplos_professores = TRUE
WHERE id_curriculo_basico_componente IN (51869721, 51869723, 51869724, 51869720, 51869722, 51900914, 51900911, 51900912, 51869730, 51869731, 51869732, 51869733, 51869734, 51900913, 51900910, 51896210, 51896211, 51896212, 51896213, 51896214, 51896215, 51896221, 51896222, 51896223, 51896224, 51896225, 51896226, 51896228, 51896229, 51896230, 51896231, 51896232, 51896233, 51878018, 51878015, 51878014, 51878017, 51878016, 51869726, 51869728, 51869729, 51869725, 51869727);

-- Backup
SELECT 'UPDATE ensino.turma	SET permite_multiplos_professores=false WHERE id_turma in (' || string_agg(id_turma::text, ', ') || ');'
FROM alterar_turmas;

COMMIT;