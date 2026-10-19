SELECT *
FROM escola.escola e
WHERE e.nome ILIKE '%COL MUL RITA JUVENTINA DE SOUZA%';

/*EFAFV7B, EFAFV7A, EFAFV6A e EFAFV6B


52056838   EFAFV6A, 
52057058   EFAFV6B, 
52057124   EFAFV7A, 
52057125   EFAFV7B*/;

SELECT cc.nome, ta.* FROM ava.topico_aula ta 
JOIN ensino.turma t ON t.id_turma = ta.id_turma 
JOIN ensino.componente_curricular cc ON t.id_disciplina = cc.id_componente_curricular 
WHERE t.id_turma_serie = 52057124
AND t.id_turma = 685739
ORDER BY cc.nome, ta."data" ;

SELECT * FROM ensino.turma t WHERE t.id_turma = 685729;

SELECT t.id_disciplina, t.id_turma, cc.nome 
FROM ensino.turma t 
JOIN ensino.componente_curricular cc ON t.id_disciplina = cc.id_componente_curricular 
WHERE t.id_turma_serie = 52056838;

SELECT * FROM comum.usuario u WHERE u.id_usuario = 104887;
ARETHUSA ASTEVANY DA COSTA SILVA

52044508, 52056838
desa        ativa

52054613 , 52057058


 52044268 , 52057124

SELECT *
FROM basico.turma_serie ts
WHERE ts.id_escola = 1583
AND ts.ano = 2026
AND ts.id_serie IN (1005223, 1005224)
AND ts.id_turma_serie IN (52044508, 52056838, 52054613, 52057058, 52044268, 52057124, 52044269, 52057125);


SELECT fa.*
FROM ensino.frequencia_aluno fa
JOIN ensino.turma t ON
t.id_turma = fa.id_turma
WHERE true
AND t.id_turma_serie  IN (52054613)
ORDER BY fa."data" ,fa.id_discente;

SELECT ht.*
FROM ensino.horario_turma ht
JOIN ensino.turma t ON
t.id_turma = ht.id_turma
WHERE t.id_turma_serie IN (52057125)
ORDER BY ht.dia, ht.hora_inicio;

SELECT p.nome, u.login, t.id_turma, t.id_disciplina
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
AND t.id_turma_serie = 52057124;

SELECT t.* FROM ensino.turma t WHERE t.id_turma_serie  = 52057125 AND t.id_disciplina = 221;

SELECT * FROM ensino.componente_curricular cc WHERE cc.id_componente_curricular = 223; 


