--15/01/2026 e 15/04/2026


61093433, 70928433, 61015164, 70938637, 70935978, 70936055, 70937801, 73051907, 61015682, 61015743, 61015772, 70943086, 61087574, 70955606

SELECT rd.*
FROM transporte.rota r
JOIN ensino.turno t ON t.id_turno = r.id_turno 
JOIN transporte.rota_discente rd ON r.id_rota = rd.id_rota 
JOIN discente d ON d.id_discente = rd.id_discente 
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
WHERE r.descricao IN ( '163', '164')
AND rd.data_inicio > '2026-01-12'
AND rd.ativo ;
ORDER BY r.descricao, p.nome, t.descricao ;


'40995','40996','40997','40999','41000','41001','41002','41003','41004','41005','41006','41008','41009','41010','41011','41012','41013','41014','41015','41016','41017','41018','41020','41021','41022','41023','41024','41025','41026','41027','41028','41030','41031','41032','41033','41034','41035','41048','41050','41051','41052','41053','41055','41056','41057','41058','41059','41060','41061','41062','41064','41065','41066','41067','41068','41069','41072','41073','41074','41075','41076','41078','41079','41080','41081','41082','41083','41085','41086','41138','41139','41140','41141','41142','41143','41615','41806','41807','41808','41810','41812','41813','41814','41816','41817','41818','41819','41822','41824','41825','41826','41829','41830','41831','41832','41834','41835','41837','41838','41839','41840','41841','41855','41856','41857','41858','41859','41860','41863','41864','41865','41867','41868','41870','41871','41873','41875','41876','41877','41879','41880','41987','41990','41991','41992','41994','41996','41997','41998','42000','42001','42002','42003','42004','42005','42006','42007','42009','42010','42011','42013','42016','42017','42018','42019','42020','42023','42024','42025','42026','42028','42030','42032','42033','42034','42035','42036','42037','42146','42148','42149','42150','42153','42154','42155','42156','42157','42158','42159','42161','42162','42163','42164','42165','42166','42167','42168'


SELECT * FROM transporte.movimentacao_rota_discente mrd ;

SELECT distinct  r.id_rota 
FROM transporte.rota r
WHERE r.descricao IN ('163', '164' )--, '218', '71', '162', '163', '164', '168');

SELECT STRING_AGG(quote_literal(r.id_rota), ', ') AS lista_formatada
FROM transporte.rota r
WHERE r.descricao IN ('106', '218', '71', '162', '163', '164', '168');


SELECT p.nome FROM comum.registro_entrada re 
JOIN comum.usuario u ON u.id_usuario = re.id_usuario 
JOIN comum.pessoa p ON p.id_pessoa = u.id_pessoa 
WHERE re.id_entrada IN (8116047, )

SELECT * FROM comum.usuario u WHERE u.id_usuario = 105310;

SELECT p.nome 
FROM comum.registro_entrada re 
JOIN comum.usuario u ON u.id_usuario = re.id_usuario 
JOIN comum.pessoa p ON p.id_pessoa = u.id_pessoa 
WHERE u.id_usuario = 105310;

SELECT *
FROM transporte.rota r WHERE r.id_rota IN (41816, 42149, 42154);


SELECT p.nome AS NOME, r.descricao AS ROTA, t.descricao AS TURNO
FROM transporte.rota r
JOIN ensino.turno t ON t.id_turno = r.id_turno 
JOIN transporte.rota_discente rd ON r.id_rota = rd.id_rota 
JOIN discente d ON d.id_discente = rd.id_discente 
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
WHERE d.id_discente IN (1366190, 1395565, 1351535);


SELECT p.nome, d.id_discente, mes.id_matricula_discente_serie, mes.id_situacao_matricula_serie 
FROM discente d
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
WHERE d.id_discente IN (1366190, 1395565, 1351535)
AND mes.ano_calendario = 2026;

SELECT r.descricao AS ROTA, t.descricao AS TURNO 
FROM transporte.rota r 
JOIN ensino.turno t ON t.id_turno = r.id_turno 
WHERE r.id_rota IN (70938637,61015164);

SELECT 
    p.nome,
    r.descricao AS rota,
    t.descricao AS turno,
    d.id_discente 
FROM discente d
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
JOIN transporte.rota r ON r.id_rota = CASE 
    WHEN d.id_discente = 1366190 THEN 70938637
    WHEN d.id_discente IN (1395565, 1351535) THEN 61015164
END
JOIN ensino.turno t ON t.id_turno = r.id_turno
WHERE d.id_discente IN (1366190, 1395565, 1351535)




SELECT  r.*
FROM transporte.rota r
--JOIN ensino.turno t ON t.id_turno = r.id_turno 
JOIN transporte.rota_discente rd ON r.id_rota = rd.id_rota 
JOIN discente d ON d.id_discente = rd.id_discente 
--JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
WHERE rd.id_discente IN (1395565, 1351535, 1366190)
AND rd.data_inicio > '2026-01-01'
--ORDER BY r.descricao,p.nome, t.descricao ;




24/04/2026 10:03:20
05/05/2026 07:32:54
05/05/2026 07:42:44



'70938637', '61015164', '61015164'





BEGIN;


CREATE TABLE public.carga_logs_temp (
    operacao VARCHAR(20),
    id_discente BIGINT,
    id_rota BIGINT,
    data_referencia TIMESTAMP
);


ROLLBACK;