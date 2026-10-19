begin;

rollback ;

select 'UPDATE ensino.matricula_componente SET id_discente = 974324 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	   COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (976393)
GROUP BY 
    mc.id_discente;	

UPDATE ensino.matricula_componente SET id_discente = 974324 WHERE id_matricula_componente IN (17036250, 17036253, 17036257, 17036251, 17036258, 17036255, 17036254, 17036252, 17036256, 17026718, 17026012, 17026013, 17026014, 17026015, 17026717, 17026719, 17026720, 17026721, 17026722, 17026723, 17026724, 17026725);

SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 974324 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
    COUNT(fa.id_frequencia) AS quantidade_ids
FROM 
    ensino.frequencia_aluno fa 
WHERE 
    fa.id_discente IN (976393)
GROUP BY 
    fa.id_discente;

UPDATE ensino.frequencia_aluno SET id_discente = 974324 WHERE id_frequencia IN (137574388, 137574482, 137574421, 137574435, 137574468, 137574515, 137574529, 137574543, 137574557, 137574591, 137167147, 137580068, 137580082, 137567686, 137567700, 137567728, 137567756, 137565677, 137565794, 137565808, 137565630, 137565892, 137565920, 137565948, 137565976, 137565532, 137565560, 137565546, 137565574, 137565602, 137565588, 137565616, 137565644, 137565710, 137565738, 137565724, 137565752, 137565850, 137565864, 137565878, 137565906, 137565766, 137565822, 137565836, 137565780, 137567081, 137567137, 137567151, 137565934, 137565962, 137565990, 137566004, 137567095, 137567109, 137567123, 137567165, 137567193, 137567207, 137567263, 137567053, 137567550, 137567564, 137567039, 137567067, 137567616, 137567644, 137567658, 137567179, 137567221, 137567235, 137567249, 137567277, 137567602, 137567714, 137567742, 137567798, 137567812, 137567630, 137567672, 137567770, 137567784, 137569180, 137569194, 137569432, 137569446, 137567826, 137567840, 137567854, 137569063, 137569091, 137569105, 137569000, 137569014, 137569383, 137569028, 137569077, 137569138, 137569166, 137569152, 137569306, 137569334, 137569348, 137569320, 137569397, 137569488, 137569460, 137569474, 137569502, 137574213, 137574254);

UPDATE basico.matricula_estudante_serie	SET id_estudante=974324 WHERE id_matricula_discente_serie in (1320590, 1320072);
update ensino.observacao_discente set id_discente = 974324 where id_observacao_discente = 522670900;
UPDATE basico.movimentacao_estudante SET id_discente=974324 WHERE id_movimentacao_estudante=68796;


DELETE FROM basico.estudante WHERE id_estudante=976393;
DELETE FROM public.discente WHERE id_discente=976393;
DELETE FROM comum.pessoa WHERE id_pessoa=749599;

commit;





-----


-- Auto-generated SQL script #202508201552
UPDATE basico.matricula_estudante_serie	SET id_situacao_matricula_serie=1 WHERE id_matricula_discente_serie=1320589;


