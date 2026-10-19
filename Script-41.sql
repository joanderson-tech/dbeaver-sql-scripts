select * from comum.municipio m 
where m.nome ilike 'Campina%'


ALTER TABLE basico.curriculo_basico ADD possui_sabado_letivo BOOLEAN DEFAULT true;