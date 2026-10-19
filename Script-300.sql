
select
	*
from
	matricula.solicitacao_transferencia st
join basico.matricula_estudante_serie mes on st.id_matricula_discente_serie_gerado = mes.id_matricula_discente_serie 
where  mes.id_turma_serie = 53543338
;

select * from basico.matricula_estudante_serie mes 
where  mes.id_matricula_discente_serie = 1328874;



17162331 matricula componente