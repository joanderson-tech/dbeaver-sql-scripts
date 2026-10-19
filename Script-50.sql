select *
from ensino_infantil.parecer_descritivo_individual pdi 
where pdi.id_matricula_discente_serie in (1331732,
1334784,
1338675,
1343757,
1350683,
1354127);

SELECT x.* FROM public.discente x
WHERE matricula  = '202352763470'

982643

SELECT x.* FROM basico.matricula_estudante_serie x
WHERE id_estudante  = 982643

BEGIN;

commit;

ROLLBACK;

ALTER TABLE ensino_infantil.parecer_descritivo_individual
ALTER COLUMN descricao TYPE VARCHAR(10000);

ALTER TABLE ensino_infantil.parecer_descritivo_individual ALTER COLUMN descricao TYPE varchar USING descricao::varchar;


1331732,
1334784,
1338675,
1343757,
1350683,
1354127