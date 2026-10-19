select * 
from escola.escola e 
where e.nome = 'EMEIF E EJA JAIME LACET';

SELECT e.id_estudante
FROM basico.estudante e
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = e.id_estudante
JOIN basico.curriculo_basico cb ON cb.id_curriculo_basico = mes.id_curriculo_medio
join escola.escola e2 on e2.id_unidade_escola = cb.id_unidade 


202230018702	AMANDA VITÓRIA SILVA DOS SANTOS	EMEIF E EJA JAIME LACET	Não Informado		TRANSFERÊNCIA EXTERNA
202352795456	AGATHA YOHANNA PEREIRA COSTA	MULTI - 2º ANO, 3º ANO	TARDE	MTITA23A	MATRICULADO	Selecionar Estudante