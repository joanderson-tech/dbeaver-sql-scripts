SELECT *
FROM educacao_especial.atendimento_educacao_especial_estudante aeee
WHERE aeee.id_estudante = 990376;

SELECT d.id_discente, p.nome
FROM comum.pessoa p
JOIN discente d ON
d.id_pessoa = p.id_pessoa
WHERE p.nome ILIKE '%JOSUÉ RICARDO MELO DA SILV%';

SELECT p.nome, u.login, u.id_usuario
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
AND u.id_usuario = 106131;
AND p.nome ILIKE 'ROSANGELA MARIA DOS SANTOS PINHEIRO';

SELECT u.login, u.id_usuario, p.nome 
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
WHERE u.id_usuario = 106131;

SELECT aeea
FROM educacao_especial.atendimento_educacao_especial_estudante aeee
JOIN educacao_especial.atendimento_educacao_especial_acompanhamento aeea ON
aeea.id_atendimento_educacao_especial_estudante = aeee.id_atendimento_educacao_especial_estudante
WHERE aeee.id_estudante = 994839
AND aeee.ano = 2025;

select *
FROM educacao_especial.atendimento_educacao_especial_acompanhamento aeea
WHERE aeea.id_atendimento_educacao_especial_estudante = 56159265
ORDER BY aeea.data ASC;


-- Auto-generated SQL script #202510221446



56514518
--mes 3 e 6

SELECT AT.*
FROM educacao_especial.atendimento_educacao_especial_acompanhamento AT
WHERE at.id_atendimento_educacao_especial_estudante = 56520207
ORDER BY at.data ASC;

SELECT at.*
FROM educacao_especial.atendimento_educacao_especial_acompanhamento AT
WHERE at.id_atendimento_educacao_especial_estudante = 56540892
ORDER BY at.data ASC;

SELECT at.*
FROM educacao_especial.atendimento_educacao_especial_acompanhamento AT
WHERE AT.id_atendimento_educacao_especial_acompanhamento = 56540892;

o nome DO uauario é MARIA VITORIA GONDIM DA COSTA

-- a estudante Isadora Kamila de Lima Paulino não foi encontrado registro neses meses  março e junho e nem foi possivel identificar no banco de logs, la so mostra os registro que a estudante ja possou 

--o estudande KAYQUE ROQUE GALVÃO  o usuario 106131 fez alterção atedendimento desativando ele com isso os registros foras desativados e tem 5 datas qua não possui no ativo 

-- a estudante ANA ESTER BARBOZA DE ASSIS  o usuario 106131 fez alterção atedendimento desativando mas os registros do antido as mesmas datas ja possui no ativo

-- o estudande JOSUÉ RICARDO MELO DA SILVA o usuario 106131 fez alterção atedendimento desativando ele com isso os registros foras desativados e tem 3 datas qua não possui no ativo 

-- ja o estudante Weslley Kauan Lima dos Santos não teve alteração no seu horario e nem tem registro de perca do plano de atendimento e acompanhamento

-- mesma coisa aontece LEANDRO FILHO MACÊDO SEVERIANO não teve alteração no seu horario e nem tem registro de perca do plano de atendimento e acompanhamento