SELECT distinct aeee.id_atendimento_educacao_especial_estudante, aeee.ativo 
FROM educacao_especial.atendimento_educacao_especial_estudante aeee
JOIN educacao_especial.atendimento_educacao_especial_acompanhamento aeea ON
aeea.id_atendimento_educacao_especial_estudante = aeee.id_atendimento_educacao_especial_estudante
WHERE aeee.id_estudante = 994839
AND aeee.ano = 2025;56177429


SELECT id_atendimento_educacao_especial_estudante, id_estudante, id_atendimento_educacao_especial_horario, id_registro_entrada, data_cadastro, ano, observacao, ativo
FROM educacao_especial.atendimento_educacao_especial_estudante
WHERE id_atendimento_educacao_especial_estudante=56177429;

select *
FROM educacao_especial.atendimento_educacao_especial_acompanhamento aeea
WHERE aeea.id_atendimento_educacao_especial_estudante = 56177429 --desativado
ORDER BY aeea.data ASC;


SELECT aeea_ativo.*
FROM educacao_especial.atendimento_educacao_especial_acompanhamento aeea_ativo
WHERE aeea_ativo.id_atendimento_educacao_especial_estudante IN (56159278, 56177429)  -- desativado 
  AND NOT EXISTS (
      SELECT 1
      FROM educacao_especial.atendimento_educacao_especial_acompanhamento aeea_des
      WHERE aeea_des.id_atendimento_educacao_especial_estudante IN  (56520207, 56520202) -- ativo
        AND aeea_des.data = aeea_ativo.DATA
  )
ORDER BY aeea_ativo.id_atendimento_educacao_especial_estudante ASC;


--Solução estudande KAYQUE ROQUE GALVÃO 
UPDATE educacao_especial.atendimento_educacao_especial_acompanhamento 	SET id_atendimento_educacao_especial_estudante=56520207
WHERE id_atendimento_educacao_especial_acompanhamento IN (56189201,56345585,56345785,56470585,56516182);

--Solução estudande JOSUÉ RICARDO MELO DA SILVA
UPDATE educacao_especial.atendimento_educacao_especial_acompanhamento SET id_atendimento_educacao_especial_estudante=56520202
WHERE id_atendimento_educacao_especial_acompanhamento IN (56471958,56417005,56516196);

--backup estudande KAYQUE ROQUE GALVÃO 
UPDATE educacao_especial.atendimento_educacao_especial_acompanhamento 	SET id_atendimento_educacao_especial_estudante=56159278
WHERE id_atendimento_educacao_especial_acompanhamento IN (56189201,56345585,56345785,56470585,56516182);

--backup estudande JOSUÉ RICARDO MELO DA SILVA
UPDATE educacao_especial.atendimento_educacao_especial_acompanhamento SET id_atendimento_educacao_especial_estudante=56177429
WHERE id_atendimento_educacao_especial_acompanhamento IN (56471958,56417005,56516196);




--e ele vai retornar o id_atendimento_educacao_especial_acompanhamento que não tenha do desativado que seja data diferente do outro ou seja que mnão possua no outro 




UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 908075;
UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 908076;
UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 908077;
UPDATE ensino.turma SET id_situacao_turma = 4  WHERE id_turma = 908078;



UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134977;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134978;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134979;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134980;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134981;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134982;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134983;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134984;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134985;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134986;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134987;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134988;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134989;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134990;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134991;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134992;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134993;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134994;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134995;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134996;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134997;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134998;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20134999;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135000;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135001;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135002;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135003;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135004;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135005;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135006;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135007;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135008;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135009;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135010;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135011;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135012;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135013;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135014;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135015;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135016;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135017;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135018;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135019;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135020;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135021;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135022;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135023;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135024;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135025;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135026;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135027;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135028;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135029;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135030;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135031;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135032;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135033;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135034;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135035;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135036;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135037;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135038;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135039;
UPDATE ensino.matricula_componente SET id_situacao_matricula = 7 WHERE id_matricula_componente = 20135040;