select mes.*
from discente d 
join comum.pessoa p on p.id_pessoa = d.id_pessoa
join basico.matricula_estudante_serie mes on mes.id_estudante = d.id_discente 
where p.cpf_cnpj in ('14616124469', '14777733475', '15187391488','15501340437','15563728412',
'15687926461', '16016485454','16335061422', '16400171436', '17410431407', '17565779431', '71284803406')
and d.matricula in ('202352769408', '202352767403','202352770510', '202330035152','202330020249', 
'202330020051', '202352778760', '202352794951','202330051020', '202330079101', '202352784665' )
and mes.id_situacao_matricula_serie = 6
order by d.matricula 
;

select * 
from matricula.emissao_documento_matricula edm 
where edm.id_matricula_estudante_serie in (1362245,1362264,1363788,1387762,1389767,1390869,1399119,1405024,1415310);

select * 
from basico.alteracao_matricula_serie ams
where ams.id_matricula_discente_serie in(1362245,1362264,1363788,1387762,1389767,1390869,1399119,1405024,1415310);


select * 
from basico.
where ams.id_matricula_discente_serie in(1362245,1362264,1363788,1387762,1389767,1390869,1399119,1405024,1415310);


--ERROR: update or delete on table "matricula_estudante_serie" violates foreign key constraint "fk_matricula" on table "emissao_documento_matricula"
--Detalhe: Key (id_matricula_discente_serie)=(1362245) is still referenced from table "emissao_documento_matricula".

--Erro SQL [23503]: ERROR: update or delete on table "matricula_estudante_serie" violates foreign key constraint "id_matricula_discente_serie_fkey" on table "alteracao_matricula_serie"
--Detalhe: Key (id_matricula_discente_serie)=(1362264) is still referenced from table "alteracao_matricula_serie".

--update or delete on table "matricula_estudante_serie" violates foreign key constraint "fk_matricula_discente_serie" on table "solicitacao_transferencia"
--Detalhe: Key (id_matricula_discente_serie)=(1387762) is still referenced from table "solicitacao_transferencia".

1362245,
1362264,
1363788,
1387762,
1389767,
1390869,
1399119, 
1405024,
1415310

begin;

commit;

rollback;
--Solução

DELETE FROM basico.alteracao_matricula_serie
WHERE id_alteracao_matricula_serie=459984;
DELETE FROM basico.alteracao_matricula_serie
WHERE id_alteracao_matricula_serie=461508;


DELETE FROM matricula.emissao_documento_matricula
WHERE id_emissao_documento_matricula=850988;
DELETE FROM matricula.emissao_documento_matricula
WHERE id_emissao_documento_matricula=850825;
DELETE FROM matricula.emissao_documento_matricula
WHERE id_emissao_documento_matricula=859157;


DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1362245;
DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1362264;
DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1363788;
DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1387762;
DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1389767;
DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1390869;
DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1399119;
DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1405024;
DELETE FROM basico.matricula_estudante_serie
WHERE id_matricula_discente_serie=1415310;

---

--backup

