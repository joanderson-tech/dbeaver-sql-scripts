ALTER TABLE transporte.rota_detalhe ALTER COLUMN sentido TYPE VARCHAR(10);

select * from transporte.veiculo v;

select * from transporte.rota ;
select * from transporte.rota_motorista rm  ;


transporte.rota set georreferenciamento_arquivo=NULL, georreferenciamento_arquivo_2=NULL, ativo='TRUE', descricao='1234567890', kmIda=2.0, km_ida_nao_pavimentada=NULL, km_ida_pavimentada=NULL, kmVolta=2.0, km_volta_nao_pavimentada=NULL, km_volta_pavimentada=NULL, georreferenciamento_link=NULL, min_ida=NULL, min_volta=NULL, id_municipio=2504009, tipo_rota=NULL, id_turno=2, id_unidade=0 where id_rota=70785267 

was aborted: ERROR: insert or update on table "rota" violates foreign key constraint "rota_id_unidade_fkey"
Detalhe: Key (id_unidade)=(0) is not present in table "unidade".