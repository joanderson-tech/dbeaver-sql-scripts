select * from comum.pessoa p where p.nome = 'MARIA ALICY CLEMENTINO SANTOS' ;

select * from comum.parametro_academico where codigo = '2_2_10';


select * from comum.parametro_academico pa ;

INSERT INTO comum.parametro_academico (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao) VALUES('CONTAGEM_NEE', 'Quantidade de vagas ocupadas por estudantes com Necessidade Educacional Especial', '2', 2, 2, '2_2_10', NULL, NULL, NULL, NULL, NULL, true);
