
UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET senha = md5(substring(login,1,50)), email = 'desenv@esig.com.br', ramal = 1234;
UPDATE comum.parametro SET valor = 'desenv@esig.com.br' WHERE codigo IN ('2_1_1','3_1_1');
-- Inativando o envio de alerta por email.
UPDATE comum.parametro SET valor = 'false' WHERE codigo = '3_1_15';
delete from comum.parametro where codigo in ('infra.recaptchaSiteKey' , 'infra.recaptchaSecretKey');
UPDATE comum.sistema SET url = 'http://testes-professor-portalsigeduc.esig.com.br' WHERE id = 17;
UPDATE comum.parametro SET valor='https://educ21-learn-qa.esig.com.br' WHERE codigo='learning.url';
UPDATE comum.parametro SET valor='https://learn-backend-qa.quark.tec.br' WHERE codigo='learning_backend.url';



INSERT INTO comum.parametro (nome, descricao, valor, id_sistema, codigo, tempo_maximo, tipo, bloquear_alteracao)  VALUES('NOME_RELATORIO_FINAL_POLIVALENTE', 'Define qual nome será exibido na funcionalidade de relatório final em turmas polivalentes por nota', 'Relatórios', 2, 'diario.nomeRelatorioFinalPolivalente', 0, 12, false) on conflict do nothing;