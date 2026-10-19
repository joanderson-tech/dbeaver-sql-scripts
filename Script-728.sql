select mc.id_componente_curricular , mc.id_turma -- string_agg(id_matricula_componente   ::varchar, ', ')
from ensino.matricula_componente mc where id_discente = 973694  and mc.id_turma in (685534, 685530, 685533, 685532, 685526, 685528, 685527, 685529, 685531)  and id_situacao_matricula = 5;
