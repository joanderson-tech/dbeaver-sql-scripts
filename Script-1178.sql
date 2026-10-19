select distinct ts.id_curriculo_medio, cb.codigo, s.descricao, s.id_serie 
from basico.matricula_estudante_serie mes 
join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie 
join basico.serie s on s.id_serie = ts.id_serie 
join basico.etapa_ensino ee on ee.id_etapa_ensino = s.id_etapa_ensino 
join basico.curriculo_basico cb on cb.id_curriculo_basico = ts.id_curriculo_medio
where mes.id_turno = 1 and mes.ano_calendario = 2025
--and ee.id_etapa_ensino in (51869718,51869719,51869717)
and s.id_serie in (51869789,51869722,51869790,52810259);

SELECT * FROM ensino.turno 

select cb.id_curriculo_basico, cb.codigo from basico.curriculo_basico cb where cb.codigo in ('EITIN2','EITIN1','EITIN3');

select * from basico.etapa_ensino ee ;

select * from basico.serie s;


SELECT * --string_agg(id_configuracao_relatorio::varchar, ', ')
FROM ensino_infantil.configuracao_relatorio cr WHERE cr.codigo in ('EITIN4','EITIN5');

select * from ensino_infantil.configuracao_rela

	--verifica se foi criado a configuracao_relatorio
SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico IN (51869717, 51877829, 51869718, 1012879);

--verifica se foi criado a configuracao_relatorio_componente
SELECT crc.*
FROM ensino_infantil.configuracao_relatorio cr
join ensino_infantil.configuracao_relatorio_componente crc on crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
WHERE cr.id_curriculo_basico IN (53140733) 
ORDER BY cr.id_configuracao_relatorio;

--verifica se foi criado a configuracao_relatorio_componente_habilidade
select crch.* 
FROM ensino_infantil.configuracao_relatorio cr
JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
join ensino_infantil.configuracao_relatorio_componente_habilidade crch on  crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
WHERE cr.id_curriculo_basico IN (53140733);

select * from ensino_infantil.configuracao_relatorio_componente_habilidade crch 
where crch.id_configuracao_relatorio_componente in (127, 126, 125, 124, 123, 132, 131, 130, 129, 128) and ativo;


select * from ensino_infantil.relatorio_avaliativo ra where ra.id_con


