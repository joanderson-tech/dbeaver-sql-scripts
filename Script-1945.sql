SELECT p.cpf_cnpj, a.descricao, e.codigo_inep, ci.numero_salas
FROM pessoas.vaga_administrativa va
JOIN rh.atividade a ON
a.id_atividade = va.id_atividade
JOIN rh.servidor s ON
s.id_servidor = va.id_servidor
JOIN comum.pessoa p ON
p.id_pessoa = s.id_pessoa
JOIN escola.escola e ON
e.id_unidade_escola = va.id_unidade
LEFT JOIN escola.caracterizacao_infraestrutura ci ON
ci.id_escola = e.id_escola
WHERE va.ativo IS TRUE
AND va.dt_inicio <= '2026-02-28';

SELECT *
FROM escola.caracterizacao_infraestrutura ;

SELECT *
FROM ambiente.tipo_ambiente_unidade_escolar taue ;


SELECT *
FROM ambiente.ambiente_tipo_acessibilidade_unidade_escolar ataue 


SELECT *
FROM ambiente.ambiente_unidade_escolar aue 

SELECT * FROM ensino.turma t WHERE t.ano = 2026;

SELECT *
FROM ambiente.
