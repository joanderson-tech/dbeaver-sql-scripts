-- SOLUÇÃO PARA 1° E 2° ANO
select 
 'update basico.curriculo_basico set possui_parte_diversificada = false, tipo_diario_diversificado = null, tipo_diario = 31 where id_curriculo_basico = ' || cb.id_curriculo_basico || ';' as solucao,
 'update basico.curriculo_basico set possui_parte_diversificada = ' || 
 	case when cb.possui_parte_diversificada then 'true' 
 	else 'false' 
 	end || 
 ', tipo_diario_diversificado = ' || coalesce(cb.tipo_diario_diversificado::text, 'NULL') || ', tipo_diario = ' || coalesce(cb.tipo_diario::text, 'NULL') || 
 ' where id_curriculo_basico = ' || cb.id_curriculo_basico || ';' as backup
from basico.curriculo_basico cb
where cb.id_curriculo_basico IN (55456100,55456080);

select 
 'update basico.curriculo_basico_componente set permite_alocacao_adjunto = false where id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ';' as solucao,
 'update basico.curriculo_basico_componente set permite_alocacao_adjunto = ' ||
 	case 
	 	when cbc.permite_alocacao_adjunto then 'true' 
	 	else 'false' 
	end ||' where id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ';' as backup
from basico.curriculo_basico_componente cbc 
where cbc.id_curriculo_basico_componente in (55456116,55456112,55456118,55456110,55456111,55456114,55456113,55456109,55456115,55456117,55579916,55579917,55579918,55579911,55579912,55579913,55456096,55456092,55456098,55456090,55456091,55456094,55456093,55456089,55456095,55456097)
and cbc.id_categoria_componente = 2;

select 
'update basico.turma_serie set tipo_diario = 31 where id_curriculo_medio = ' || ts.id_curriculo_medio || ' and ativo = true;' as solucao,
'update basico.turma_serie set tipo_diario = ' || coalesce(ts.tipo_diario::text, 'NULL') || ' where id_curriculo_medio = ' || ts.id_curriculo_medio || ' and ativo = true;' as backup
from basico.turma_serie ts
where ts.id_curriculo_medio in (55456100,55456080)
and ts.ativo;

select 
'update ensino.turma set id_categoria_componente = 1 where id_turma = ' || t.id_turma  || ';' as solucao,
'update ensino.turma set id_categosria_componente = ' || coalesce(t.id_categoria_componente::text, 'NULL') || ' where id_turma = ' || t.id_turma || ';' as backup
from ensino.turma t
where t.id_turma in (738702,738706,738707,738711,738708,738709,738710,738712,738713,738714,738715,738716,738717,738792,738793,738791,738794,738779,738783,738784,738785,738786,738787,738788,738789,738790);


-- SOLUÇÃO 3° AO 5° ANO
select 
 'update basico.curriculo_basico set possui_parte_diversificada = false, tipo_diario_diversificado = null where id_curriculo_basico = ' || cb.id_curriculo_basico || ';' as solucao,
 'update basico.curriculo_basico set possui_parte_diversificada = ' || 
 	case when cb.possui_parte_diversificada then 'true' 
 	else 'false' 
 	end || 
 ', tipo_diario_diversificado = ' || coalesce(cb.tipo_diario_diversificado::text, 'NULL') || ' where id_curriculo_basico = ' || cb.id_curriculo_basico || ';' as backup
from basico.curriculo_basico cb
where cb.id_curriculo_basico IN (55456120,55456140, 55456160);

select 
 'update basico.curriculo_basico_componente set permite_alocacao_adjunto = false where id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ';' as solucao,
 'update basico.curriculo_basico_componente set permite_alocacao_adjunto = ' ||
 	case 
	 	when cbc.permite_alocacao_adjunto then 'true' 
	 	else 'false' 
	end ||' where id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ';' as backup
from basico.curriculo_basico_componente cbc 
where cbc.id_curriculo_basico_componente in (55579930,55579931,55579932,55579935,55579936,55579937,55579979,55579980,55579981)
and cbc.id_categoria_componente = 2;

select 
'update ensino.turma set id_categoria_componente = 1 where id_turma = ' || t.id_turma  || ';' as solucao,
'update ensino.turma set id_categosria_componente = ' || coalesce(t.id_categoria_componente::text, 'NULL') || ' where id_turma = ' || t.id_turma || ';' as backup
from ensino.turma t
where t.id_turma in (738856,738854,738855,738895,738896,738897,738833,738832,738834);