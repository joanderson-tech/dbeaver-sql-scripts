SELECT ta.* FROM ava.topico_aula ta 
JOIN ensino.turma t ON t.id_turma = ta.id_turma 
WHERE t.id_turma_serie = 51899408
--AND ta.ativo 
AND ta.id_usuario = 105497
ORDER BY ta."data" ;


SELECT * FROM ava.topico_aula_habilidade tah WHERE tah.id_topico_aula = 53636811;

SELECT ta.* FROM ava.topico_aula ta 
WHERE ta.conteudo_ministrado ILIKE '%) Compreender a ideia de igualdade para escrever%';


-- Auto-generated SQL script #202609141440
UPDATE ava.topico_aula
    SET quantidade_aulas=3,bimestre=3
    WHERE id_topico_aula=53636811;


-- Auto-generated SQL script #202609141440
UPDATE ava.topico_aula
    SET quantidade_aulas=null,bimestre=null
    WHERE id_topico_aula=53636811;


INSERT INTO ava.topico_aula (id_topico_aula, id_turma, descricao, "data", fim, id_topico_pai, conteudo, id_usuario, data_cadastro, visivel, ativo, id_docente_turma, aula_cancelada, id_aula_extra, bimestre, programado, bimestral, necessita_correcao, replica_conteudo, conteudo_ministrado, quantidade_aulas, metodologia, observacoes, data_atualizacao, outros, id_configuracao_conteudo_ministrado) VALUES(53636811, 683113, '', '2026-09-14', '2026-09-14', NULL, 'teste', 105497, '2026-09-14 10:45:29.683', true, true, NULL, false, NULL, NULL, false, false, false, false, 'Revisão dos conteúdos por meio de atividades de sistematização propostas no livro didático. Elaboração, no caderno, de um quadro-resumo com exemplos e regras estudadas. Produção individual de um pequeno texto, seguida de revisão e correção coletiva.', NULL, 'teste', 'teste', NULL, NULL, NULL);

DELETE FROM ava.topico_aula WHERE id_topico_aula=53636811;

select p.nome,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and t.id_turma_serie = 51899408;


SELECT * FROM comum.configuracao_cliente ;
