SELECT e
FROM escola.escola e
INNER JOIN comum.unidade u ON
e.id_unidade_escola = u.id_unidade
INNER JOIN comum.municipio m ON
e.id_municipio = m.id_municipio
LEFT OUTER JOIN comum.unidade_federativa unidadefed5_ ON
m.id_unidade_federativa = unidadefed5_.id_unidade_federativa
LEFT OUTER JOIN escola.bairro_escola bairroesco3_ ON
e.id_bairro_escola = bairroesco3_.id_bairro_escola
LEFT OUTER JOIN escola.localizacao_zona localizaca6_ ON
e.id_localizacao_zona = localizaca6_.id_localizacao_zona
LEFT OUTER JOIN escola.situacao_funcionamento situacaofu7_ ON
e.id_situacao_funcionamento = situacaofu7_.id_situacao_funcionamento
LEFT OUTER JOIN comum.unidade unidade8_ ON
e.id_regional_ensino = unidade8_.id_unidade
WHERE 1 = 1
AND e.instituicao_ensino_superior = FALSE
--AND upper(retira_acentuacao(u.nome)) LIKE upper(retira_acentuacao(:nome))
AND (retira_acentuacao(lower(u.nome)) LIKE retira_acentuacao(lower('testes')))
AND m.id_municipio =2803500
AND e.id_dependencia_administrativa =3
ORDER BY e.nome;


CREATE OR REPLACE FUNCTION public.retira_acentuacao(p_texto text)
 RETURNS text
 LANGUAGE sql
AS $function$ Select translate($1,'áàâãäåaaaÁÂÃÄÅAAAÀéèêëeeeeeÊEEÉEEÈìíîïìiiiÌÍÎÏÌIIIóôõöoooòÒÓÔÕÖOOOùúûüuuuuÙÚÛÜUUUUçÇñÑýÝ','aaaaaaaaaAAAAAAAAAeeeeeeeeeEEEEEEEiiiiiiiiIIIIIIIIooooooooOOOOOOOOuuuuuuuuUUUUUUUUcCnNyY');$function$
;



CREATE OR REPLACE FUNCTION public.retira_acentuacao(p_texto text) RETURNS text LANGUAGE SQL AS $function$ Select translate($1,'áàâãäåaaaÁÂÃÄÅAAAÀéèêëeeeeeÊEEÉEEÈìíîïìiiiÌÍÎÏÌIIIóôõöoooòÒÓÔÕÖOOOùúûüuuuuÙÚÛÜUUUUçÇñÑýÝ','aaaaaaaaaAAAAAAAAAeeeeeeeeeEEEEEEEiiiiiiiiIIIIIIIIooooooooOOOOOOOOuuuuuuuuUUUUUUUUcCnNyY'); $function$;



[
    {
        "script":[
            "CREATE OR REPLACE FUNCTION public.retira_acentuacao(p_texto text) RETURNS text LANGUAGE SQL AS $function$ Select translate($1,'áàâãäåaaaÁÂÃÄÅAAAÀéèêëeeeeeÊEEÉEEÈìíîïìiiiÌÍÎÏÌIIIóôõöoooòÒÓÔÕÖOOOùúûüuuuuÙÚÛÜUUUUçÇñÑýÝ','aaaaaaaaaAAAAAAAAAeeeeeeeeeEEEEEEEiiiiiiiiIIIIIIIIooooooooOOOOOOOOuuuuuuuuUUUUUUUUcCnNyY'); $function$;"
        ],
        "database":"sigeduc"
    }
]

SELECT EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'retira_acentuacao' AND pronamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public') AND oidvectortypes(proargtypes) = 'text') AS existe_funcao;