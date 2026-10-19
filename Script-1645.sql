BEGIN;

ROLLBACK;

SELECT DISTINCT hr.*
INTO TEMP insert_habilidade_resposta
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON
rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON
hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (4, 6)
AND ra.id_relatorio_avaliativo in (9347, 7206)
AND hr.periodo = 12;

--backup
SELECT
    'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta ' ||
    '(id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, id_opcao_grupo_avaliacao_relatorio, periodo) VALUES (' ||
    id_relatorio_avaliativo_habilidade_resposta || ', ' ||
    id_relatorio_avaliativo_habilidade || ', ' ||
    COALESCE(id_opcao_grupo_avaliacao_relatorio::text, 'NULL') || ', ' ||
    periodo ||
    ');'
FROM insert_habilidade_resposta;


SELECT  'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta where id_relatorio_avaliativo_habilidade_resposta IN ( ' || string_agg(id_relatorio_avaliativo_habilidade_resposta::TEXT,',') || ');'
FROM insert_habilidade_resposta;


DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta where id_relatorio_avaliativo_habilidade_resposta IN ( 3616407,3616419,3616431,3616443,3616455,3616467,3616479,3616491,3616503,3616515,3616527,3616539,3616551,3616563,3616575,3616587,3616599,3616611,3616623,3616635,3616647,3616659,3616671,3616683,3616695,3616707,3616719,3616731,3616743,3616755,3616767,3616779,3616791,3616803,3616815,3616827,3616839,3616851,3616863,3616875,3616887,3616899,3616911,3616923,3616935,3616947,3616959,3616971,3616983,3616995,3617007,3617019,3617031,3617043,3617055,3617067,4577936,4577948,4577960,4577972,4577984,4577996,4578008,4578020,4578032,4578044,4578056,4578068,4578080,4578092,4578104,4578116,4578128,4578140,4578152,4578164,4578176,4578188,4578200,4578212,4578224,4578236,4578248,4578260,4578272,4578284,4578296,4578308,4578320,4578332,4578344,4578356,4578368,4578380,4578392,4578404,4578416,4578428,4578440,4578452,4578464,4578476,4578488,4578500,4578512,4578524,4578536);


COMMIT;







