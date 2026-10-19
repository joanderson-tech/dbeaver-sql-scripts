UPDATE comum.pessoa
	SET nome='ANDRESA DO NASCIMENTO',nome_pai='ARLINDO DO NASCIMENTO',numero_documento_responsavel_matricula='0',endereco='RUA LAGOA PAPARI',cpf_filiacao_2=0,id_municipio_contato=2408201,certidao_civil_id_municipio_cartorio=2408201,id_pais_nacionalidade=31,numero='12',bairro='CIDADE ALTA',id_municipio_naturalidade=2408201,id_uf_identidade_mae=24,id_uf_naturalidade=24,pais_nacionalidade='BRASILEIRA',telefone_celular='(84)98664-0235',cep='59164-000',grau_parentesco_responsavel_matricula='MÃE',id_uf_contato=24,contato_celular='ANDRESA',id_uf_identidade_pai=24,id_informacoes_medicas=53063429,id_unidade_federativa_identidade=24,codigo_sus='702200019278863',id_estado_civil=-1,tamanho_calcado='0',ultima_atualizacao='2025-07-15 20:50:34.954',certidao_civil_modelo='N',id_grau_parentesco_responsavel_matricula=1,nome_responsavel_matricula='MARIA DE FATIMA DO NASCIMENTO',certidao_civil_tipo='0',certidao_civil_matricula_nova='09548901551986100028172000511797',cpf_filiacao_1=0
	WHERE id_pessoa=754022;

UPDATE public.discente
	SET id_pessoa=754022
	WHERE id_discente=983687;

UPDATE public.discente
	SET id_pessoa=754022
	WHERE id_discente=983841;

DELETE FROM comum.pessoa WHERE id_pessoa in (757519, 757352);

COMMIT;

BEGIN;