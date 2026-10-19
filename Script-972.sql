/*Nome do Aluno
INEP
Escola
Etapa de Ensino
Série
Turno
Turma
Data Nascimento
Nome da Mãe*/

select
	distinct  
    p.nome AS "NOME ALUNO",
    p.codigo_inep AS "INEP",
    e2.nome AS "ESCOLA",
    ee.denominacao AS "ETAPA DE ENSINO",
    s.descricao AS "SÉRIE",
    t.descricao AS "TURNO",
    tt.codigo AS "TURMA",
    TO_CHAR(p.data_nascimento, 'DD/MM/YYYY') AS "DATA DE NASCIMENTO",
    p.nome_mae AS "NOME MÃE" 
from basico.matricula_estudante_serie mes
join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie
join ensino.turma tt on tt.id_turma_serie = ts.id_turma_serie
join escola.escola e2 on e2.id_escola = ts.id_escola
join basico.serie s on s.id_serie = ts.id_serie
join basico.curriculo_basico cb on cb.id_serie = s.id_serie
join basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino
join ensino.turno t on t.id_turno = ts.id_turno
join public.discente d on d.id_discente = mes.id_estudante
join comum.pessoa p on p.id_pessoa = d.id_pessoa
where mes.ano_calendario = 2025
and  mes.id_situacao_matricula_serie = 1
and cb.ativo 
and cb.multisseriado = false
order by e2.nome, p.nome ;

select p.codigo_inep, P.possui_laudo  from comum.pessoa p where p.nome ilike 'ISIS SIQUEIRA DA SILVA';

select * from basico.curriculo_basico ;
select * from basico.etapa_ensino ee ;

select * from basico.serie;
select * from basico.turma_serie ts;