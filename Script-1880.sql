/*
RAYRA SOPHIA FEITOSA DA SILVA, CPF DO ALUNO: 08990205-76; CPF DO RESPONSÁVEL 017879335-39 ---### 202630034073
RAYSSA LORENA FEITOSA DA SILVA, CPF DO ALUNO 08990125-57 CPF do responsável 017879335-39*/

SELECT *
FROM comum.pessoa p
WHERE p.nome ILIKE '% FEITOSA DA SILVA%';

SELECT p.id_pessoa, p.nome, d.matricula, s.descricao, mes.data_cadastro 
FROM comum.pessoa p
JOIN discente d ON d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON mes.id_estudante = d.id_discente 
JOIN basico.situacao_matricula_serie s ON s.id_situacao_matricula_serie = mes.id_situacao_matricula_serie 
WHERE p.id_pessoa IN (774205, 774358);

SELECT *
FROM discente d
WHERE d.id_pessoa IN (774205, 774358);

SELECT *
FROM basico.matricula_estudante_serie mes
WHERE mes.id_estudante IN (1017185,
1017184,
1017348)