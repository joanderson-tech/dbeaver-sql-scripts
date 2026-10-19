-- rodar essa parte no banco comum
UPDATE comum.pessoa SET email = 'desenv@esig.com.br' WHERE email IS NOT NULL AND length(email) > 0;
UPDATE comum.usuario SET senha = md5(substring(login,1,25)), email = 'desenv@esig.com.br', ramal = 1234;
UPDATE comum.parametro SET valor = 'desenv@esig.com.br' WHERE codigo IN ('2_1_1','3_1_1');
UPDATE comum.parametro SET valor = 'false' WHERE codigo = '3_1_15';
UPDATE comum.sistema SET url = 'http://testes-professor-portalsigeduc.esig.com.br' WHERE id = 17;

delete from comum.parametro where codigo in ('infra.recaptchaSiteKey' , 'infra.recaptchaSecretKey');

--

INSERT INTO comum.papel (
    id, nome, descricao,
    exige_unidade, restrito, tipo_autorizacao,
    id_sistema, id_subsistema
)
SELECT
    710,
    'Configuração do Tema',
    'Permite alterar a cor predominante do tema visual da instituição (vale para o município inteiro).',
    false,
    false,
    p.tipo_autorizacao,
    p.id_sistema,
    p.id_subsistema
FROM comum.papel p
WHERE p.id = 701
  AND NOT EXISTS (SELECT 1 FROM comum.papel existente WHERE existente.id = 710);
