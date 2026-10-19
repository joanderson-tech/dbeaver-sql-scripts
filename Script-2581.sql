SELECT *
FROM comum.pessoa p
WHERE p.nome = 'ANA LUIZA NASCIMENTO BASTOS';

SELECT *
FROM discente d
WHERE d.id_pessoa = 768097;

SELECT mes.ano_calendario,mc.*
FROM basico.matricula_estudante_serie mes
JOIN ensino.matricula_componente mc ON mc.id_matricula_estudante_serie = mes.id_matricula_discente_serie 
WHERE mes.id_estudante = 1397446
AND mes.ano_calendario = 2026;

SELECT *
FROM matricula.solicitacao_transferencia st
WHERE st.id_matricula_discente_serie = 1634002;


SELECT * FROM matricula.solicitacao_transferencia_opcao_escola stoe 


SELECT dt.* FROM ensino.docente_turma dt 
JOIN rh.servidor s ON s.id_servidor = dt.id_docente 
WHERE dt.data_cadastro  > '2024-02-29 07:28:52.696';
