SELECT * FROM basico.serie s;

SELECT * FROM matricula.vaga_serie vs ;

SELECT ee.* FROM basico.etapa_ensino AS ee;


SELECT meb.* FROM basico.modalidade_ensino_basico AS meb;

SELECT * FROM basico.nivel_etapa_ensino ;

select distinct s.*
from basico.serie s
--join basico.turma_serie ts on ts.id_serie = s.id_serie
join matricula.vaga_serie vs on vs.id_serie  = s.id_serie
join basico.etapa_ensino ee on s.id_etapa_ensino = ee.id_etapa_ensino
join basico.modalidade_ensino_basico meb on meb.id_modalidade_ensino_basico = ee.id_modalidade
where s.id_etapa_ensino = 4;


INSERT INTO basico.nivel_etapa_ensino
(id_nivel_etapa_ensino, denominacao, sigla, ensino_infantil, id_unidade, data_atualizacao, id_registro_atualizacao, ativo)
VALUES(nextval('public.hibernate_sequence'), 'ENSINO FUNDAMENTAL - ANOS FINAIS - QA', 'EFAF', false, NULL, NULL, NULL, true);


-- Auto-generated SQL script #202511121711
UPDATE basico.serie
	SET id_etapa_ensino=4
	WHERE id_serie=1005224;
