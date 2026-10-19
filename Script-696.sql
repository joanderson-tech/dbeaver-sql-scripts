SELECT * FROM basico.curriculo_basico cb ; where cb.codigo = 'EICII';
select * from ensino_infantil.relatorio_avaliativo_habilidade h where h.id_relatorio_avaliativo_componente =  18;
SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico in (51880787) ;  51869717 51869717

select string_agg(id_habilidade_competencia ::varchar, ', ')
from ensino_infantil.configuracao_relatorio_componente_habilidade crh where id_configuracao_relatorio_componente = 44 ;
select * --string_agg(id_habilidade_competencia ::varchar, ', ')
from ensino_infantil.configuracao_relatorio_componente_habilidade crh where id_configuracao_relatorio_componente = 48 ;


select * from ensino_infantil.configuracao_relatorio_componente crc  where crc.id_configuracao_relatorio = 3; and crc.id_componente_curricular = 220;




UPDATE ensino_infantil.configuracao_relatorio_componente SET ativo=false WHERE id_configuracao_relatorio_componente in (1, 7, 13);



UPDATE ensino_infantil.configuracao_relatorio_componente SET ativo=true WHERE id_configuracao_relatorio_componente in (1, 7, 13);
