SELECT mun.id_municipio, dired.id_unidade, dired.nome AS dired, COUNT(DISTINCT id_estudante) AS total_estudantes, COUNT(DISTINCT e.id_escola) AS total_escolas
FROM basico.matricula_estudante_serie mes
JOIN escola.escola_etapa_ensino_serie eees ON mes.id_serie_escola = eees.id_escola_etapa_ensino_serie 
JOIN escola.escola e ON e.id_escola = eees.id_escola
JOIN comum.municipio mun ON e.id_municipio = mun.id_municipio
JOIN comum.unidade dired ON dired.id_unidade = e.id_regional_ensino
JOIN basico.serie s ON eees.id_serie = s.id_serie
JOIN basico.etapa_ensino es ON es.id_etapa_ensino = s.id_etapa_ensino
WHERE ano_calendario = 2023
AND ( (mes.periodo = 1 AND es.periodicidade_etapa = 'SEMESTRAL') OR (es.periodicidade_etapa = 'ANUAL') )
GROUP BY mun.id_municipio, dired.id_unidade, dired.nome
ORDER BY dired.id_unidade, dired.nome;


select * from basico.calendario_escolar ce ;
select * from basico.etapa_ensino ee ; 

SELECT 
    mes.num_chamada, 
    p.id_pessoa, 
    p.nome AS aluno, 
    CASE 
        WHEN LENGTH(cc.nome) < 19 THEN cc.nome 
        ELSE cc.sigla 
    END AS nome, 
    nu.nota, 
    nu.unidade, 
    mod.denominacao, 
    esc.nome AS escola, 
    ee.denominacao AS etapa, 
    se.descricao AS serie, 
    tn.descricao AS turno, 
    cc.id_componente_curricular, 
    t.grupo, 
    t.id_turma, 
    se.tipo_diario AS diario, 
    mc.media_anual, 
    mc.recuperacao, 
    mc.media_final, 
    mes.id_matricula_discente_serie, 
    mes.id_situacao_matricula_serie 
FROM 
    basico.matricula_estudante_serie mes 
JOIN 
    discente d ON d.id_discente = mes.id_estudante 
JOIN 
    comum.pessoa p ON p.id_pessoa = d.id_pessoa 
JOIN 
    ensino.turma t ON t.id_turma_serie = mes.id_turma_serie_multisseriado 
LEFT JOIN 
    ensino.matricula_componente mc ON mes.id_estudante = mc.id_discente 
    AND mc.id_turma = t.id_turma 
LEFT JOIN 
    ensino.nota_unidade nu ON nu.id_matricula_componente = mc.id_matricula_componente 
    AND nu.ativo = true 
    AND nu.recuperacao = false 
LEFT JOIN 
    ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina 
LEFT JOIN 
    basico.modulo mod ON mod.id_modulo = t.id_modulo 
JOIN 
    basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie_multisseriado 
JOIN 
    escola.escola esc ON esc.id_escola = ts.id_escola 
JOIN 
    ensino.turno tn ON tn.id_turno = ts.id_turno 
JOIN 
    basico.serie se ON se.id_serie = ts.id_serie 
JOIN 
    basico.etapa_ensino ee ON ee.id_etapa_ensino = se.id_etapa_ensino 
WHERE (mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie OR mc.id_matricula_estudante_serie IS NULL) 
    AND t.id_situacao_turma <> 4 
ORDER BY 
    p.nome, mod.denominacao, nome, t.id_turma, mes.num_chamada, mes.id_situacao_matricula_serie, aluno;

select
	ee.id_nivel_etapa,
	dis.id_discente,
    pes.codigo_inep AS inep,
    pes.cpf_cnpj AS cpf,
    pes.nome AS nome_estudante,
    pes.data_nascimento AS data_nascimento,
    tr.descricao AS turno,
    ser.descricao AS serie,
    ee.denominacao AS etapa_ensino,
    e.data_base_censo,
    sms.descricao AS situacao,
    ts.nome AS turma,
    CASE WHEN mes.data_cadastro <= e.data_base_censo THEN TRUE ELSE FALSE END AS base_educacenso,
    nee.ensino_infantil, nee.id_nivel_etapa_ensino
FROM
    basico.matricula_estudante_serie mes
    JOIN escola.escola_etapa_ensino_serie eees ON mes.id_serie_escola = eees.id_escola_etapa_ensino_serie
    JOIN escola.escola esc ON esc.id_escola = eees.id_escola
    JOIN basico.serie ser ON ser.id_serie = eees.id_serie
    JOIN basico.etapa_ensino ee ON ser.id_etapa_ensino = ee.id_etapa_ensino
    join basico.nivel_etapa_ensino nee on nee.id_nivel_etapa_ensino = ee.id_nivel_etapa 
    JOIN basico.estudante est ON mes.id_estudante = est.id_estudante
    JOIN basico.situacao_matricula_serie sms ON sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
    JOIN discente dis ON est.id_estudante = dis.id_discente
    JOIN comum.pessoa pes ON dis.id_pessoa = pes.id_pessoa
    JOIN educacenso.educacenso e ON e.ano = 2023
    JOIN ensino.turno tr ON tr.id_turno = mes.id_turno
    join public.discente d on d.id_discente = mes.id_estudante 
    LEFT JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie
WHERE
    mes.ano_calendario = 2023 
    and esc.id_escola =52232914
