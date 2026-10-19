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


EFAFV6A Ciências teve dois lancamento de frequencia nas datas 2025-04-25 12:00:41.513
2025-07-16 10:55:26.475 que foi respectivamente 1 e 2 bimestre  

EFAFV6A Ensino Religioso teve dois lancamento de frequencia nas datas 2025-04-25 11:41:09.104
2025-07-16 09:45:24.007 que foi respectivamente 1 e 2 bimestre  

EFAFV6B Ciências teve dois lancamento de frequencia nas datas 2025-05-09 12:11:03.661
2025-07-16 11:11:32.422 que foi respectivamente 1 e 2 bimestre  

EFAFV6B Ensino Religioso teve dois lancamento de frequencia nas datas 2025-04-25 11:46:23.420
2025-07-16 10:02:31.470 que foi respectivamente 1 e 2 bimestre  

EFAFV7A Ensino Religioso teve dois lancamento de frequencia nas datas 2025-04-29 10:58:30.328,
2025-07-18 11:21:12.998 e 2025-09-30 10:14:44.465 que foi respectivamente 1, 2 e 3 bimestre  

EFAFV7B Ensino Religioso teve dois lancamento de frequencia nas datas 2025-05-06 10:56:24.650
2025-07-18 11:32:49.505 que foi respectivamente 1, 2 bimestre  

EFAFV8A Ensino Religioso teve tres lancamento de frequencia nas datas 2025-05-08 11:19:47.354
2025-07-18 11:52:39.169 e 2025-07-22 11:40:54.901 mas não teva populdado nada DO 3 bimestre so tem 1, 2 bimestre

EFAFV8B Ensino Religioso teve tres lancamento de frequencia nas datas 2025-05-06 11:03:37.960
2025-05-08 11:14:56.655 e 2025-07-22 11:39:55.097 mas não teva populdado nada DO 3 bimestre so tem 1, 2 bimestre



