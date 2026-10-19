SELECT * FROM comum.usuario u WHERE u.login = 'marialuciarf9@gmail.com'


SELECT
    u.*,
    true AS marcado
FROM comum.usuario u
WHERE u.login = 'marialuciarf9@gmail.com';

SELECT * FROM ensino.frequencia_aluno fa WHERE fa.id_turma =687924;