GROUP by
	ee.id_nivel_etapa,
	dis.id_discente,
	pes.codigo_inep,
    pes.cpf_cnpj,
    dis.matricula,
    pes.nome,
    pes.data_nascimento,
    ser.descricao,
    ee.denominacao,
    e.data_base_censo,
    mes.data_cadastro,
    tr.descricao,
    sms.descricao,
    ts.nome,
    nee.ensino_infantil,
    nee.id_nivel_etapa_ensino 
ORDER by
    ee.denominacao,
    ser.descricao,
    tr.descricao,
    base_educacenso,
    ts.nome,
    pes.nome;
   


   
   select * from basico.situacao_matricula_serie sms ;
   select * from basico.estudante e 
   where sm
 
  
 select * from comum.pessoa  ;
 
SELECT x.* FROM public.discente x
WHERE x.matricula  = '202352773714';

SELECT *
FROM educacenso.educacenso e;

SELECT *
FROM educacenso.educacenso e
WHERE  data_base_censo IS NOT NULL;

SELECT *
FROM basico.nivel_etapa_ensino nee 	


SELECT *
FROM basico.etapa_ensino ee  


SELECT *
FROM escola.escola e 


1391216
17664062462
CRECHE

51918782

select
	ee.id_nivel_etapa,
	dis.id_discente,
	pes.codigo_inep as inep,
	pes.cpf_cnpj as cpf,
	pes.nome as nome_estudante,
	pes.data_nascimento as data_nascimento,
	tr.descricao as turno,
	ser.descricao as serie,
	ee.denominacao as etapa_ensino,
	e.data_base_censo,
	sms.descricao as situacao,
	ts.nome as turma,
	(case
		when mes.data_cadastro <= e.data_base_censo then true
		else false
	end ) as base_educacenso,
	nee.ensino_infantil,
	sms.id_situacao_matricula_serie
from
	basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on
	mes.id_serie_escola = eees.id_escola_etapa_ensino_serie
join escola.escola esc on
	esc.id_escola = eees.id_escola
join basico.serie ser on
	ser.id_serie = eees.id_serie
join basico.etapa_ensino ee on
	ser.id_etapa_ensino = ee.id_etapa_ensino
join basico.nivel_etapa_ensino nee on
	nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
join basico.estudante est on
	mes.id_estudante = est.id_estudante
join discente dis on
	est.id_estudante = dis.id_discente
join comum.pessoa pes on
	dis.id_pessoa = pes.id_pessoa
join educacenso.educacenso e on
	e.ano = 2023
join ensino.turno tr on
	tr.id_turno = mes.id_turno
join basico.situacao_matricula_serie sms on
	sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
left join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
where
	esc.id_escola = 52232914
	and mes.ano_calendario = 2023
group by
	ee.id_nivel_etapa,
	dis.id_discente,
	pes.codigo_inep,
	pes.cpf_cnpj,
	dis.matricula,
	pes.nome,
	pes.data_nascimento,
	ser.descricao,
	ee.denominacao,
	e.data_base_censo,
	mes.data_cadastro,
	tr.descricao,
	sms.descricao,
	ts.nome,
	nee.ensino_infantil
order by
	ee.denominacao,
	ser.descricao,
	tr.descricao,
	base_educacenso,
	ts.nome,
	pes.nome ;
	


select
	ts.nome as turma,
	pes.codigo_inep as inep,
	pes.cpf_cnpj as cpf,
	pes.nome  as "NOME" ,
	pes.data_nascimento  as "DATA NASCIMENTO",
	sms.descricao as situacao,
	(case
		when mes.data_cadastro <= e.data_base_censo then true
		else false
	end ) as "EDUCA CENSO" ,
	nee.ensino_infantil as "ENSINO INFANTIL" ,
	sms.id_situacao_matricula_serie as "ID SITUAÇÃO"
from
	basico.matricula_estudante_serie mes
join escola.escola_etapa_ensino_serie eees on
	mes.id_serie_escola = eees.id_escola_etapa_ensino_serie
join escola.escola esc on
	esc.id_escola = eees.id_escola
join basico.serie ser on
	ser.id_serie = eees.id_serie
join basico.etapa_ensino ee on
	ser.id_etapa_ensino = ee.id_etapa_ensino
join basico.nivel_etapa_ensino nee on
	nee.id_nivel_etapa_ensino = ee.id_nivel_etapa
join basico.estudante est on
	mes.id_estudante = est.id_estudante
join discente dis on
	est.id_estudante = dis.id_discente
join comum.pessoa pes on
	dis.id_pessoa = pes.id_pessoa
join educacenso.educacenso e on
	e.ano = 2023
join ensino.turno tr on
	tr.id_turno = mes.id_turno
join basico.situacao_matricula_serie sms on
	sms.id_situacao_matricula_serie = mes.id_situacao_matricula_serie
left join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
where
	esc.id_escola = 52232914
	and mes.ano_calendario = 2023
group by
	ee.id_nivel_etapa,
	dis.id_discente,
	pes.codigo_inep,
	pes.cpf_cnpj,
	dis.matricula,
	pes.nome,
	pes.data_nascimento,
	ser.descricao,
	ee.denominacao,
	e.data_base_censo,
	mes.data_cadastro,
	tr.descricao,
	sms.descricao,
	ts.nome,
	nee.ensino_infantil,
	sms.id_situacao_matricula_serie
order by
	ee.denominacao,
	ser.descricao,
	tr.descricao,
	base_educacenso,
	ts.nome,
	pes.nome 