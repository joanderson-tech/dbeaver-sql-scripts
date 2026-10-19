begin;

--solucao
update basico.curriculo_basico set tipo_diario_diversificado = null, possui_parte_diversificada = false where id_curriculo_basico in (52165189,52165133,52165151,52165208,52165227,52165246);

select 
'update ensino_infantil.configuracao_relatorio set ativo = false, id_curriculo_basico = null where id_configuracao_relatorio = ' || id_configuracao_relatorio || ';' as solucao,
'update ensino_infantil.configuracao_relatorio set ativo = false, id_curriculo_basico = ' || id_curriculo_basico || ' where id_configuracao_relatorio = ' || id_configuracao_relatorio || ';' as backup
from ensino_infantil.configuracao_relatorio
where id_configuracao_relatorio in (13,14,15,16);


update ensino_infantil.configuracao_relatorio set ativo = false, id_curriculo_basico = null where id_configuracao_relatorio = 13;
update ensino_infantil.configuracao_relatorio set ativo = false, id_curriculo_basico = null where id_configuracao_relatorio = 14;
update ensino_infantil.configuracao_relatorio set ativo = false, id_curriculo_basico = null where id_configuracao_relatorio = 15;
update ensino_infantil.configuracao_relatorio set ativo = false, id_curriculo_basico = null where id_configuracao_relatorio = 16;


commit;