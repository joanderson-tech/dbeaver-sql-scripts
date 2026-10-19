SELECT 'UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = ' || cbc.id_curriculo_basico_componente || ' ;' AS solucao, 
	   'UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = ' || cbc.id_curriculo_basico_componente || ' ;' AS backup
FROM basico.curriculo_basico_componente cbc
WHERE cbc.id_curriculo_basico IN (52399214, 52399230, 52399246, 52399262, 52399278)
AND cbc.id_componente_curricular IN (238, 225);



UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399217 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399221 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399233 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399237 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399249 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399253 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399265 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399269 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399281 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=true WHERE id_curriculo_basico_componente  = 52399285 ;


UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399217 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399221 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399233 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399237 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399249 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399253 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399265 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399269 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399281 ;
UPDATE basico.curriculo_basico_componente SET permite_alocacao_adjunto=false WHERE id_curriculo_basico_componente = 52399285 ;