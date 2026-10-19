-- banco comum
-- alter sequence entrada_seq restart with 9000000;
UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET senha = md5(login), email = 'desenv@esig.com.br', ramal = 1234;
UPDATE comum.parametro SET valor = 'desenv@esig.com.br' WHERE codigo IN ('2_1_1','3_1_1');

