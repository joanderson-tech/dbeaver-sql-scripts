SELECT * FROM comum.pessoa p WHERE p.nome ILIKE 'SILVIA LETICIA DE MENEZES MATHUSALEM';

SELECT * FROM comum.pessoa p WHERE p.id_pessoa = 51873686;

SELECT * FROM comum.usuario u WHERE u.id_pessoa = 774539;


BENILDES SALGUEIRO LUZ FILHO


SELECT * FROM rh.servidor s WHERE s.id_pessoa = 774539;

 SELECT * FROM rh.servidor s WHERE s.id_pessoa = 51873686;
 
 Não há um diretor vinculado à escola: 

 ESCOLA MUNICIPAL NAIR MENEZES SANTOS
 ESCOLA MUNICIPAL IZÍDIO MARQUES DE MELO
 ESCOLA MUNICIPAL ANÁLIA VIEIRA DE FIGUEIREDO
 ESCOLA MUNICIPAL JOSE DE MELO MENEZES
 
 
Para realizar o vínculo, conceda ao diretor a permissão de GESTOR DA ESCOLA (Diretor).
        
SELECT uni* FROM comum.unidade u WHERE u.id_unidade = 27223928;

SELECT e.id_unidade_escola  FROM escola.escola e WHERE e.nome = 'ESCOLA MUNICIPAL ANÁLIA VIEIRA DE FIGUEIREDO';

/*
51873686    BENILDES SALGUEIRO LUZ FILHO


--solução 
UPDATE rh.servidor  SET id_atividade=1  WHERE id_servidor=660;


--backup 
UPDATE rh.servidor  SET id_atividade=null  WHERE id_servidor=660;

banco comum
--solução 
UPDATE comum.permissao
    SET data_atribuicao='2026-09-18 00:00:00.000'
    WHERE id=13059;

--backup 
UPDATE comum.permissao
    SET data_atribuicao='2023-02-07 11:17:57.592'
    WHERE id=13059;
    
INSERT INTO comum.permissao (id, id_sistema, id_usuario, id_papel, id_atribuidor, data_atribuicao, data_expiracao, id_unidade_papel, numero_chamado, motivo, autorizada, id_designacao) 
VALUES(nextval('comum.permissao_seq'), 2, 108824, 302, 1, '2026-09-18 00:00:00.000', NULL, 27223952, 1, '1', true, 0);



*/

        