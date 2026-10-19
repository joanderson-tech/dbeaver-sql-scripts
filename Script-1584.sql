SELECT * FROM matricula.calendario_matricula cm;


ALTER TABLE matricula.calendario_matricula
ADD COLUMN data_inicio_transf_int_proprio_semestral TIMESTAMP NULL;
