select rac
from  basico.matricula_estudante_serie mes
join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
join ensino_infantil.parecer_descritivo_individual pdi on pdi.id_matricula_discente_serie = ra.id_matricula_discente_serie
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join  ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
where ra.id_matricula_discente_serie in (1327733, 1327692, 1327706, 1327708, 1327729, 1327737, 1327740, 1327744, 1327747, 1327764, 1327766, 1327770, 1327776, 1327780, 1327781, 1327783, 1327784, 1327785, 1327788, 1327818, 1328075)
and mc.id_situacao_matricula = 7
and rac.avaliacao_descritiva is not null;