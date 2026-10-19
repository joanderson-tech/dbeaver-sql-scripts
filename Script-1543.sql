-- EstudanteInscritoProcessamento
select
    *
from
    log_db
where
    id_sistema = 2
    and tabela = 'br.com.sigsoftware.sigeduc.basico.matricula.dominio.EstudanteInscritoProcessamento'
    and id_elemento in (53724563,53724564,53724401,53724402,53725017,53725018,53724971,53724972,53723650,53723651,53723890,53724152,53724153,53724364,53724457,53724458)
order by
    id_elemento
    data desc;

-- EstudanteInscrito
select
    data,
    operacao,
    tabela,
    alteracoes,
    cod_movimento,
    id_registro_entrada,
    id_sistema
from
    log_db
where
    id_sistema = 2
    and tabela = 'br.com.sigsoftware.sigeduc.basico.matricula.dominio.EstudanteInscrito'
    and id_elemento in (53724967,53725013,53723646,53723887,53724361,53724453,53724148,53724559,53724397)
order by
    id_elemento
    data desc;