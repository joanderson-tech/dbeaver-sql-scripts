BEGIN;

-- Solução
UPDATE educacenso.educacenso_pessoa	SET id_pessoa=749479 WHERE id_educacenso_pessoa=660;
UPDATE comum.alteracao_pessoa SET id_pessoa=749479	WHERE id_alteracao_pessoa=523076091;
UPDATE public.discente SET id_pessoa=749479	WHERE id_discente=976126;
DELETE FROM comum.pessoa WHERE id_pessoa=749314;
UPDATE comum.pessoa	SET nome_pai='JOSÉ AMARO DE MACEDO JÚNIOR',numero_documento_responsavel_matricula='0',endereco='RUA PROF. ANTÔNIO CORCINO DE MACEDO',cpf_filiacao_2=0,id_municipio_contato=2411403,certidao_civil_id_municipio_cartorio=2411403,id_pais_nacionalidade=31,numero='61',bairro='CENTRO',id_municipio_naturalidade=2411403,id_uf_identidade_mae=24,id_uf_naturalidade=24,pais_nacionalidade='BRASILEIRA',telefone_celular='(84)99907-1428',cep='59520-000',grau_parentesco_responsavel_matricula='MÃE',id_uf_contato=24,id_uf_identidade_pai=24,id_informacoes_medicas=52209706,id_unidade_federativa_identidade=24,id_estado_civil=1,tamanho_calcado='38',nome_mae='MAYRA FONSECA RODRIGUES DA SILVA',id_localizacao_zona=1,id_grau_parentesco_responsavel_matricula=1,nome_responsavel_matricula='MAYRA FONSECA RODRIGUES DA SILVA',id_tamanho_camisa_predefinido=11,id_tamanho_short_calca_predefinido=11,certidao_civil_tipo='0',cpf_filiacao_1=0 WHERE id_pessoa=749479;

COMMIT;