SELECT *
FROM ensino_infantil.relatorio_avaliativo ra WHERE ra.id_matricula_discente_serie = 1323502;

SELECT string_agg( id_relatorio_avaliativo_componente::varchar , ', ') FROM ensino_infantil.relatorio_avaliativo_componente ra WHERE ra.id_relatorio_avaliativo IN (1470,1471,1472) ;

SELECT * FROM ensino_infantil.relatorio_avaliativo_componente ra WHERE ra.id_relatorio_avaliativo = 370;

SELECT  * --string_agg( id_relatorio_avaliativo_habilidade_resposta::varchar , ', ') 
FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta ra; WHERE ra.id_relatorio_avaliativo_habilidade  IN (46552,46485,46625,46537,46490,46511,46616,46555,46599,46495,46515,46621,46572,46578,46565,46585,46605,46601,46499,46562,46483,46592,46558,46509,46481,46607,46598,46547,46534,46487,46613,46549,46579,46494,46479,46559,46478,46561,46500,46595,46588,46539,46582,46528,46536,46571,46554,46526,46522,46520,46604,46486,46589,46608,46569,46560,46574,46576,46577,46557,46620,46551,46507,46610,46597,46596,46603,46503,46624,46544,46573,46566,46519,46546,46521,46493,46541,46505,46623,46474,46527,46545,46550,46600,46567,46489,46614,46553,46593,46564,46475,46611,46506,46587,46540,46581,46606,46510,46618,46532,46556,46619,46563,46525,46496,46513,46516,46594,46480,46512,46570,46533,46548,46542,46477,46535,46488,46580,46584,46482,46538,46530,46502,46622,46492,46484,46586,46473,46612,46497,46591,46517,46518,46523,46568,46626,46531,46476,46529,46514,46524,46583,46504,46609,46508,46501,46615,46617,46543,46491,46498,46602,46590,46575);

SELECT * --string_agg(id_relatorio_avaliativo_habilidade ::varchar , ', ') 
FROM ensino_infantil.relatorio_avaliativo_habilidade ra WHERE ra.id_relatorio_avaliativo_componente IN (11691);


DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta IN ();

DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade IN ();

DELETE FROM ensino_infantil.relatorio_avaliativo_componente WHERE id_relatorio_avaliativo_componente IN ();

DELETE FROM ensino_infantil.relatorio_avaliativo WHERE id_relatorio_avaliativo IN (1470,1471,1472) ;


SELECT EXISTS (SELECT 1FROM matricula.tipo_documento_matricula WHERE id_tipo_documento_matricula = 5);



SELECT * --string_agg(id_relatorio_avaliativo_habilidade ::varchar , ', ') 
FROM ensino_infantil.relatorio_avaliativo_habilidade ra WHERE ra.id_relatorio_avaliativo_componente IN (2838); -- 2838



BEGIN;

CREATE TEMP TABLE relatorio_avaliativo_componente AS
SELECT DISTINCT rac.id_relatorio_avaliativo_componente
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
AND rac.id_configuracao_relatorio_componente = 33
WHERE ra.id_configuracao_relatorio = 5
AND ra.ativo
AND NOT EXISTS (
    SELECT 1
FROM ensino_infantil.relatorio_avaliativo_habilidade rah
WHERE rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
AND rah.id_configuracao_relatorio_componente_habilidade = 278
  );


SELECT DISTINCT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') AS id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente 
INTO TEMP adicionar_relatorio_avaliativo_habilidade
FROM relatorio_avaliativo_componente rac;

INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade)
SELECT rac.id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, 278
FROM adicionar_relatorio_avaliativo_habilidade rac;

DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade IN ( 46552,46485,46625,46537,46490,46511,46616,46555,46599,46495,46515,46621,46572,46578,46565,46585,46605,46601,46499,46562,46483,46592,46558,46509,46481,46607,46598,46547,46534,46487,46613,46549,46579,46494,46479,46559,46478,46561,46500,46595,46588,46539,46582,46528,46536,46571,46554,46526,46522,46520,46604,46486,46589,46608,46569,46560,46574,46576,46577,46557,46620,46551,46507,46610,46597,46596,46603,46503,46624,46544,46573,46566,46519,46546,46521,46493,46541,46505,46623,46474,46527,46545,46550,46600,46567,46489,46614,46553,46593,46564,46475,46611,46506,46587,46540,46581,46606,46510,46618,46532,46556,46619,46563,46525,46496,46513,46516,46594,46480,46512,46570,46533,46548,46542,46477,46535,46488,46580,46584,46482,46538,46530,46502,46622,46492,46484,46586,46473,46612,46497,46591,46517,46518,46523,46568,46626,46531,46476,46529,46514,46524,46583,46504,46609,46508,46501,46615,46617,46543,46491,46498,46602,46590,46575);

SELECT 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade IN ( ' || string_agg(id_relatorio_avaliativo_habilidade::TEXT, ',') || ');'
FROM adicionar_relatorio_avaliativo_habilidade ;


ROLLBACK;

COMMIT;