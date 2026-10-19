SELECT * FROM ensino_infantil.relatorio_avaliativo ra WHERE ra.id_configuracao_relatorio IN (5, 6, 7, 8);

SELECT DISTINCT ts.id_curriculo_medio FROM basico.matricula_estudante_serie mes 
JOIN basico.turma_serie ts ON ts.id_turma_serie = mes.id_turma_serie 
WHERE mes.id_matricula_discente_serie IN (1321317, 1323105, 1320074, 1322193, 1324829, 1320149, 1324077, 1320425, 1321466, 1320072, 1321094, 1322191, 1322987, 1320325, 1322118, 1321299, 1320128, 1324908, 1324000, 1322839, 1322841, 1324879, 1321096, 1324910, 1320659, 1321093, 1324342, 1321098, 1320181, 1323087, 1320116, 1322336, 1324915, 1320423, 1323088, 1324871, 1322808, 1321223, 1321236, 1320178, 1324897, 1324888, 1322840, 1321244, 1322197, 1320084, 1320420, 1321291, 1320337, 1324558, 1320418, 1324087, 1322200, 1324918, 1324881, 1324079, 1323103, 1324305, 1322458, 1324689, 1321472, 1320311, 1322586, 1322335, 1322202, 1320104, 1323158, 1322212, 1321090, 1320126, 1324891, 1324751, 1323667, 1324889, 1321337, 1324983, 1324083, 1324317, 1321310, 1324533, 1320189, 1321241, 1324085, 1320142, 1324911, 1321465, 1320146, 1320172, 1323141, 1322487, 1322188, 1320134, 1321220, 1320422, 1320161, 1324982, 1324739, 1323084, 1320428, 1324892, 1321224, 1322187, 1324896, 1324644, 1321063, 1321332, 1320066, 1320414, 1320192, 1320103, 1321312, 1324092, 1324489, 1321246, 1322485, 1320115, 1322729, 1324306, 1320195, 1323697, 1323145, 1324821, 1320147, 1323993, 1324844, 1324627, 1324643, 1320102, 1320430, 1321294, 1320114, 1320107, 1322201, 1324555, 1321331, 1324455, 1320113, 1324866, 1322878, 1320417, 1324561, 1320187, 1323156, 1324076, 1322350, 1320086, 1320193, 1324572, 1320109, 1321084, 1321233, 1321283, 1321289, 1323989, 1323106, 1320117, 1323000, 1323120, 1324687, 1320112, 1324488, 1323085, 1321067, 1324629, 1322210, 1321095, 1324880, 1321320, 1322199, 1321297, 1320324, 1320336, 1320416, 1321309, 1324882, 1324532, 1324619, 1320421, 1320139, 1323104, 1323116, 1321227, 1320075, 1324898, 1320130, 1321099, 1321091, 1324916, 1320489, 1324753, 1324316, 1322117, 1322198, 1321334, 1324909, 1322334, 1324912, 1321322, 1324129, 1322209, 1324752, 1320415, 1320454, 1320164, 1324078, 1320160, 1321216, 1320312, 1324304, 1324369, 1320070, 1320071, 1320412, 1320163, 1324931, 1322810, 1324877, 1324307, 1323119, 1323725, 1320429, 1321300, 1322186, 1320283, 1324331, 1324080, 1320119, 1322358, 1323159, 1323100, 1320662, 1321307, 1320105, 1324919, 1323083, 1322120, 1321245, 1324082, 1324618, 1324873, 1320310, 1324878, 1324886, 1321304, 1324883, 1320171, 1320483, 1324893, 1320169, 1321097, 1322806, 1320159, 1323082, 1321082, 1320426, 1324686, 1324872, 1324890, 1324876, 1320111, 1320427, 1320068, 1320424, 1321336, 1324688, 1321230, 1324750, 1320166, 1320106, 1324539, 1321308, 1320413, 1324128, 1324320, 1324808, 1324917, 1322452, 1324341, 1323101, 1320167, 1322386, 1321293, 1324617, 1324086, 1322889, 1320419, 1324492, 1321333);


SELECT cb.id_curriculo_basico , cb.codigo  
FROM basico.curriculo_basico cb 
WHERE cb.id_curriculo_basico IN (51899750, 52472041, 52472047, 51899742);

SELECT cb.id_curriculo_basico , cb.codigo  
FROM basico.curriculo_basico cb 
WHERE cb.ano_entrada_vigor = 2026;

configuração EIP3-26  52472041

configuração EIP4-26  52472047

configuração EIPIIINT

configuração EIPIINT:


SELECT DISTINCT ra.*
--INTO TEMP insert_habilidade_resposta
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (5, 6, 7, 8);
AND ra.id_relatorio_avaliativo in (58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 104, 105, 106, 107, 108, 110, 111, 112, 113, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 141, 142, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 162, 163, 164, 165, 166, 167, 168, 176, 177, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 195, 197, 198, 199, 200, 201, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 231, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 357, 358, 359, 360, 361, 363, 364, 365, 366, 367, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 402)

configuracao_relatorio_componente_habilidade
relatorio_avaliativo_habilidade
relatorio_avaliativo_habilidade_resposta

SELECT * FROM ensino_infantil.configuracao_relatorio_componente_habilidade;

SELECT hc FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia 
WHERE id_configuracao_relatorio IN (5);


SELECT  
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=false WHERE id_configuracao_relatorio_componente_habilidade IN ( ' || string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT,',') || ');' AS solução,
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=true WHERE id_configuracao_relatorio_componente_habilidade IN ( ' || string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT,',') || ');' AS backup
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia 
WHERE id_configuracao_relatorio IN (5,6,1,4);





SELECT COUNT(crch.id_configuracao_relatorio_componente_habilidade) AS quantidade_registros, 
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=false WHERE id_configuracao_relatorio_componente_habilidade IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS solucao,
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=true  WHERE id_configuracao_relatorio_componente_habilidade IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS backup
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch  ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia
WHERE crc.id_configuracao_relatorio IN (5,6,1,4);


UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=false WHERE id_configuracao_relatorio_componente_habilidade IN ( 177, 178, 410, 412, 414, 411, 413, 233, 234, 235, 236, 237, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 415, 416, 421, 417, 419, 418, 420, 422, 423, 424, 425, 426, 427, 429, 428, 430, 432, 431, 433, 434, 435, 436, 437, 438, 439, 440, 441, 209, 211, 213, 214, 215, 210, 212, 220, 216, 217, 218, 219, 221, 222, 223, 224, 225, 226, 228, 227, 229, 230, 231, 232, 238, 239, 240, 241, 242, 243, 244, 245, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 179, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162);

