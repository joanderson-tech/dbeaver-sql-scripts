SELECT 
    ROW_NUMBER() OVER (
        ORDER BY 
            criterios.possui_matricula_rede DESC, 
            ei.nee DESC, 
            eioe.possui_irmao DESC, 
            ei.data ASC
    ) AS posicao_na_fila,
    ei.nome, 
    ei.id_estudante_inscrito,
    ei.id_status,
    criterios.possui_matricula_rede as rede,
    ei.nee,
    eioe.possui_irmao as irmao,
    ei.data as data_inscricao
FROM matricula.estudante_inscrito ei
JOIN matricula.estudante_inscrito_processamento eip ON eip.id_estudante_inscrito = ei.id_estudante_inscrito
JOIN matricula.estudante_inscrito_opcao_escola eioe ON eioe.id_estudante_inscrito_opcao_escola = eip.id_opcao_escola
JOIN matricula.vaga_serie vs ON vs.id_vaga_serie = eioe.id_vaga_serie
JOIN matricula.calendario_matricula cm ON cm.id_calendario_matricula = ei.id_calendario_matricula
LEFT JOIN LATERAL (
    SELECT EXISTS (
        SELECT 1 FROM basico.matricula_estudante_serie mes
        JOIN public.discente d ON d.id_discente = mes.id_estudante
        JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
        WHERE mes.ano_calendario = cm.ano
        AND mes.id_situacao_matricula_serie IN (2, 3, 1, 7, 8, 10, -1)
        AND ((p.cpf_cnpj IS NOT NULL AND ei.cpf IS NOT NULL AND p.cpf_cnpj = ei.cpf)
            OR (trim(upper(retira_acentuacao(p.nome))) = ei.nome AND p.data_nascimento = ei.data_nascimento))
    ) AS possui_matricula_rede
) AS criterios ON TRUE
WHERE eioe.id_escola = 51877856 
  AND vs.id_serie = 51869716
  AND vs.id_turno = 1
  AND cm.ano = 2026
ORDER BY posicao_na_fila ASC
LIMIT 10;