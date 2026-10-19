SELECT *
FROM comum.usuario u
WHERE u.id_usuario = 105182;

SELECT *
FROM rh.servidor s
WHERE s.id_servidor = 76718;

SELECT *
FROM comum.papel p ;

SELECT p
FROM comum.permissao pe
JOIN comum.papel p ON p.id = pe.id_papel
JOIN comum.usuario u ON u.id_usuario = pe.id_usuario
WHERE u.id_usuario = 105182;