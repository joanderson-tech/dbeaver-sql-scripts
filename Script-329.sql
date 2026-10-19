
select
	*
from
	comum.pessoa p
where
	p.nome = 'ANA JULIA ARAUJO DA SILVA';

ALTER TABLE comum.pessoa ADD quilombola bool NULL DEFAULT false;

ALTER TABLE comum.pessoa DROP COLUMN quilombola;
ALTER TABLE comum.pessoa ADD quilombola boolean NULL;

ALTER TABLE comum.pessoa ADD quilombola bool NULL DEFAULT false;


alter table ensino.registro_falta_professor ADD COLUMN abonada boolean default FALSE;


[
  {
    "script": [
    "ALTER TABLE comum.pessoa ADD quilombola bool NULL DEFAULT false;"
    ],
    "database": "sigeduc"
  }
]




begin;
rollback;

ALTER TABLE comum.pessoa ADD quilombola bool NULL DEFAULT true;

ALTER TABLE comum.pessoa ADD quilombola boolean NULL;

