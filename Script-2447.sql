SELECT *
FROM comum.pessoa p
WHERE p.id_pessoa IN (747300, 747253);

BEGIN;

UPDATE comum.pessoa
SET endereco = 'RUA RIO AMAZONAS', cep = '59598-000', uf = '24', telefone = NULL, celular = '(84)99893-7857', fax = NULL, tipo = 'F', cpf_cnpj = '15823173482', complemento = 'VILA MARIA', nome_representante = NULL, nome = 'SARA CECÍLIA ROSENO CAETANO SILVA', bairro = 'ZONA RURAL', cidade = '2400208', matricula = 0, id_cargo = 1, nome_fantasia = NULL, data_nascimento = '2010-02-26', sexo = 'F', email = NULL, funcionario = NULL, nitpis = NULL, emite_fatura = FALSE, aliquota_imposto = NULL, internacional = FALSE, passaporte = NULL, pais_origem = NULL, ultima_atualizacao = '2026-02-26 17:36:36', valido = FALSE, nome_ascii = 'SARA CECILIA ROSENO CAETANO SILVA', origem = NULL, nome_mae = 'ANDRÊSA INÁCIO ROSENO DA SILVA', numero = '30', nome_responsavel_matricula = 'ANDRÊSA INÁCIO ROSENO DA SILVA', grau_parentesco_responsavel_matricula = 'MÃE', tipo_documento_responsavel_matricula = 'RG', numero_documento_responsavel_matricula = NULL, data_cadastro = '2020-09-24 10:54:25.575', "semCpf" = FALSE, justificativa = NULL, pais_nacionalidade = 'BRASILEIRA', id_municipio_naturalidade = 2400208, id_uf_naturalidade = 24, numero_identidade = '', id_unidade_federativa_identidade = 24, data_expedicao_identidade = NULL, orgao_expedicao_identidade = 'ITEP', id_estado_civil = 1, id_raca = 2
WHERE id_pessoa = 747253;






UPDATE comum.pessoa SET endereco='Rua Santa Terezinha', cep=NULL, uf=NULL, telefone=NULL, celular='(84)99984-0033', fax=NULL, tipo='F', cpf_cnpj=NULL, complemento=NULL, nome_representante=NULL, nome='DAVI BRAGA DA FONSECA', bairro=NULL, cidade=NULL, matricula=0, id_cargo=1, nome_fantasia=NULL, data_nascimento='2010-02-15', sexo='F', email='desenv@esig.com.br', funcionario=NULL, nitpis=NULL, emite_fatura=false, aliquota_imposto=NULL, internacional=false, passaporte=NULL, pais_origem=NULL, ultima_atualizacao=NULL, valido=false, nome_ascii='DAVI BRAGA DA FONSECA', origem=NULL, nome_mae='ELIANA LEITÃO BRAGA', numero=NULL, nome_responsavel_matricula=NULL, grau_parentesco_responsavel_matricula=NULL, tipo_documento_responsavel_matricula=NULL, numero_documento_responsavel_matricula=NULL, data_cadastro='2020-09-24 10:54:25.575', "semCpf"=false, justificativa=NULL, pais_nacionalidade='BRASILEIRA', id_municipio_naturalidade=2400208, id_uf_naturalidade=24, numero_identidade='', id_unidade_federativa_identidade=24, data_expedicao_identidade=NULL, orgao_expedicao_identidade='', id_estado_civil=1, id_raca=2 WHERE id_pessoa=747253;