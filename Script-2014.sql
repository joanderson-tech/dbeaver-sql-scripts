select *
from basico.matricula_estudante_serie
where id_estudante = 1446009;

-- Auto-generated SQL script #202603231044
UPDATE matricula.estudante_inscrito 	SET id_status=9	WHERE id_estudante_inscrito=84348214;


select *
from basico.matricula_estudante_serie
where id_estudante = 1444823;

select *
from comum.pessoa p
where p.nome_ascii ilike '%YOURRANA%';

select *
from matricula.estudante_inscrito ei
where ei.nome ilike '%YOURRANA%';

select *
from matricula.estudante_inscrito_processamento
where id_estudante_inscrito in(84348214, 84527141);

select *
from matricula.estudante_inscrito_opcao_escola eioe
where id_estudante_inscrito in(84348214, 84527141);

select *
from matricula.solicitacao_transferencia st
where st.id_matricula_discente_serie = 1642769;

select *
from matricula.tipo_ocupacao_vaga tov ;

select *
from matricula.listagem_processamento_renovacao_matricula lpr;

select *
from matricula.listagem_solicitacao_transferencia_processamento lstp;

select *
from matricula.listagem_processamento_matricula lpm;

select *
from matricula.estudante_inscrito_processamento eip
join matricula.listagem_processamento_matricula lpm on
lpm.id_listagem_processamento_matricula = eip.id_listagem_processamento_matricula
where eip.id_estudante_inscrito in(84348214, 84527141)
and eip.id_status not in(5, 8, 13);