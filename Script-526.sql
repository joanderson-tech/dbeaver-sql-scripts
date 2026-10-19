begin;
rollback;


UPDATE comum.sistema SET url = 'http://testes-professor-portalsigeduc.esig.com.br' WHERE id = 17;