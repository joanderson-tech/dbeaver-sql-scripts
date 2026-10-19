SELECT * FROM ensino_infantil.relatorio_avaliativo_habilidade_resposta;


SELECT cr.id_configuracao_relatorio, ts.* FROM basico.turma_serie ts 
JOIN basico.curriculo_basico cb ON ts.id_curriculo_medio = cb.id_curriculo_basico 
JOIN ensino_infantil.configuracao_relatorio cr on cr.id_curriculo_basico = cb.id_curriculo_basico 
 WHERE cr.id_configuracao_relatorio IN (5,6,4)
 AND ts.ativo 
 AND ts.id_escola = 51877802;


SELECT DISTINCT hr.*
--INTO TEMP insert_habilidade_resposta
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON
rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (1,5,6,4);


SELECT 
    COUNT(DISTINCT ra.id_relatorio_avaliativo) AS quantidade_registros,
    'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo IN (' || string_agg(DISTINCT ra.id_relatorio_avaliativo::TEXT, ', ')  || ');' AS solucao,
    'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=' || ra.ativo::TEXT || ', id_situacao_relatorio_avaliativo=' || ra.id_situacao_relatorio_avaliativo::TEXT || ' WHERE id_relatorio_avaliativo IN (' || string_agg(DISTINCT ra.id_relatorio_avaliativo::TEXT, ', ') || ');' AS backup
FROM ensino_infantil.relatorio_avaliativo ra
JOIN ensino_infantil.relatorio_avaliativo_componente rac ON rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
JOIN ensino_infantil.relatorio_avaliativo_habilidade rah ON rah.id_relatorio_avaliativo_componente = rac.id_relatorio_avaliativo_componente
JOIN ensino_infantil.relatorio_avaliativo_habilidade_resposta hr ON hr.id_relatorio_avaliativo_habilidade = rah.id_relatorio_avaliativo_habilidade
WHERE ra.id_configuracao_relatorio IN (1, 5, 6, 4)
AND ra.ativo = true
GROUP BY ra.ativo, ra.id_situacao_relatorio_avaliativo;


UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo IN (100, 101, 104, 105, 106, 107, 108, 111, 112, 113, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 141, 142, 144, 145, 146, 147, 148, 149, 150, 162, 163, 164, 165, 166, 167, 168, 176, 177, 180, 181, 183, 184, 185, 186, 187, 189, 190, 193, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 231, 251, 252, 253, 255, 322, 323, 324, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 350, 357, 358, 359, 360, 361, 364, 365, 366, 367, 368, 369, 371, 372, 373, 379, 380, 381, 392, 403, 404, 418, 419, 420, 421, 422, 423, 424, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 89, 90, 91, 92, 94, 95);
UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo IN (254, 391, 393, 394, 395, 396, 397, 398, 399, 400, 402, 411, 412, 413, 414, 415);
UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo IN (188);



UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true, id_situacao_relatorio_avaliativo=1 WHERE id_relatorio_avaliativo IN (100, 101, 104, 105, 106, 107, 108, 111, 112, 113, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 141, 142, 144, 145, 146, 147, 148, 149, 150, 162, 163, 164, 165, 166, 167, 168, 176, 177, 180, 181, 183, 184, 185, 186, 187, 189, 190, 193, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 231, 251, 252, 253, 255, 322, 323, 324, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 350, 357, 358, 359, 360, 361, 364, 365, 366, 367, 368, 369, 371, 372, 373, 379, 380, 381, 392, 403, 404, 418, 419, 420, 421, 422, 423, 424, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 89, 90, 91, 92, 94, 95);
UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true, id_situacao_relatorio_avaliativo=2 WHERE id_relatorio_avaliativo IN (254, 391, 393, 394, 395, 396, 397, 398, 399, 400, 402, 411, 412, 413, 414, 415);
UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo IN (188);

SELECT DISTINCT crch.*
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch  ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia
WHERE crc.id_configuracao_relatorio IN (5,6,4)
AND crc.ativo 
AND crch.ativo;

