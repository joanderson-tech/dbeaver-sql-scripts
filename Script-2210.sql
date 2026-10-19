-- banco comum
-- banco comum
UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET senha = md5(substring(login,1,50)), email = 'desenv@esig.com.br', ramal = 1234;
UPDATE comum.parametro SET valor = 'desenv@esig.com.br' WHERE codigo IN ('2_1_1','3_1_1');
-- Inativando o envio de alerta por email.
UPDATE comum.parametro SET valor = 'false' WHERE codigo = '3_1_15';
delete from comum.parametro where codigo in ('infra.recaptchaSiteKey' , 'infra.recaptchaSecretKey');
UPDATE comum.sistema SET url = 'http://testes-professor-portalsigeduc.esig.com.br' WHERE id = 17;
UPDATE comum.parametro SET valor='https://testes-educ21-capacitacoes.esig.com.br' WHERE codigo='learning.url';
UPDATE comum.parametro SET valor='https://testes-educ21-capacitacoes-back.esig.com.br' WHERE codigo='learning_backend.url';

