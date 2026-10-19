SELECT usuario_.id_usuario, usuario_.autorizado AS autorizado585_, usuario_.data_cadastro AS data3_585_, usuario_.data_ultimo_login_mobile AS data4_585_, usuario_.email AS email585_, usuario_.expira_senha AS expira6_585_, usuario_.hash_mobile_authenticator AS hash7_585_, usuario_.id_foto AS id8_585_, usuario_.id_servidor AS id9_585_, usuario_.inativo AS inativo585_, usuario_.login AS login585_, usuario_.id_pessoa AS id15_585_, usuario_.ramal AS ramal585_, usuario_.tipo AS tipo585_, usuario_.ultimo_acesso AS ultimo13_585_, usuario_.id_unidade AS id16_585_
FROM comum.usuario usuario_
WHERE usuario_.id_usuario =?

SELECT p.id_localizacao_zona, * FROM comum.pessoa p WHERE p.id_pessoa = 54640097;

SELECT * FROM escola.localizacao_zona lz WHERE lz.id_localizacao_zona = 2;