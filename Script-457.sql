select * from atrativo_turistico_imagens ati;


Migration checksum mismatch for migration version 20230924173909
-> Applied to database : 254534146
-> Resolved locally    : 1082823452


select * from flyway_schema_history fsh ;


INSERT INTO public.flyway_schema_history (installed_rank, "version", description, "type", script, checksum, installed_by, installed_on, execution_time, success) VALUES(19, '20230924173909', 'added municipios paraiba', 'SQL', 'data/V20230924173909__added_municipios_paraiba.sql', 254534146, 'postgres', '2025-04-08 18:03:55.020', 133, true);


DELETE FROM public.flyway_schema_history WHERE installed_rank=19;
