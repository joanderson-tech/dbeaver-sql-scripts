WITH mapeamento(id_antigo, id_novo) AS (
    VALUES 
        (52535175, 52544896),
        (52535176, 52544897),
        (52544820, 52544898),
        (52544822, 52544899),
        (52544823, 52544901),
        (52544824, 52544902)
)
SELECT 
    'UPDATE ensino.horario_turma SET id_horario = ' || m.id_novo ||' WHERE id_horario_turma = ' || ht.id_horario_turma || ';' AS Solução, 
    'UPDATE ensino.horario_turma SET id_horario = ' || m.id_antigo ||' WHERE id_horario_turma = ' || ht.id_horario_turma || ';' AS backup
FROM 
    ensino.horario_turma ht
JOIN 
    mapeamento m ON ht.id_horario = m.id_antigo
WHERE 
    ht.id_turma IN (689747, 689746, 690136, 689749, 689748, 690137) 
    AND ht.ativo = TRUE;

UPDATE ensino.horario 	SET ativo=false	WHERE id_horario IN (52535175, 52535176, 52544820, 52544822, 52544823, 52544824, 52544907)


UPDATE ensino.horario_turma SET id_horario = 52544896 WHERE id_horario_turma = 1426423;
UPDATE ensino.horario_turma SET id_horario = 52544896 WHERE id_horario_turma = 1426424;
UPDATE ensino.horario_turma SET id_horario = 52544896 WHERE id_horario_turma = 1426425;
UPDATE ensino.horario_turma SET id_horario = 52544896 WHERE id_horario_turma = 1426426;
UPDATE ensino.horario_turma SET id_horario = 52544896 WHERE id_horario_turma = 1426427;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1426428;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1426429;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1426430;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1426431;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1426432;
UPDATE ensino.horario_turma SET id_horario = 52544898 WHERE id_horario_turma = 1426433;
UPDATE ensino.horario_turma SET id_horario = 52544898 WHERE id_horario_turma = 1426434;
UPDATE ensino.horario_turma SET id_horario = 52544898 WHERE id_horario_turma = 1426435;
UPDATE ensino.horario_turma SET id_horario = 52544898 WHERE id_horario_turma = 1426436;
UPDATE ensino.horario_turma SET id_horario = 52544898 WHERE id_horario_turma = 1426437;
UPDATE ensino.horario_turma SET id_horario = 52544902 WHERE id_horario_turma = 1426438;
UPDATE ensino.horario_turma SET id_horario = 52544902 WHERE id_horario_turma = 1426439;
UPDATE ensino.horario_turma SET id_horario = 52544902 WHERE id_horario_turma = 1426440;
UPDATE ensino.horario_turma SET id_horario = 52544902 WHERE id_horario_turma = 1426441;
UPDATE ensino.horario_turma SET id_horario = 52544902 WHERE id_horario_turma = 1426442;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1425788;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1425789;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1425790;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1425791;
UPDATE ensino.horario_turma SET id_horario = 52544897 WHERE id_horario_turma = 1425792;
UPDATE ensino.horario_turma SET id_horario = 52544899 WHERE id_horario_turma = 1426448;
UPDATE ensino.horario_turma SET id_horario = 52544899 WHERE id_horario_turma = 1426449;
UPDATE ensino.horario_turma SET id_horario = 52544899 WHERE id_horario_turma = 1426450;
UPDATE ensino.horario_turma SET id_horario = 52544899 WHERE id_horario_turma = 1426451;
UPDATE ensino.horario_turma SET id_horario = 52544899 WHERE id_horario_turma = 1426452;
UPDATE ensino.horario_turma SET id_horario = 52544901 WHERE id_horario_turma = 1426453;
UPDATE ensino.horario_turma SET id_horario = 52544901 WHERE id_horario_turma = 1426454;
UPDATE ensino.horario_turma SET id_horario = 52544901 WHERE id_horario_turma = 1426455;
UPDATE ensino.horario_turma SET id_horario = 52544901 WHERE id_horario_turma = 1426456;
UPDATE ensino.horario_turma SET id_horario = 52544901 WHERE id_horario_turma = 1426457;

---

UPDATE ensino.horario_turma SET id_horario = 52535175 WHERE id_horario_turma = 1426423;
UPDATE ensino.horario_turma SET id_horario = 52535175 WHERE id_horario_turma = 1426424;
UPDATE ensino.horario_turma SET id_horario = 52535175 WHERE id_horario_turma = 1426425;
UPDATE ensino.horario_turma SET id_horario = 52535175 WHERE id_horario_turma = 1426426;
UPDATE ensino.horario_turma SET id_horario = 52535175 WHERE id_horario_turma = 1426427;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1426428;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1426429;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1426430;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1426431;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1426432;
UPDATE ensino.horario_turma SET id_horario = 52544820 WHERE id_horario_turma = 1426433;
UPDATE ensino.horario_turma SET id_horario = 52544820 WHERE id_horario_turma = 1426434;
UPDATE ensino.horario_turma SET id_horario = 52544820 WHERE id_horario_turma = 1426435;
UPDATE ensino.horario_turma SET id_horario = 52544820 WHERE id_horario_turma = 1426436;
UPDATE ensino.horario_turma SET id_horario = 52544820 WHERE id_horario_turma = 1426437;
UPDATE ensino.horario_turma SET id_horario = 52544824 WHERE id_horario_turma = 1426438;
UPDATE ensino.horario_turma SET id_horario = 52544824 WHERE id_horario_turma = 1426439;
UPDATE ensino.horario_turma SET id_horario = 52544824 WHERE id_horario_turma = 1426440;
UPDATE ensino.horario_turma SET id_horario = 52544824 WHERE id_horario_turma = 1426441;
UPDATE ensino.horario_turma SET id_horario = 52544824 WHERE id_horario_turma = 1426442;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1425788;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1425789;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1425790;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1425791;
UPDATE ensino.horario_turma SET id_horario = 52535176 WHERE id_horario_turma = 1425792;
UPDATE ensino.horario_turma SET id_horario = 52544822 WHERE id_horario_turma = 1426448;
UPDATE ensino.horario_turma SET id_horario = 52544822 WHERE id_horario_turma = 1426449;
UPDATE ensino.horario_turma SET id_horario = 52544822 WHERE id_horario_turma = 1426450;
UPDATE ensino.horario_turma SET id_horario = 52544822 WHERE id_horario_turma = 1426451;
UPDATE ensino.horario_turma SET id_horario = 52544822 WHERE id_horario_turma = 1426452;
UPDATE ensino.horario_turma SET id_horario = 52544823 WHERE id_horario_turma = 1426453;
UPDATE ensino.horario_turma SET id_horario = 52544823 WHERE id_horario_turma = 1426454;
UPDATE ensino.horario_turma SET id_horario = 52544823 WHERE id_horario_turma = 1426455;
UPDATE ensino.horario_turma SET id_horario = 52544823 WHERE id_horario_turma = 1426456;
UPDATE ensino.horario_turma SET id_horario = 52544823 WHERE id_horario_turma = 1426457;