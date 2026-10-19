select * from comum.pessoa p where p.nome ilike '%LEILA REGIS LELIS LIMA%;';

select * from rh.servidor s where s.id_pessoa = 51874772;



select * from ensino.docente_turma dt where dt.id_docente = 51875239 and dt.id_turma = 694725;

select * from ensino.horario_turma ht where ht.id_turma = 694725 and ativo;


EFAIM1AA --694725

EFAIV1AA --694787


-- Auto-generated SQL script #202507250857
UPDATE ensino.docente_turma SET finalizada=true WHERE id_docente_turma=58556549;


UPDATE ensino.docente_turma SET ch_dedicada_periodo=16 WHERE id_docente_turma=58556549;