-- basico.alteracao_matricula_serie
INSERT INTO basico.alteracao_matricula_serie
(id_alteracao_matricula_serie, id_usuario, id_matricula_discente_serie, id_situacao_matricula_serie_nova, data_alteracao, codmovimento, id_movimentacao_aluno, observacao, id_situacao_matricula_serie_antiga, id_escola_etapa_ensino_serie_antiga, id_escola_etapa_ensino_serie_nova, id_turno_antigo, id_turno_novo, id_turma_serie_antiga, id_turma_serie_nova, motivo)
VALUES(459984, 105028, 1362264, 1, '2023-02-10 12:34:28.141', 1044, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO basico.alteracao_matricula_serie
(id_alteracao_matricula_serie, id_usuario, id_matricula_discente_serie, id_situacao_matricula_serie_nova, data_alteracao, codmovimento, id_movimentacao_aluno, observacao, id_situacao_matricula_serie_antiga, id_escola_etapa_ensino_serie_antiga, id_escola_etapa_ensino_serie_nova, id_turno_antigo, id_turno_novo, id_turma_serie_antiga, id_turma_serie_nova, motivo)
VALUES(461508, 104967, 1415310, 1, '2023-02-13 13:26:08.407', 1035, NULL, NULL, 1, 52236507, 52236507, 1, 518766200, NULL, NULL, 'Ajuste de Matrícula');


--matricula.emissao_documento_matricula edm 
INSERT INTO matricula.emissao_documento_matricula
(id_emissao_documento_matricula, id_tipo_documento, id_matricula_estudante_serie, id_registro_entrada, data_emissao)
VALUES(850988, 1, 1362264, 5629242, '2023-01-25');
INSERT INTO matricula.emissao_documento_matricula
(id_emissao_documento_matricula, id_tipo_documento, id_matricula_estudante_serie, id_registro_entrada, data_emissao)
VALUES(850825, 1, 1362245, 5629204, '2023-01-25');
INSERT INTO matricula.emissao_documento_matricula
(id_emissao_documento_matricula, id_tipo_documento, id_matricula_estudante_serie, id_registro_entrada, data_emissao)
VALUES(859157, 1, 1362245, 5636704, '2023-02-06');


-- basico.matricula_estudante_serie
INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie)
VALUES(1362245, 1018581, 6, NULL, NULL, NULL, false, 5629204, '2023-01-25 10:12:00.588', NULL, 52236507, 2023, 2, NULL, 1, 'N', NULL, NULL, NULL, NULL, NULL, NULL, 5637501, '2023-02-07 15:10:59.000', false, NULL, NULL, NULL, NULL, 1);
INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie)
VALUES(1362264, 1018600, 6, NULL, NULL, NULL, false, 5629242, '2023-01-25 10:19:17.078', NULL, 52334559, 2023, 2, NULL, 1, 'N', NULL, NULL, NULL, NULL, NULL, NULL, 5640115, '2023-02-10 12:49:33.000', false, NULL, NULL, NULL, NULL, 1);
INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie)
VALUES(1363788, 1020095, 6, NULL, 52804743, 51876342, false, 5631811, '2023-01-27 10:04:53.546', 1, 52334559, 2023, 2, NULL, 1, 'N', NULL, NULL, NULL, NULL, NULL, NULL, 5674779, '2023-04-02 08:26:12.000', false, NULL, NULL, NULL, NULL, 1);
INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie)
VALUES(1387762, 1348595, 6, NULL, NULL, NULL, false, NULL, '2023-02-03 00:00:00.000', NULL, 52237120, 2023, 2, NULL, 1, 'N', NULL, NULL, NULL, 52237787, NULL, NULL, 5639311, '2023-02-09 14:09:38.000', false, NULL, NULL, NULL, NULL, 1);
INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie)
VALUES(1389767, 1350600, 6, NULL, 52347421, 51876354, false, NULL, '2023-02-03 00:00:00.000', 10, 52236534, 2023, 518766200, NULL, 1, 'N', NULL, NULL, NULL, 52237873, NULL, NULL, 5641374, '2023-02-13 14:23:39.000', false, NULL, NULL, NULL, NULL, 1);
INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie)
VALUES(1390869, 1351702, 6, NULL, 52349220, 51876354, false, NULL, '2023-02-03 00:00:00.000', NULL, 52236744, 2023, 2, NULL, 1, 'N', NULL, NULL, NULL, 52239044, NULL, NULL, 5641456, '2023-02-13 14:51:34.000', false, NULL, NULL, NULL, NULL, 1);
INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie)
VALUES(1399119, 1359952, 6, NULL, NULL, NULL, false, NULL, '2023-02-03 00:00:00.000', NULL, 52236470, 2023, 2, NULL, 1, 'N', NULL, NULL, NULL, 52237892, NULL, NULL, 5646638, '2023-02-23 11:01:40.000', false, NULL, NULL, NULL, NULL, 1);
INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie)
VALUES(1405024, 1365857, 6, NULL, NULL, NULL, false, NULL, '2023-02-03 00:00:00.000', NULL, 52236476, 2023, 2, NULL, 1, 'N', NULL, NULL, NULL, 52238934, NULL, NULL, 5638325, '2023-02-08 12:15:54.000', false, NULL, NULL, NULL, NULL, 1);
INSERT INTO basico.matricula_estudante_serie
(id_matricula_discente_serie, id_estudante, id_situacao_matricula_serie, situacao_final, id_turma_serie, id_curriculo_medio, dependencia, id_registro_entrada, data_cadastro, num_chamada, id_serie_escola, ano_calendario, id_turno, status_censo, periodo, avaliacao, id_tipo_ocupacao_vaga, id_usuario_consolidacao, data_consolidacao, id_vaga_serie, data_reabertura_ficha, id_serie_multisseriado, id_registro_atualizacao, data_atualizacao, retencao_progressao_parcial, id_turma_serie_multisseriado, data_matricula_turma, frequencia, numero_faltas, id_tipo_matricula_serie)
VALUES(1415310, 1376143, 6, NULL, 52349163, 51876342, false, NULL, '2023-02-03 00:00:00.000', 20, 52236507, 2023, 518766200, NULL, 1, 'N', NULL, NULL, NULL, 52237976, NULL, NULL, 5856809, '2023-07-05 09:39:20.000', false, NULL, NULL, NULL, NULL, 1);


SELECT freq.id_frequencia, freq.data, freq.frequencia, freq.id_turma, t.id_disciplina, cc.nome, freq.id_discente, d.id_pessoa, p.nome, mbf.denominacao, mbf.codigo 
FROM ensino.frequencia_aluno freq
INNER JOIN ensino.turma t ON freq.id_turma = t.id_turma
INNER JOIN ensino.componente_curricular cc ON cc.id_componente_curricular = t.id_disciplina
INNER JOIN public.discente d ON d.id_discente = freq.id_discente
INNER JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa
left join basico.motivo_baixa_frequencia mbf on mbf.id_motivo_baixa_frequencia = freq.id_motivo_baixa_frequencia 
WHERE t.ano = 2023
    AND (freq.abonada = false OR freq.abonada IS NULL)
    AND freq.frequencia > 0
ORDER BY freq.data, cc.nome;


select 
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo;

select unaccent(p.nome) as nome from comum.pessoa p ;


select *
from ensino_infantil.parecer_descritivo_individual pdi 
where pdi.id_matricula_discente_serie = 1383829;

SELECT x.* FROM public.discente x
WHERE matricula  = '202352763470'

982643

SELECT x.* FROM basico.matricula_estudante_serie x
WHERE id_estudante  = 1344662;































