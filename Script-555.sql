select 'UPDATE ensino.matricula_componente SET id_discente = 979397 WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS Solucao,
	   'UPDATE ensino.matricula_componente SET id_discente = '|| mc.id_discente || ' WHERE id_matricula_componente IN (' || STRING_AGG(mc.id_matricula_componente::text, ', ') || ');' AS backup,
	   COUNT(mc.id_matricula_componente) AS quantidade_ids
from ensino.matricula_componente mc 
where mc.id_discente IN (983861)
GROUP BY 
    mc.id_discente;	
   
-- 03 FREQUENCIA

SELECT 
    'UPDATE ensino.frequencia_aluno SET id_discente = 979397 WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS script,
    'UPDATE ensino.frequencia_aluno SET id_discente = ' || fa.id_discente || ' WHERE id_frequencia IN (' || STRING_AGG(fa.id_frequencia::text, ', ') || ');' AS backup,
    COUNT(fa.id_frequencia) AS quantidade_ids
FROM 
    ensino.frequencia_aluno fa 
WHERE 
    fa.id_discente IN (983861)
GROUP BY 
    fa.id_discente;	


Erro SQL [23505]: ERROR: duplicate key value violates unique constraint "idx_unique_pessoa_necessidade_especial"
  Detalhe: Key (id_pessoa, id_necessidade_especial)=(752851, 9) already exists.

  



DELETE FROM comum.pessoa_necessidade_especial WHERE id_pessoa_necessidade_especial=54437555;

INSERT INTO comum.pessoa_necessidade_especial (id_pessoa_necessidade_especial, observacao, id_necessidade_especial, id_pessoa, id_pessoa_transferencia, codmergcomperve) VALUES(54437555, NULL, 9, 757976, NULL, NULL);