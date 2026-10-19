--Id_turma_componente
721742

select *
from ensino.frequencia_turma ft 
where ft.id_turma = 721742
and ft."data" = '2023-07-07';

-- id_registro de cadastro
6266239
106994
525818

--Id_frequencia da turma
525818

--select da turma
select *
from ensino.turma t 
where t.codigo = 'EDBINTB2C'
and t.ano = 2023
and id_turma =721742 ;

select *
from ensino.frequencia_aluno fa 
where  id_turma =721742

and fa."data" = '2023-07-07'
and id_registro_cadastro = 6266239

;

SELECT * FROM comum.pessoa x
WHERE x.nome = 'ALUSKA POMBO ALMEIDA DINIZ';


SELECT * FROM public.discente t
where t.id_pessoa = 51943538;


SELECT
    *
from basico.alteracao_matricula_serie ams 


select * from ensino.matricula_componente mc 
where mc.id_turma = 721742
and mc.id_discente = 1041505
;

SELECT * FROM public.discente x
WHERE x.matricula  = '202230025420';

--Id pessoa 
762240

begin;

rollback;









