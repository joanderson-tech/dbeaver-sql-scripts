select distinct ht.*
from ensino.docente_turma dt
inner join ensino.turma t on
dt.id_turma = t.id_turma
inner join basico.turma_serie ts on
t.id_turma_serie = ts.id_turma_serie
inner join escola.escola e on
ts.id_escola = e.id_escola
inner join ensino.docente_turma dt1 on
t.id_turma = dt1.id_turma
left outer join rh.servidor s on
dt1.id_docente = s.id_servidor
left outer join comum.pessoa p on
s.id_pessoa = p.id_pessoa
left outer join ensino.docente_externo de on
dt1.id_docente_externo = de.id_docente_externo
left outer join comum.pessoa p1 on
de.id_pessoa = p1.id_pessoa
inner join ensino.componente_curricular cc on
t.id_disciplina = cc.id_componente_curricular
inner join ensino.situacao_turma st on
t.id_situacao_turma = st.id_situacao_turma
left outer join ensino.horario_turma ht on
t.id_turma = ht.id_turma
left outer join ensino.Horario h on
ht.id_horario = h.id_horario
left outer join ensino.horario_turma horarios14_ on
t.id_turma = horarios14_.id_turma
left outer join ensino.Horario horario15_ on
horarios14_.id_horario = horario15_.id_horario
inner join rh.servidor servidor4_ on
dt.id_docente = servidor4_.id_servidor
where t.ano = 2026
and servidor4_.id_servidor = 300
and (st.id_situacao_turma in (1 , 2 , 3 , 7))
and dt.ativo = true
and dt.data_fim> '2026-06-17'
and ht.ativo = true
and ts.id_turma_serie in (51901662, 51901824);
order by t.id_turma, ht.id_horario_turma, h.id_horario, dt1.id_docente_turma, s.id_servidor, de.id_docente_externo, horarios14_.id_horario_turma, horario15_.id_horario

682551
-- MARIA AMÉLIA LOPES DE LIMA, ANDERSON SOARES DA SILVA


select distinct t.*
from ensino.docente_turma dt
join ensino.turma t on
t.id_turma = dt.id_turma
join basico.turma_serie ts on
ts.id_turma_serie = t.id_turma_serie
join basico.curriculo_basico_componente cbc on
cbc.id_curriculo_basico = ts.id_curriculo_medio
where dt.id_turma = 682551;

select *
from ensino.horario_docente hd
where hd.id_docente_turma in (51914290, 51914291);

select *
from ensino.horario_turma ht
where ht.id_turma = 
682551;

select *
from ensino.docente_suplementar_autorizada dsa ;

select *
from ensino.pagamento_ch_suplementar pcs 



-- Auto-generated SQL script #202606171148
UPDATE ensino.horario_docente
	SET dia_semana='3'
	WHERE id_horario_docente=1358;
UPDATE ensino.horario_docente
	SET dia_semana='3'
	WHERE id_horario_docente=1359;



379

682539

221



select ht.*
from ensino.horario_turma ht
join ensino.horario h on
(h.id_horario = ht.id_horario
	and h.ativo = trueValue())
join ensino.docente_turma dt on
(ht.id_turma = dt.id_turma
	and ht.ativo = trueValue())
join ensino.turma t on
( t.id_turma = dt.id_turma
	and dt.ativo = trueValue()
	and dt.data_fim > '2026-06-17' )
join basico.turma_serie ts on
(t.id_turma_serie = ts.id_turma_serie)
where ts.id_turma_serie = 51901662
and t.id_situacao_turma <> 4
and t.periodo = 1 ;

select horariodoc0_.id_horario_docente as id1_617_0_, docentetur1_.id_docente_turma as id1_600_1_, horariodoc0_.ativo as ativo617_0_, horariodoc0_.data_alteracao as data3_617_0_, horariodoc0_.data_cadastro as data4_617_0_, horariodoc0_.dia_semana as dia5_617_0_, horariodoc0_.id_docente_turma as id9_617_0_, horariodoc0_.id_horario as id8_617_0_, horariodoc0_.id_registro_alteracao as id6_617_0_, horariodoc0_.id_registro_cadastro as id7_617_0_, docentetur1_.id_afastamento as id25_600_1_, docentetur1_.id_atividade_ape as id20_600_1_, docentetur1_.ativo as ativo600_1_, docentetur1_.auxiliar as auxiliar600_1_, docentetur1_.ch_dedicada_periodo as ch4_600_1_, docentetur1_.ch_alternativa as ch5_600_1_, docentetur1_.codigo_rh as codigo6_600_1_, docentetur1_.complementar as compleme7_600_1_, docentetur1_.data_alteracao as data8_600_1_, docentetur1_.data_cadastro as data9_600_1_, docentetur1_.data_fim as data10_600_1_, docentetur1_.data_inicio as data11_600_1_, docentetur1_.id_docente as id18_600_1_, docentetur1_.id_docente_externo as id26_600_1_, docentetur1_.id_encaminhamento_candidato_escola as id19_600_1_, docentetur1_.finalizada as finalizada600_1_, docentetur1_.justificativa_alocacao as justifi13_600_1_, docentetur1_.justificativa_cancelamento as justifi14_600_1_, docentetur1_.justificativa_ch_alternativa as justifi15_600_1_, docentetur1_.id_registro_atualizacao as id24_600_1_, docentetur1_.id_registro_cadastro as id22_600_1_, docentetur1_.regra_excecao_validacao_regras_alocacao_qualificacao as regra16_600_1_, docentetur1_.suplementar as supleme17_600_1_, docentetur1_.id_turma as id23_600_1_, docentetur1_.id_turma_auxiliar as id21_600_1_
from ensino.horario_docente horariodoc0_
inner join ensino.docente_turma docentetur1_ on
horariodoc0_.id_docente_turma = docentetur1_.id_docente_turma
where docentetur1_.id_docente = 300
and horariodoc0_.ativo = true
and docentetur1_.ativo = true
and docentetur1_.finalizada = false
and docentetur1_.data_fim>now()


select horariodoc0_.id_horario_docente as id1_617_, horariodoc0_.ativo as ativo617_, horariodoc0_.data_alteracao as data3_617_, horariodoc0_.data_cadastro as data4_617_, horariodoc0_.dia_semana as dia5_617_, horariodoc0_.id_docente_turma as id9_617_, horariodoc0_.id_horario as id8_617_, horariodoc0_.id_registro_alteracao as id6_617_, horariodoc0_.id_registro_cadastro as id7_617_
from ensino.horario_docente horariodoc0_
inner join ensino.docente_turma docentetur1_ on
horariodoc0_.id_docente_turma = docentetur1_.id_docente_turma
where docentetur1_.id_docente_turma =51914290
and horariodoc0_.ativo = true
and docentetur1_.ativo = true
