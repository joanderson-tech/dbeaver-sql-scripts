WITH estudantes_da_rede AS ( SELECT DISTINCT p.cpf_cnpj AS cpf
FROM comum.pessoa p
JOIN public.discente d ON
d.id_pessoa = p.id_pessoa
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
AND mes.id_situacao_matricula_serie IN ( 2, 3, 1, 7, 8, 10,-1 )
AND mes.ano_calendario = 2026 ), dados_opcoes AS ( SELECT ei.id_estudante_inscrito, sum(CASE WHEN eioe.possui_irmao THEN 1 ELSE 0 END) qtd_irmao, sum(CASE WHEN eba.id_escola IS NOT NULL AND ei.bairro = be.denominacao THEN 1 ELSE 0 END) mesmo_bairro, sum(CASE WHEN eba.id_escola IS NOT NULL AND ei.bairro = bea.denominacao THEN 1 ELSE 0 END) bairro_atendido
FROM matricula.estudante_inscrito ei
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = ei.id_calendario_matricula
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
eioe.id_estudante_inscrito = ei.id_estudante_inscrito
JOIN escola.escola e ON
e.id_escola = eioe.id_escola
LEFT JOIN escola.bairro_escola be ON
be.id_bairro_escola = e.id_bairro_escola
LEFT JOIN escola.bairro_escola bea ON
bea.denominacao = ei.bairro
AND bea.id_municipio = e.id_municipio
LEFT JOIN escola.escola_bairros_atendidos eba ON
eba.id_bairro_escola = bea.id_bairro_escola
AND eba.id_escola = e.id_escola
WHERE cm.ano = 2026
GROUP BY ei.id_estudante_inscrito) SELECT DISTINCT daop.qtd_irmao, daop.mesmo_bairro, daop.bairro_atendido, ei.id_estudante_inscrito AS idSolicitacao, ei.numero_inscricao AS numSolicitacao, ei.nee, eioe.possui_irmao AS possuiIrmaoEscola, ei."data" AS dataCadastro, ei.id_status AS idStatusSolicitacao, sei.denominacao AS statusSolicitacao, eip.id_status AS idStatusSolicitacaoOpcao, seip.denominacao AS statusSolicitacaoOpcao, eioe.id_escola AS idEscola, e.nome AS escola, e.vinculo_comercio AS escolaVinculoComercio, eioe.prioridade_pre_matricula AS prioridadePreMatricula, eioe.id_estudante_inscrito_opcao_escola AS idOpcaoEscola, vs.id_vaga_serie AS idVagaSerie, ee.id_etapa_ensino AS idEtapa, ee.denominacao AS etapaEnsino, s.id_serie AS idSerie, s.descricao AS serie, t.id_turno AS idTurno, t.descricao AS turno,(SELECT *
FROM matricula.verificar_vaga_livre_para_nova_ocupacao(vs.id_vaga_serie, CASE WHEN ei.solicita_prematricula_irmao_gemeo THEN 2
ELSE 1 END)) AS possuiVagaDisponivel, vs.vagas_validadas AS vagasOfertadas, COALESCE(vs.vagas_validadas, 0) - COALESCE(vs.vagas_ocupadas, 0) AS vagasLivres, be.denominacao AS bairro_unidade, CASE WHEN er.cpf IS NOT NULL THEN 'Sim'
ELSE 'Não' END AS daRede, trim(ei.nome) AS estudante, ei.cpf AS cpfSolicitante, ei.email, ei.data_nascimento AS dataNascimento, ei.sexo, ei.numero_identidade_estudante AS numeroIdentidade, uf.descricao AS naturalidade, ei.tem_irmao AS possuiIrmao, ei.qtd_irmao AS qtdIrmao, tr.descricao AS raca, ec.descricao AS estadoCivil, trim(ei.nome_mae) AS nomeMaeSolicitante, trim(ei.nome_responsavel) AS nomeResponsavel, ei.cpf_responsavel AS cpfResponsavel, ei.cep, ei.logradouro, ei.bairro, ei.numero_endereco AS numeroEndereco, ei.complemento, ei.telefone_contato AS telefone, ei.telefone_contato2 AS telefone2, ei.participa_bolsa_familia AS bolsaFamilia, tio.denominacao AS instituicaoOrigem, ei.participa_escotimo AS escotismo, ei.utiliza_transporte_publico AS transportePublico, ei.senha_acesso AS senha, ei.motivo_cancelamento AS motivoCancelamento, ei.data_direcionamento AS dataDirecionamento, ei.responsavel_filiacao_1 AS responsavelFiliacao1, ei.responsavel_filiacao_2 AS responsavelFiliacao2, ei.data_nascimento_responsavel AS dataNascimentoResponsavel, ei.logradouro_vinculo_comercio AS logradouroVinculoComercio, ei.numero_vinculo_comercio AS numeroVinculoComercio, ei.solicita_prematricula_irmao_gemeo AS solicitaPreMatriculaIrmaoGemeo, ei.cpf_irmao_gemeo AS cpfIrmaoGemeo, ei.nome_irmao_gemeo AS nomeIrmaoGemeo, ei.bairro_vinculo_comercio AS bairroVinculoComercio, ei.familia_monoparental AS familiaMonoparental, EXISTS (SELECT 1
FROM matricula.estudante_rede_estadual ere
WHERE ere.cpf = ei.cpf
AND ei.id_calendario_matricula = ere.id_calendario_matricula) AS estudanteRedeEstadual
FROM matricula.estudante_inscrito ei
JOIN dados_opcoes daop ON
daop.id_estudante_inscrito = ei.id_estudante_inscrito
JOIN matricula.estudante_inscrito_processamento eip ON
eip.id_estudante_inscrito = ei.id_estudante_inscrito
JOIN matricula.listagem_processamento_matricula lpm ON
lpm.id_listagem_processamento_matricula = eip.id_listagem_processamento_matricula
JOIN matricula.calendario_matricula cm ON
cm.id_calendario_matricula = lpm.id_calendario_matricula
JOIN matricula.estudante_inscrito_opcao_escola eioe ON
eioe.id_estudante_inscrito_opcao_escola = eip.id_opcao_escola
JOIN escola.escola e ON
e.id_escola = eioe.id_escola
JOIN matricula.vaga_serie vs ON
vs.id_vaga_serie = eioe.id_vaga_serie
JOIN basico.serie s ON
s.id_serie = vs.id_serie
JOIN basico.etapa_ensino ee ON
ee.id_etapa_ensino = s.id_etapa_ensino
JOIN ensino.turno t ON
t.id_turno = vs.id_turno
JOIN matricula.tipo_instituicao_origem tio ON
tio.id_tipo_instituicao_origem = ei.id_tipo_instituicao_origem
JOIN comum.tipo_raca tr ON
tr.id_tipo_raca = ei.id_raca
LEFT JOIN comum.estado_civil ec ON
ec.id_estado_civil = ei.id_estado_civil
LEFT JOIN comum.unidade_federativa uf ON
uf.id_unidade_federativa = ei.id_uf_nascimento
JOIN matricula.status_estudante_inscrito sei ON
sei.id_status_estudante_inscrito = ei.id_status
JOIN matricula.status_estudante_inscrito seip ON
seip.id_status_estudante_inscrito = eip.id_status
JOIN comum.municipio m ON
m.id_municipio = ei.id_cidade
LEFT JOIN comum.unidade_federativa uf2 ON
uf2.id_unidade_federativa = m.id_unidade_federativa
LEFT JOIN comum.tipo_trabalho_responsavel ttr ON
ttr.id_tipo_trabalho_responsavel = ei.id_tipo_trabalho_responsavel
LEFT JOIN escola.bairro_escola be ON
be.id_bairro_escola = e.id_bairro_escola
LEFT JOIN estudantes_da_rede er ON
er.cpf = ei.cpf
LEFT JOIN comum.grau_parentesco pg ON
pg.id_grau_parentesco = ei.id_grau_parentesco_responsavel
LEFT JOIN comum.municipio m2 ON
m2.id_municipio = ei.id_municipio_vinculo_comercio
LEFT JOIN comum.unidade_federativa muf2 ON
muf2.id_unidade_federativa = m2.id_unidade_federativa
WHERE 1 = 1
AND NOT EXISTS (SELECT 1
FROM matricula.estudante_inscrito
WHERE ei.id_estudante_inscrito = id_estudante_escrito_irmao_gemeo)
AND ei.id_status IN (10)
AND eip.id_status IN (10)
AND cm.ano = 2026
ORDER BY daop.qtd_irmao DESC, daop.mesmo_bairro DESC, daop.bairro_atendido DESC, nee DESC, ei.data ASC, eioe.prioridade_pre_matricula ASC;