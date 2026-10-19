SELECT * FROM comum.papel p WHERE p.id_subsistema  = 20;


SELECT EXISTS ( SELECT 1 FROM comum.papel p WHERE p.id_sistema = 20);
