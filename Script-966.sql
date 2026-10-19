select distinct rac.id_matricula_componente, ra.id_relatorio_avaliativo, rac.id_relatorio_avaliativo_componente , mc2.id_matricula_componente AS id_matricula_componente_mc2
from  basico.matricula_estudante_serie mes
join ensino_infantil.relatorio_avaliativo ra on ra.id_matricula_discente_serie = mes.id_matricula_discente_serie
join ensino_infantil.relatorio_avaliativo_componente rac on rac.id_relatorio_avaliativo = ra.id_relatorio_avaliativo 
join  ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
join ensino.matricula_componente mc2 on mc2.id_discente = mc.id_discente 
and mc2.id_turma = mc.id_turma 
and mc2.id_situacao_matricula = 2
where ra.id_matricula_discente_serie in (1327733, 1327692, 1327706, 1327708, 1327729, 1327737, 1327740, 1327744, 1327747, 1327764, 1327766, 1327770, 1327776, 1327780, 1327781, 1327783, 1327784, 1327785, 1327788, 1327818, 1328075)

select * from  ensino_infantil.relatorio_avaliativo_componente
--SET id_matricula_componente = 17146691
WHERE id_relatorio_avaliativo_componente = 23829;

select string_agg(id_relatorio_avaliativo :: varchar, ', ')
from  ensino_infantil.relatorio_avaliativo_componente rac
join  ensino.matricula_componente mc on mc.id_matricula_componente = rac.id_matricula_componente
where mc.id_matricula_estudante_serie  in (1327733, 1327692, 1327706, 1327708, 1327729, 1327737, 1327740, 1327744, 1327747, 1327764, 1327766, 1327770, 1327776, 1327780, 1327781, 1327783, 1327784, 1327785, 1327788, 1327818, 1328075)
and mc.id_situacao_matricula = 2;



SELECT string_agg(id_relatorio_avaliativo :: varchar, ', ')
FROM ensino_infantil.relatorio_avaliativo AS ra
where ra.id_matricula_discente_serie  in (1327733, 1327692, 1327706, 1327708, 1327729, 1327737, 1327740, 1327744, 1327747, 1327764, 1327766, 1327770, 1327776, 1327780, 1327781, 1327783, 1327784, 1327785, 1327788, 1327818, 1328075)
and ativo = false;
--3442, 3449, 3057, 3445, 2468, 3446, 3447, 3055, 3056, 3064, 3068, 3430, 3431, 3436, 3428, 3581, 3582, 3656, 3361, 3424, 3054

SELECT * --string_agg(id_relatorio_avaliativo :: varchar, ', ')
FROM ensino_infantil.relatorio_avaliativo AS ra
where ra.id_matricula_discente_serie  in (1327733, 1327692, 1327706, 1327708, 1327729, 1327737, 1327740, 1327744, 1327747, 1327764, 1327766, 1327770, 1327776, 1327780, 1327781, 1327783, 1327784, 1327785, 1327788, 1327818, 1328075)
--and ativo = true;
--4236, 4679, 4680, 4681, 4682, 4683, 4618, 4684, 4238


select * from ensino_infantil.relatorio_avaliativo WHERE id_relatorio_avaliativo in (3054, 4238);

UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true
	WHERE id_relatorio_avaliativo=3054;

-- Auto-generated SQL script #202508131517
UPDATE ensino_infantil.relatorio_avaliativo
	SET ativo=true
	WHERE id_relatorio_avaliativo=3054;
UPDATE ensino_infantil.relatorio_avaliativo
	SET ativo=false
	WHERE id_relatorio_avaliativo=4238;


begin;

-- Criando uma tabela temporária para armazenar os dados originais
CREATE TEMPORARY TABLE backup_relatorio_avaliativo AS
SELECT
    ra.id_relatorio_avaliativo,
    ra.ativo
FROM
    ensino_infantil.relatorio_avaliativo ra
WHERE
    ra.id_matricula_discente_serie IN (
        1327733, 1327692, 1327706, 1327708, 1327729, 1327737,
        1327740, 1327744, 1327747, 1327764, 1327766, 1327770,
        1327776, 1327780, 1327781, 1327783, 1327784, 1327785,
        1327788, 1327818, 1328075
    );

-- Opcional: Verifique se a tabela de backup foi criada corretamente
SELECT * FROM backup_relatorio_avaliativo;

-- UPDATE 1: Atualiza os registros que eram 'true' para 'false'
UPDATE ensino_infantil.relatorio_avaliativo rac_original
SET
    ativo = false
FROM
    backup_relatorio_avaliativo ttr
WHERE
    rac_original.id_relatorio_avaliativo = ttr.id_relatorio_avaliativo
    AND ttr.ativo = true;

-- UPDATE 2: Atualiza os registros que eram 'false' para 'true'
UPDATE ensino_infantil.relatorio_avaliativo rac_original
SET
    ativo = true
FROM
    backup_relatorio_avaliativo ttr
WHERE
    rac_original.id_relatorio_avaliativo = ttr.id_relatorio_avaliativo
    AND ttr.ativo = false;



--backup do ativo
SELECT 'UPDATE ensino_infantil.relatorio_avaliativo SET ativo=true WHERE id_relatorio_avaliativo = ' || ttr.id_relatorio_avaliativo || ';'
FROM backup_relatorio_avaliativo ttr where ttr.ativo;

SELECT 'UPDATE ensino_infantil.relatorio_avaliativo SET ativo = false WHERE id_relatorio_avaliativo = ' || ttr.id_relatorio_avaliativo || ';'
FROM backup_relatorio_avaliativo ttr where ttr.ativo = false;


commit;
rollback;

