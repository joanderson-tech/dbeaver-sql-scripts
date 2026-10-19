select * from biblioteca.biblioteca b ;



select
	configurac0_.id_configuracoes_tela_catalogacao as id1_3033_,
	configurac0_.exibir_painel_lateral as exibir2_3033_,
	configurac0_.id_pessoa as id4_3033_,
	configurac0_.usar_tela_catalogacao_completa as usar3_3033_
from
	biblioteca.configuracoes_tela_catalogacao configurac0_
where
	configurac0_.id_pessoa = 1;


select
	classificacao.id_classificacao_bibliografica,
	classificacao.descricao,
	classificacao.campo,
	classificacao.ordem,
	classesPrincipais.classe_principal
from
	biblioteca.classificacao_bibliografica classificacao
left join biblioteca.classe_principal_classificacao_bibliografica classesPrincipais on
	classesPrincipais.id_classificacao_bibliografica = classificacao.id_classificacao_bibliografica
where
	classificacao.ativa;


rollback;

select
	*
from
	biblioteca.titulo_catalografico this_;

begin;

INSERT INTO biblioteca.titulo_catalografico (
    id_titulo_catalografico,
    numero_do_sistema,
    id_formato_material,
    id_registro_criacao,
    data_criacao,
    data_ultima_atualizacao,
    id_registro_ultima_atualizacao,
    id_obra_digitalizada,
    codmerg,
    id_biblioteca_importacao,
    importado,
    catalogado,
    ativo,
    id_dados_defesa,
    classificacao_1,
    classe_principal_classificacao_1,
    classificacao_2,
    classe_principal_classificacao_2,
    classificacao_3,
    classe_principal_classificacao_3,
    id_area_conhecimento_cnpq_classificacao_1,
    id_area_conhecimento_cnpq_classificacao_2,
    id_area_conhecimento_cnpq_classificacao_3
) VALUES (
    1, -- id_titulo_catalografico
    123456, -- numero_do_sistema
    2, -- id_formato_material
    1001, -- id_registro_criacao
    '2025-07-07', -- data_criacao
    '2025-07-07', -- data_ultima_atualizacao
    1002, -- id_registro_ultima_atualizacao
    2001, -- id_obra_digitalizada
    'ABC123', -- codmerg
    3, -- id_biblioteca_importacao
    true, -- importado
    true, -- catalogado
    true, -- ativo
    3001, -- id_dados_defesa
    'CDD-001', -- classificacao_1
    'Classe-A', -- classe_principal_classificacao_1
    'CDD-002', -- classificacao_2
    'Classe-B', -- classe_principal_classificacao_2
    'CDD-003', -- classificacao_3
    'Classe-C', -- classe_principal_classificacao_3
    101, -- id_area_conhecimento_cnpq_classificacao_1
    102, -- id_area_conhecimento_cnpq_classificacao_2
    103 -- id_area_conhecimento_cnpq_classificacao_3
);
select
*
from
	biblioteca.etiqueta etiqueta0_
where
	tag ='030'
	and tipo =1
	and ativa = trueValue();

select * from biblioteca.valor_indicador;