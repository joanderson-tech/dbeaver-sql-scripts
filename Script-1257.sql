SELECT p.id_pessoa, p.nome, u.login, t.id_turma_serie, t.codigo, t.id_turma, t.id_disciplina
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
JOIN rh.servidor s ON
s.id_pessoa = p.id_pessoa
JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
JOIN ensino.turma t ON
t.id_turma = dt.id_turma
WHERE dt.ativo
AND u.login = 'missocaninde@hotmail.com'
AND t.ano = 2025;

SELECT nu.*
--string_agg(nu.id_nota_unidade :: varchar ,  ','  ) 
FROM ensino.turma t
JOIN ensino.matricula_componente mc ON
mc.id_turma = t.id_turma
JOIN ensino.nota_unidade nu ON
nu.id_matricula_componente = mc.id_matricula_componente
WHERE t.id_turma = 710750
--AND nu.unidade = 2
AND mc.id_matricula_estudante_serie = 1365912;

SELECT mes.id_matricula_discente_serie,*
FROM comum.pessoa p
JOIN discente d ON
d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
WHERE p.nome ILIKE '%ÂNGELO GABRIEL SILVA DO NASCIMENTO%'
AND mes.ano_calendario = 2025;


SELECT * FROM comum.usuario u2 WHERE u2.id_usuario = 105207;


