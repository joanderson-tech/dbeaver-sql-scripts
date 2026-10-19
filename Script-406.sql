sELECT DISTINCT  tne.id_tipo_necessidade_especial as id,  tne.descricao,  tne.ativo  FROM comum.recurso_avaliacao_nee ran 
   join comum.recurso_avaliacao_tipo_necessidade_especial ratne ON ran.id_recurso_avaliacao_nee = ratne.id_recurso_avaliacao_nee 
   JOIN comum.tipo_necessidade_especial tne ON tne.id_tipo_necessidade_especial = ratne.id_tipo_necessidade_especial 
   WHERE ran.ativo          AND tne.ativo          AND ran.removido = FALSE ;
   
   select
	distinct ran.id_recurso_avaliacao_nee,
	ran.descricao,
	ran.ativo
from
	comum.recurso_avaliacao_nee ran
join comum.recurso_avaliacao_tipo_necessidade_especial ratne on
	ran.id_recurso_avaliacao_nee = ratne.id_recurso_avaliacao_nee
join comum.tipo_necessidade_especial tne on
	tne.id_tipo_necessidade_especial = ratne.id_tipo_necessidade_especial
where
	ran.ativo
	and tne.ativo
	and ran.removido = false; 
