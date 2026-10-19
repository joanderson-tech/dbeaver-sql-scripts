
UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET senha = md5(substring(login,1,25)), email = 'desenv@esig.com.br', ramal = 1234;

UPDATE comum.parametro SET valor = 'desenv@esig.com.br' WHERE codigo IN ('2_1_1','3_1_1');
DELETE FROM comum.parametro p WHERE p.codigo IN ('infra.recaptchaSiteKey', 'infra.recaptchaSecretKey');
-- Inativando o envio de alerta por email.
UPDATE comum.parametro SET valor = 'false' WHERE codigo = '3_1_15'; 
