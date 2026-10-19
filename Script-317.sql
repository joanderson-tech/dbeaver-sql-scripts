SELECT * 
FROM comum.pessoa p; 

select * from comum.tipo_tamanho_fardamento;


begin;

commit;
ALTER TABLE comum.pessoa 
ADD genero bpchar(50) NULL DEFAULT NULL;

ALTER TABLE comum.pessoa ADD genero varchar(50) NULL DEFAULT NULL;

ALTER TABLE comum.pessoa ADD genero bpchar(50) NULL DEFAULT NULL;

ALTER TABLE comum.pessoa ADD genero varchar(80) NULL;



ALTER TABLE comum.pessoa 
DROP COLUMN genero;