SELECT * FROM ensino_infantil.relatorio_avaliativo_habilidade rah WHERE rah.id_configuracao_relatorio_componente_habilidade  IN ( 149, 381, 180, 150, 382, 181, 151, 383, 182, 152, 384, 183, 153, 385, 184, 185, 154, 386, 186, 155, 387, 187, 156, 388, 188, 157, 389, 189, 158, 390, 190, 159, 391, 191, 160, 392, 192, 161, 393, 193, 162, 394, 194, 163, 395, 195, 164, 396, 196, 165, 397, 197, 166, 398, 399, 198, 167, 400, 199, 168, 401, 200, 169, 402, 201, 170, 403, 202, 171, 404, 203, 172, 405, 204, 173, 406, 205, 174, 407, 206, 175, 408, 207, 176, 409, 208, 179, 224, 425, 225, 426, 226, 427, 228, 429, 227, 428, 229, 430, 230, 432, 231, 431, 232, 433, 238, 434, 239, 435, 240, 436, 241, 437, 438, 242, 439, 243, 440, 244, 178, 441, 245, 177, 410, 209, 412, 211, 414, 213, 415, 214, 215, 416, 411, 210, 413, 212, 220, 421, 216, 417, 217, 419, 218, 418, 219, 420, 221, 422, 222, 423, 223, 424, 234, 233, 235, 236, 237);



SELECT * from ensino_infantil.configuracao_relatorio_componente_habilidade  
WHERE id_configuracao_relatorio_componente_habilidade IN ( 149, 381, 180, 150, 382, 181, 151, 383, 182, 152, 384, 183, 153, 385, 184, 185, 154, 386, 186, 155, 387, 187, 156, 388, 188, 157, 389, 189, 158, 390, 190, 159, 391, 191, 160, 392, 192, 161, 393, 193, 162, 394, 194, 163, 395, 195, 164, 396, 196, 165, 397, 197, 166, 398, 399, 198, 167, 400, 199, 168, 401, 200, 169, 402, 201, 170, 403, 202, 171, 404, 203, 172, 405, 204, 173, 406, 205, 174, 407, 206, 175, 408, 207, 176, 409, 208, 179, 224, 425, 225, 426, 226, 427, 228, 429, 227, 428, 229, 430, 230, 432, 231, 431, 232, 433, 238, 434, 239, 435, 240, 436, 241, 437, 438, 242, 439, 243, 440, 244, 178, 441, 245, 177, 410, 209, 412, 211, 414, 213, 415, 214, 215, 416, 411, 210, 413, 212, 220, 421, 216, 417, 217, 419, 218, 418, 219, 420, 221, 422, 222, 423, 223, 424, 234, 233, 235, 236, 237);

SELECT * FROM ensino_infantil.relatorio_avaliativo_habilidade rah WHERE rah.id_configuracao_relatorio_componente_habilidade  IN (441 );




Erro SQL [23503]: ERRO: atualização ou exclusão em tabela "relatorio_avaliativo_habilidade" viola restrição de chave estrangeira "relatorio_avaliativo_habilidade_fk" em "relatorio_avaliativo_habilidade_resposta"
  Detalhe: Chave (id_relatorio_avaliativo_habilidade)=(6934) ainda é referenciada pela tabela "relatorio_avaliativo_habilidade_resposta".
  
  
BEGIN;

ROLLBACK;


DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=6934;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=7614;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=7646;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=7678;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=7710;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=7887;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=8066;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=8098;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=8130;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=8162;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=8341;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=8373;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=9373;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=9405;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=9768;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=9800;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=11003;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=11035;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=13879;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=14379;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=14411;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=14443;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=14475;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=14507;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=14920;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=18378;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=18788;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=21130;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=30893;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=30925;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=30957;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31136;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31168;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31200;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31232;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31264;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31296;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31328;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31360;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31392;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=31424;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=33514;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=34302;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=34334;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=34366;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=34398;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=34430;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=34735;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=34767;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=34799;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=34831;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=36012;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38393;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38425;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38457;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38489;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38521;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38805;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38837;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38869;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38901;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38933;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38965;
DELETE FROM ensino_infantil.relatorio_avaliativo_habilidade WHERE id_relatorio_avaliativo_habilidade=38997;


