
select
	*
from
	comum.pessoa p
where
	p.nome = 'EUDES ANDRADE DE BARROS';


ALTER TABLE comum.pessoa ADD quilombola bool NULL DEFAULT false;

ALTER TABLE comum.pessoa DROP COLUMN quilombola;
ALTER TABLE comum.pessoa ADD quilombola boolean NULL;
ALTER TABLE comum.pessoa ADD quilombola bool NULL DEFAULT false;


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

