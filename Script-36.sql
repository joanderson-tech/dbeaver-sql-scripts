select * from transporte.motorista m;

ALTER TABLE transporte.motorista
ALTER COLUMN cnh_categoria TYPE VARCHAR(2);

DELETE FROM transporte.motorista
WHERE id_motorista=60919593;
DELETE FROM transporte.motorista
WHERE id_motorista=60919591;