DELETE FROM ensino_infantil.configuracao_relatorio_componente_habilidade WHERE id_configuracao_relatorio_componente_habilidade=441;


Erro SQL [23503]: ERRO: atualização ou exclusão em tabela "configuracao_relatorio_componente_habilidade" viola restrição de chave estrangeira "configuracao_relatorio_componente_habilidade_fk" em "relatorio_avaliativo_habilidade"
  Detalhe: Chave (id_configuracao_relatorio_componente_habilidade)=(441) ainda é referenciada pela tabela "relatorio_avaliativo_habilidade".

Posição do erro:

EIP3-26

configuração EIP4-26

configuração EIPIIINT

Observação sobre a configuração EIPIINT

SELECT 
'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo  IN ( '|| string_agg(id_relatorio_avaliativo::TEXT, ', ') || ');' AS solucao,
'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true, id_situacao_relatorio_avaliativo='||ra.id_situacao_relatorio_avaliativo||' WHERE id_relatorio_avaliativo  IN ( '|| string_agg(id_relatorio_avaliativo::TEXT, ', ') || ');' AS backup
FROM ensino_infantil.relatorio_avaliativo ra WHERE ra.id_configuracao_relatorio IN (5, 6, 7, 8);

SELECT cr.codigo  , * FROM ensino_infantil.configuracao_relatorio cr WHERE cr.ativo ;

-- Auto-generated SQL script #202609281025
'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false WHERE id_relatorio_avaliativo  IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS solucao,


SELECT crch.* FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente 
WHERE id_configuracao_relatorio IN (5)
AND crch.id_habilidade_competencia IN (51869907, 51869908, 51869909, 51869910, 51869911, 51869912, 51869913, 51869914, 51869915, 51869916, 51869917, 51869918, 51869919, 51869920, 51869921, 51869922, 51869923, 51869924, 51869925, 51869926, 51869927, 51869928, 51869929, 51869930, 51869931, 51869932, 51869933, 51869934, 51869935);


-- Auto-generated SQL script #202609251745
UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=false   
WHERE id_configuracao_relatorio_componente_habilidade IN (381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409);



SELECT COUNT(ra.id_relatorio_avaliativo) AS quantidade_registros, 
'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false WHERE id_relatorio_avaliativo  IN ( '|| string_agg(id_relatorio_avaliativo::TEXT, ', ') || ');' AS solucao,
'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true  WHERE id_relatorio_avaliativo  IN ( '|| string_agg(id_relatorio_avaliativo::TEXT, ', ') || ');' AS backup
FROM ensino_infantil.relatorio_avaliativo ra WHERE ra.id_configuracao_relatorio IN (4, 5, 6)
AND ra.ativo
GROUP BY ra.id_situacao_relatorio_avaliativo;

SELECT COUNT(crch.id_configuracao_relatorio_componente_habilidade) AS quantidade_registros, 
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=false WHERE id_configuracao_relatorio_componente_habilidade IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS solucao,
'UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=true  WHERE id_configuracao_relatorio_componente_habilidade IN ( '|| string_agg(crch.id_configuracao_relatorio_componente_habilidade::TEXT, ', ') || ');' AS backup
FROM ensino_infantil.configuracao_relatorio_componente crc
JOIN ensino_infantil.configuracao_relatorio_componente_habilidade crch  ON crch.id_configuracao_relatorio_componente = crc.id_configuracao_relatorio_componente
JOIN ensino_infantil.habilidade_competencia hc ON hc.id_habilidade_competencia = crch.id_habilidade_competencia
WHERE crc.id_configuracao_relatorio IN (4, 5, 6)
AND crc.ativo ;


UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo  IN ( 251, 350, 61, 368, 78, 369, 130, 135, 131, 136, 150, 107, 137, 149, 87, 145, 144, 193, 184, 122, 147, 81, 129, 123, 141, 124, 148, 403, 79, 380, 104, 190, 326, 365, 371, 330, 372, 373, 331, 332, 113, 177, 361, 225, 162, 163, 105, 164, 165, 176, 187, 381, 132, 125, 117, 367, 91, 92, 404, 94, 138, 95, 85, 100, 181, 166, 180, 335, 366, 357, 358, 359, 360, 167, 168, 185, 231, 186, 221, 183, 224, 226, 223, 222, 227, 228, 229, 364, 83, 120, 82, 101, 118, 121, 128, 106, 392, 134, 333, 189, 252, 254, 80, 62, 323, 220, 327, 329, 64, 379, 63, 65, 66, 67, 68, 253, 255, 71, 69, 90, 89, 72, 70, 73, 112, 324, 74, 328, 334, 75, 59, 60, 76, 322, 86, 126, 142, 133, 58, 108, 84, 146, 119, 127, 116, 111);
UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo  IN ( 397, 398, 391, 399, 400, 393, 394, 395, 402, 396);
UPDATE ensino_infantil.relatorio_avaliativo SET ativo=false, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo  IN ( 188);

UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=false WHERE id_configuracao_relatorio_componente_habilidade IN ( 410, 412, 414, 411, 413, 233, 234, 235, 236, 237, 180, 181, 182, 183, 184, 185, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 186, 187, 188, 189, 190, 381, 382, 209, 211, 213, 214, 215, 210, 212, 220, 216, 217, 218, 219, 221, 222, 223, 224, 225, 226, 228, 227, 229, 230, 231, 232, 238, 239, 240, 241, 242, 243, 244, 245, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 415, 416, 421, 417, 419, 418, 420, 422, 423, 424, 425, 426, 427, 429, 428, 430, 432, 431, 433, 434, 435, 436, 437, 438, 439, 440, 441, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409);


---

UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true, id_situacao_relatorio_avaliativo=1 WHERE id_relatorio_avaliativo  IN ( 251, 350, 61, 368, 78, 369, 130, 135, 131, 136, 150, 107, 137, 149, 87, 145, 144, 193, 184, 122, 147, 81, 129, 123, 141, 124, 148, 403, 79, 380, 104, 190, 326, 365, 371, 330, 372, 373, 331, 332, 113, 177, 361, 225, 162, 163, 105, 164, 165, 176, 187, 381, 132, 125, 117, 367, 91, 92, 404, 94, 138, 95, 85, 100, 181, 166, 180, 335, 366, 357, 358, 359, 360, 167, 168, 185, 231, 186, 221, 183, 224, 226, 223, 222, 227, 228, 229, 364, 83, 120, 82, 101, 118, 121, 128, 106, 392, 134, 333, 189, 252, 254, 80, 62, 323, 220, 327, 329, 64, 379, 63, 65, 66, 67, 68, 253, 255, 71, 69, 90, 89, 72, 70, 73, 112, 324, 74, 328, 334, 75, 59, 60, 76, 322, 86, 126, 142, 133, 58, 108, 84, 146, 119, 127, 116, 111);
UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true, id_situacao_relatorio_avaliativo=2 WHERE id_relatorio_avaliativo  IN ( 397, 398, 391, 399, 400, 393, 394, 395, 402, 396);
UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true, id_situacao_relatorio_avaliativo=4 WHERE id_relatorio_avaliativo  IN ( 188);

UPDATE ensino_infantil.configuracao_relatorio_componente_habilidade SET ativo=true WHERE id_configuracao_relatorio_componente_habilidade IN ( 410, 412, 414, 411, 413, 233, 234, 235, 236, 237, 180, 181, 182, 183, 184, 185, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 186, 187, 188, 189, 190, 381, 382, 209, 211, 213, 214, 215, 210, 212, 220, 216, 217, 218, 219, 221, 222, 223, 224, 225, 226, 228, 227, 229, 230, 231, 232, 238, 239, 240, 241, 242, 243, 244, 245, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 415, 416, 421, 417, 419, 418, 420, 422, 423, 424, 425, 426, 427, 429, 428, 430, 432, 431, 433, 434, 435, 436, 437, 438, 439, 440, 441, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409);
