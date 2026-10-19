SELECT p
FROM comum.permissao pe
JOIN comum.papel p ON p.id = pe.id_papel
JOIN comum.usuario u ON u.id_usuario = pe.id_usuario
WHERE u.id_usuario = 105182;