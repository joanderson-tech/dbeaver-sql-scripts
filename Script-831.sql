[
    {
        "script":[
            "create table basico.series_tce_se (id int4 not null, codigo varchar(10), descricao varchar (60), ativo boolean default true not null, constraint series_tce_se_pkey primary key (id));",
            "alter table basico.series_tce_se owner to sigeduc;",
            "create table basico.mapeamento_series_tce_se ( id_serie int4 not null, id_serie_tce int4 not null, constraint mapeamento_series_tce_se_pkey primary key (id_serie, id_serie_tce), constraint is_serie_fkey foreign key (id_serie) references basico.serie (id_serie), constraint is_serie_tce_fkey foreign key (id_serie_tce) references basico.series_tce_se (id) );",
            "alter table basico.mapeamento_series_tce_se owner to sigeduc;"
            ],
        "database":"sigeduc"
    },
    {
        "script":[
            "insert into basico.series_tce_se values (1, 'INF1', 'Educação Infantil - CRECHE (0 A 3 ANOS)'), (2, 'INF2', 'Educação Infantil - PRE-ESCOLA (4 A 5 ANOS)'), (3, 'FUN1', 'Ensino Fundamental - 1º ANO'), (4, 'FUN2', 'Ensino Fundamental - 2º ANO'), (5, 'FUN3', 'Ensino Fundamental - 3º ANO'), (6, 'FUN4', 'Ensino Fundamental - 4º ANO'), (7, 'FUN5', 'Ensino Fundamental - 5º ANO'), (8, 'FUN6', 'Ensino Fundamental - 6º ANO'), (9, 'FUN7', 'Ensino Fundamental - 7º ANO'), (10, 'FUN8', 'Ensino Fundamental - 8º ANO'), (11, 'FUN9', 'Ensino Fundamental - 9º ANO'), (12, 'EJA1', 'EJA - 1º ao 5º ANO FUNDAMENTAL'), (13, 'EJA2', 'EJA - 6º ao 9º ANO FUNDAMENTAL'), (14, 'AEE1', 'Atendimento Educacional Especializado'), (15, 'COM1', 'Atividade Complementar');",
            "insert into basico.mapeamento_series_tce_se values (1005259, 14), (51869713, 1), (51869716, 1), (51872940, 1), (51872941, 1), (52027478, 1), (51869714, 2), (51869715, 2), (53182178, 8), (15289953, 12), (15289982, 12), (15289983, 12), (51873708, 12), (15290011, 13), (15290013, 13), (51873709, 13), (51873710, 13), (51973127, 12), (51961954, 12), (51977261, 12), (1005223, 8), (1005224, 9), (1005225, 10), (1005226, 11), (1005218, 3), (1005219, 4), (1005220, 5), (1005221, 6), (1005222, 7), (51973321, 3);"
            ],
        "database":"sigeduc",
        "cities":["nossasenhoradosocorro-se"]
    },
    {
        "script":[
            "insert into basico.series_tce_se values (1, 'INF1', 'Educação Infantil - CRECHE (0 A 3 ANOS)'), (2, 'INF2', 'Educação Infantil - PRE-ESCOLA (4 A 5 ANOS)'), (3, 'FUN1', 'Ensino Fundamental - 1º ANO'), (4, 'FUN2', 'Ensino Fundamental - 2º ANO'), (5, 'FUN3', 'Ensino Fundamental - 3º ANO'), (6, 'FUN4', 'Ensino Fundamental - 4º ANO'), (7, 'FUN5', 'Ensino Fundamental - 5º ANO'), (8, 'FUN6', 'Ensino Fundamental - 6º ANO'), (9, 'FUN7', 'Ensino Fundamental - 7º ANO'), (10, 'FUN8', 'Ensino Fundamental - 8º ANO'), (11, 'FUN9', 'Ensino Fundamental - 9º ANO'), (12, 'EJA1', 'EJA - 1º ao 5º ANO FUNDAMENTAL'), (13, 'EJA2', 'EJA - 6º ao 9º ANO FUNDAMENTAL'), (14, 'AEE1', 'Atendimento Educacional Especializado'), (15, 'COM1', 'Atividade Complementar');",
            "insert into basico.mapeamento_series_tce_se values (51869716, 1), (51870341, 1), (51900646, 1), (51922591, 1), (51900644, 2), (51869715, 2), (51869714, 2), (1005223, 8), (1005224, 9), (1005225, 10), (1005226, 11), (1005218, 3), (1005219, 4), (1005220, 5), (1005221, 6), (1005222, 7), (1005339, 3), (52280104, 5), (15289953, 12), (15289982, 12), (52259936, 12), (15289983, 12), (1005302, 12), (52258815, 12);"
            ],
        "database":"sigeduc",
        "cities":["telha-se"]
    }
]