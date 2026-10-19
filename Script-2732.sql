
-- ADICIONANDO  AS NOVAS HABILIDADE CMPEX04 - ESCUTA, FALA, PENSAMENTO E IMAGINAÇÃO
WITH habilidades_competencia_novas AS (
    SELECT hc.id_habilidade_competencia
FROM ensino_infantil.habilidade_competencia hc
WHERE hc.ativo = TRUE
AND hc.descricao SIMILAR TO '%(EI03EO01|EI03EO02|EI03EO03|EI03EO04|EI03EO05|EI03EO06|EI03EO07)%'
ORDER BY hc.data_cadastro ASC
LIMIT 7
), configuracoes_relatorio_componente_habilidades_novas AS (
    SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 44 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo
FROM habilidades_competencia_novas hcn
ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
    SELECT rac.id_relatorio_avaliativo_componente
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.configuracao_relatorio_componente crc ON
crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente
WHERE ra.ativo = TRUE
AND crc.id_configuracao_relatorio = 8
AND crc.id_componente_curricular = 506
), relatorios_avaliativos_habilidades_novos AS (
    SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn
ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
    SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo
FROM relatorios_avaliativos_habilidades_novos rahn
CROSS JOIN generate_series(1, 4) AS gs(periodo)
ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
    SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade || ', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup
FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
    SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup
FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
    SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup
FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT *
FROM script_configuracoes_relatorio_componente_habilidades_novas
UNION ALL SELECT *
FROM script_relatorios_avaliativos_habilidades_novos
UNION ALL SELECT *
FROM script_relatorios_avaliativos_habilidades_respostas_novos;


select * from ensino_infantil.relatorio_avaliativo_componente rac where rac.parecer_final_descritivo is not null;

SELECT * FROM basico.curriculo_basico  WHERE id_curriculo_basico   = 81686079;  

select * from ensino_infantil.relatorio_avaliativo_habilidade h where h.id_relatorio_avaliativo_componente =  18;


select string_agg(id_habilidade_competencia ::varchar, ', ')
from ensino_infantil.configuracao_relatorio_componente_habilidade crh where id_configuracao_relatorio_componente = 44 ;

select * --string_agg(id_habilidade_competencia ::varchar, ', ')
from ensino_infantil.configuracao_relatorio_componente_habilidade crh where id_configuracao_relatorio_componente = 48 ;


select * --string_agg(id_habilidade_competencia ::varchar, ', ')  
from ensino_infantil.configuracao_relatorio_componente_habilidade crch  where crch.id_configuracao_relatorio_componente_habilidade = 44;

select * from ensino_infantil.habilidade_competencia hc where hc.id_habilidade_competencia in (51869907, 51869908, 51869909, 51869910, 51869911, 51869912);

51869985, 51869986, 51869987, 51869988, 51869989, 51869991

SELECT crc.* FROM ensino_infantil.configuracao_relatorio_componente AS crc
WHERE id_configuracao_relatorio_componente = 8;

SELECT rac.* FROM ensino_infantil.relatorio_avaliativo_componente AS rac
WHERE id_relatorio_avaliativo_componente = 44;

select * from ensino_infantil.configuracao_relatorio_componente crc;  where crc.id_configuracao_relatorio = 4;

select * from ensino_infantil.configuracao_relatorio_componente crc 
where crc.id_configuracao_relatorio = 5; and crc.id_componente_curricular = 508

select * --string_agg(id_habilidade_competencia::varchar, ', ') 
from ensino_infantil.habilidade_competencia hc
where hc.ativo = TRUE
AND hc.descricao ~* 'EI03ET01|EI03ET02|EI03ET03|EI03ET04|EI03ET05|EI03ET06|EI03ET07|EI03ET08';

--EIP3-26 52472041

SELECT *
FROM basico.curriculo_basico cb
WHERE true
AND cb.id_serie = 51869715
AND cb.ano_entrada_vigor = 2026;

SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_curriculo_basico in (52472041) ;
SELECT * FROM ensino_infantil.configuracao_relatorio  AS cr WHERE cr.id_configuracao_relatorio  in (4,5,6,7) ; 

SELECT * FROM ensino_infantil.configuracao_relatorio_componente crc WHERE crc.id_configuracao_relatorio = 5;

SELECT * FROM basico.turma_serie ts WHERE ts.id_curriculo_medio = 52472041;

SELECT DISTINCT ts.*  --ts.id_curriculo_medio, t.id_disciplina, t.id_turma, mc.id_situacao_matricula 
FROM ensino.turma t 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
JOIN ensino.matricula_componente mc ON mc.id_turma = t.id_turma 
WHERE ts.id_curriculo_medio IN (51896862)
AND t.id_disciplina = 230
AND t.id_situacao_turma <>4;

-- id da - CORPO, GESTOS E MOVIMENTOS (51869913, 51869914, 51869915, 51869916, 51869917) atual

select mes.id_matricula_discente_serie,  * from discente d join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente where d.matricula = '202530019815';

commit ;
rollback;

select * --string_agg(id_relatorio_avaliativo_habilidade_resposta::varchar, ', ')  
from ensino_infantil.relatorio_avaliativo_habilidade_resposta rahr where rahr.id_relatorio_avaliativo_habilidade in (357, 358, 359, 360, 361, 362, 363, 364, 2934, 2935, 2936, 2937, 2938, 2939, 2940, 2941, 3693, 3694, 3695, 3696, 3697, 3698, 3699, 3700, 6987, 6988, 6989, 6990, 6991, 6992, 6993, 6994, 7140, 7141, 7142, 7143, 7144, 7145, 7146, 7147, 7213, 7214, 7215, 7216, 7217, 7218, 7219, 7220, 8766, 8767, 8768, 8769, 8770, 8771, 8772, 8773, 8911, 8912, 8913, 8914, 8915, 8916, 8917, 8918, 17555, 17556, 17557, 17558, 17559, 17560, 17561, 17562, 17809, 17810, 17811, 17812, 17813, 17814, 17815, 17816, 18286, 18287, 18288, 18289, 18290, 18291, 18292, 18293, 18399, 18400, 18401, 18402, 18403, 18404, 18405, 18406, 18512, 18513, 18514, 18515, 18516, 18517, 18518, 18519, 18625, 18626, 18627, 18628, 18629, 18630, 18631, 18632, 18738, 18739, 18740, 18741, 18742, 18743, 18744, 18745, 18851, 18852, 18853, 18854, 18855, 18856, 18857, 18858, 18964, 18965, 18966, 18967, 18968, 18969, 18970, 18971, 19077, 19078, 19079, 19080, 19081, 19082, 19083, 19084, 19190, 19191, 19192, 19193, 19194, 19195, 19196, 19197, 19303, 19304, 19305, 19306, 19307, 19308, 19309, 19310, 19416, 19417, 19418, 19419, 19420, 19421, 19422, 19423, 19529, 19530, 19531, 19532, 19533, 19534, 19535, 19536, 19642, 19643, 19644, 19645, 19646, 19647, 19648, 19649, 19755, 19756, 19757, 19758, 19759, 19760, 19761, 19762, 19868, 19869, 19870, 19871, 19872, 19873, 19874, 19875, 19981, 19982, 19983, 19984, 19985, 19986, 19987, 19988, 20094, 20095, 20096, 20097, 20098, 20099, 20100, 20101, 20207, 20208, 20209, 20210, 20211, 20212, 20213, 20214, 20320, 20321, 20322, 20323, 20324, 20325, 20326, 20327, 20433, 20434, 20435, 20436, 20437, 20438, 20439, 20440, 20546, 20547, 20548, 20549, 20550, 20551, 20552, 20553, 20659, 20660, 20661, 20662, 20663, 20664, 20665, 20666, 20772, 20773, 20774, 20775, 20776, 20777, 20778, 20779, 21103, 21104, 21105, 21106, 21107, 21108, 21109, 21110, 21216, 21217, 21218, 21219, 21220, 21221, 21222, 21223, 21329, 21330, 21331, 21332, 21333, 21334, 21335, 21336, 21474, 21475, 21476, 21477, 21478, 21479, 21480, 21481, 21587, 21588, 21589, 21590, 21591, 21592, 21593, 21594, 21700, 21701, 21702, 21703, 21704, 21705, 21706, 21707, 21813, 21814, 21815, 21816, 21817, 21818, 21819, 21820, 21926, 21927, 21928, 21929, 21930, 21931, 21932, 21933, 22039, 22040, 22041, 22042, 22043, 22044, 22045, 22046, 22152, 22153, 22154, 22155, 22156, 22157, 22158, 22159, 22265, 22266, 22267, 22268, 22269, 22270, 22271, 22272, 22378, 22379, 22380, 22381, 22382, 22383, 22384, 22385, 22491, 22492, 22493, 22494, 22495, 22496, 22497, 22498, 22604, 22605, 22606, 22607, 22608, 22609, 22610, 22611, 22717, 22718, 22719, 22720, 22721, 22722, 22723, 22724, 22830, 22831, 22832, 22833, 22834, 22835, 22836, 22837, 23071, 23072, 23073, 23074, 23075, 23076, 23077, 23078, 23184, 23185, 23186, 23187, 23188, 23189, 23190, 23191, 23297, 23298, 23299, 23300, 23301, 23302, 23303, 23304, 23410, 23411, 23412, 23413, 23414, 23415, 23416, 23417, 23523, 23524, 23525, 23526, 23527, 23528, 23529, 23530, 23854, 23855, 23856, 23857, 23858, 23859, 23860, 23861, 23967, 23968, 23969, 23970, 23971, 23972, 23973, 23974, 24080, 24081, 24082, 24083, 24084, 24085, 24086, 24087, 24193, 24194, 24195, 24196, 24197, 24198, 24199, 24200, 24407, 24408, 24409, 24410, 24411, 24412, 24413, 24414, 24520, 24521, 24522, 24523, 24524, 24525, 24526, 24527, 24633, 24634, 24635, 24636, 24637, 24638, 24639, 24640, 24847, 24848, 24849, 24850, 24851, 24852, 24853, 24854, 24960, 24961, 24962, 24963, 24964, 24965, 24966, 24967, 25275, 25276, 25277, 25278, 25279, 25280, 25281, 25282, 25388, 25389, 25390, 25391, 25392, 25393, 25394, 25395, 25501, 25502, 25503, 25504, 25505, 25506, 25507, 25508, 25925, 25926, 25927, 25928, 25929, 25930, 25931, 25932, 26038, 26039, 26040, 26041, 26042, 26043, 26044, 26045, 26151, 26152, 26153, 26154, 26155, 26156, 26157, 26158, 32196, 32197, 32198, 32199, 32200, 32201, 32202, 32203, 32309, 32310, 32311, 32312, 32313, 32314, 32315, 32316, 32422, 32423, 32424, 32425, 32426, 32427, 32428, 32429, 32535, 32536, 32537, 32538, 32539, 32540, 32541, 32542, 32648, 32649, 32650, 32651, 32652, 32653, 32654, 32655, 43478, 43479, 43480, 43481, 43482, 43483, 43484, 43485, 43623, 43624, 43625, 43626, 43627, 43628, 43629, 43630, 45036, 45037, 45038, 45039, 45040, 45041, 45042, 45043, 45149, 45150, 45151, 45152, 45153, 45154, 45155, 45156, 45378, 45379, 45380, 45381, 45382, 45383, 45384, 45385, 45491, 45492, 45493, 45494, 45495, 45496, 45497, 45498, 45604, 45605, 45606, 45607, 45608, 45609, 45610, 45611, 45717, 45718, 45719, 45720, 45721, 45722, 45723, 45724, 45830, 45831, 45832, 45833, 45834, 45835, 45836, 45837, 45943, 45944, 45945, 45946, 45947, 45948, 45949, 45950, 46056, 46057, 46058, 46059, 46060, 46061, 46062, 46063, 46169, 46170, 46171, 46172, 46173, 46174, 46175, 46176, 46282, 46283, 46284, 46285, 46286, 46287, 46288, 46289, 46395, 46396, 46397, 46398, 46399, 46400, 46401, 46402, 46508, 46509, 46510, 46511, 46512, 46513, 46514, 46515, 49533, 49534, 49535, 49536, 49537, 49538, 49539, 49540, 50110, 50111, 50112, 50113, 50114, 50115, 50116, 50117, 50919, 50920, 50921, 50922, 50923, 50924, 50925, 50926, 52076, 52077, 52078, 52079, 52080, 52081, 52082, 52083, 52305, 52306, 52307, 52308, 52309, 52310, 52311, 52312, 52418, 52419, 52420, 52421, 52422, 52423, 52424, 52425, 52531, 52532, 52533, 52534, 52535, 52536, 52537, 52538, 52644, 52645, 52646, 52647, 52648, 52649, 52650, 52651, 52757, 52758, 52759, 52760, 52761, 52762, 52763, 52764, 52870, 52871, 52872, 52873, 52874, 52875, 52876, 52877, 52983, 52984, 52985, 52986, 52987, 52988, 52989, 52990, 53096, 53097, 53098, 53099, 53100, 53101, 53102, 53103, 53209, 53210, 53211, 53212, 53213, 53214, 53215, 53216, 53322, 53323, 53324, 53325, 53326, 53327, 53328, 53329, 53723, 53724, 53725, 53726, 53727, 53728, 53729, 53730, 53836, 53837, 53838, 53839, 53840, 53841, 53842, 53843, 53949, 53950, 53951, 53952, 53953, 53954, 53955, 53956, 54190, 54191, 54192, 54193, 54194, 54195, 54196, 54197, 54303, 54304, 54305, 54306, 54307, 54308, 54309, 54310, 54416, 54417, 54418, 54419, 54420, 54421, 54422, 54423, 54529, 54530, 54531, 54532, 54533, 54534, 54535, 54536, 54642, 54643, 54644, 54645, 54646, 54647, 54648, 54649, 54755, 54756, 54757, 54758, 54759, 54760, 54761, 54762, 54868, 54869, 54870, 54871, 54872, 54873, 54874, 54875, 54981, 54982, 54983, 54984, 54985, 54986, 54987, 54988, 63759, 63760, 63761, 63762, 63763, 63764, 63765, 63766);


select * --  string_agg(id_relatorio_avaliativo_habilidade::varchar, ', ')  
from ensino_infantil.relatorio_avaliativo_habilidade rah  where id_configuracao_relatorio_componente_habilidade in (359, 360, 361, 362, 363, 364, 365, 366);

select * --string_agg(id_configuracao_relatorio_componente_habilidade::varchar, ', ') 
from ensino_infantil.configuracao_relatorio_componente_habilidade crch  WHERE crch.id_habilidade_competencia in (51870259, 51870260, 51870261, 51870262, 51870263, 51870264, 51870265, 51870266) and id_configuracao_relatorio_componente = 42


-- ADICIONANDO  AS NOVAS HABILIDADE NO COMPONENTE Espaços, Tempos,Quantidades, Relações e Transformações (ET)  
WITH habilidades_competencia_novas AS (
    SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.descricao SIMILAR TO  '%(EI03ET01|EI03ET02|EI03ET03|EI03ET04|EI03ET05|EI03ET06|EI03ET07|EI03ET08)%' ORDER BY hc.descricao asc LIMIT 8
), configuracoes_relatorio_componente_habilidades_novas AS (
    SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 
    33 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
    SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente 
    WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 5 AND crc.id_componente_curricular = 510
), relatorios_avaliativos_habilidades_novos AS (
    SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
    SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
    SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
    SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
    SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;





-- ADICIONANDO  AS NOVAS HABILIDADE CMPEX05 - ESPAÇOS, TEMPOS, QUANTIDADES, RELAÇÕES E TRANSFORMAÇÕES
WITH habilidades_competencia_novas AS (
    SELECT hc.id_habilidade_competencia FROM ensino_infantil.habilidade_competencia hc WHERE hc.ativo = TRUE AND hc.descricao SIMILAR TO  '%(EI03ET07|EI03ET08)%' ORDER BY hc.data_cadastro asc LIMIT 2
), configuracoes_relatorio_componente_habilidades_novas AS (
    SELECT nextval('ensino_infantil.configuracao_relatorio_componente_habilidade_seq') id_configuracao_relatorio_componente_habilidade, 21 id_configuracao_relatorio_componente, hcn.id_habilidade_competencia, TRUE ativo FROM habilidades_competencia_novas hcn ORDER BY hcn.id_habilidade_competencia 
), relatorio_avaliativo_componente AS (
    SELECT rac.id_relatorio_avaliativo_componente FROM ensino_infantil.relatorio_avaliativo ra JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo JOIN ensino_infantil.configuracao_relatorio_componente crc ON crc.id_configuracao_relatorio_componente = rac.id_configuracao_relatorio_componente WHERE ra.ativo = TRUE AND crc.id_configuracao_relatorio = 4 AND crc.id_componente_curricular = 510
), relatorios_avaliativos_habilidades_novos AS (
    SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_seq') id_relatorio_avaliativo_habilidade, rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade FROM relatorio_avaliativo_componente rac, configuracoes_relatorio_componente_habilidades_novas crchn ORDER BY rac.id_relatorio_avaliativo_componente, crchn.id_configuracao_relatorio_componente_habilidade
), relatorios_avaliativos_habilidades_respostas_novos AS (
    SELECT nextval('ensino_infantil.relatorio_avaliativo_habilidade_resposta_seq') id_relatorio_avaliativo_habilidade_resposta, rahn.id_relatorio_avaliativo_habilidade, gs.periodo FROM relatorios_avaliativos_habilidades_novos rahn CROSS JOIN generate_series(1, 4) AS gs(periodo) ORDER BY rahn.id_relatorio_avaliativo_habilidade, gs.periodo
), script_configuracoes_relatorio_componente_habilidades_novas AS (
    SELECT 'INSERT INTO ensino_infantil.configuracao_relatorio_componente_habilidade (id_configuracao_relatorio_componente_habilidade, id_configuracao_relatorio_componente, id_habilidade_competencia, ativo) VALUES (' || crchn.id_configuracao_relatorio_componente_habilidade ||', ' || crchn.id_configuracao_relatorio_componente || ', ' || crchn.id_habilidade_competencia || ', ' || crchn.ativo || ');' solucao, 'DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade = ' || crchn.id_configuracao_relatorio_componente_habilidade || ';' backup FROM configuracoes_relatorio_componente_habilidades_novas crchn
), script_relatorios_avaliativos_habilidades_novos AS (
    SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade (id_relatorio_avaliativo_habilidade, id_relatorio_avaliativo_componente, id_configuracao_relatorio_componente_habilidade) VALUES (' || rahn.id_relatorio_avaliativo_habilidade || ', ' || rahn.id_relatorio_avaliativo_componente || ', ' || rahn.id_configuracao_relatorio_componente_habilidade || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade = ' || rahn.id_relatorio_avaliativo_habilidade || ';' backup FROM relatorios_avaliativos_habilidades_novos rahn
), script_relatorios_avaliativos_habilidades_respostas_novos AS (
    SELECT 'INSERT INTO ensino_infantil.relatorio_avaliativo_habilidade_resposta (id_relatorio_avaliativo_habilidade_resposta, id_relatorio_avaliativo_habilidade, periodo) VALUES (' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ', ' || rahrn.id_relatorio_avaliativo_habilidade || ', ' || rahrn.periodo || ');' solucao, 'DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta WHERE id_relatorio_avaliativo_habilidade_resposta = ' || rahrn.id_relatorio_avaliativo_habilidade_resposta || ';' backup FROM relatorios_avaliativos_habilidades_respostas_novos rahrn
) SELECT * FROM script_configuracoes_relatorio_componente_habilidades_novas UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_novos UNION ALL SELECT * FROM script_relatorios_avaliativos_habilidades_respostas_novos;
