SELECT *
FROM ensino_infantil.configuracao_relatorio cr
WHERE cr.id_curriculo_basico = 53598442;

SELECT *
FROM comum.usuario u
WHERE u.id_usuario = 105254;

/*--LOURIVAL MESQUITA SOUZA;
 *NO dia 14 / 08 / 2026 15:04:43 a 
configuração de relatorio de desativada Por um administrador. teve uma tarefa que fez algumas delações dessa estrutura
como o configuracao_relatorio vinculado ao curriculo.;

o usuario LOURIVAL MESQUITA SOUZA fez a criação da nova configuração so que erreneamente no dia 2026-08-21 00:00:00.000


**/

SELECT *
FROM ensino_infantil.configuracao_relatorio_componente
WHERE id_configuracao_relatorio IN (46,1);
    AND ativo
    AND id_tipo_avaliacao_componente_relatorio = 1;
    

AND id_tipo_avaliacao_componente_relatorio = 2;

ROLLBACK;

BEGIN;

UPDATE ensino_infantil.configuracao_relatorio_componente
    SET ativo=false
    WHERE id_configuracao_relatorio IN (46)
    AND ativo
    AND id_tipo_avaliacao_componente_relatorio = 1;
    



SELECT  * FROM basico.turma_serie ts
WHERE ts.id_curriculo_medio = 53598442;


SELECT * FROM ensino.turma t 
WHERE t.id_turma_serie = 53510401;

ROLLBACK;

BEGIN;

COMMIT;

Foi ajustado os componentes que tinha relacionado entre AS duas estruturas que estvam ativa,
foram desativada  os compoenentes da estrutura que era DO tipo descritivo, mantendo 
somente os componentes que é de forma objetiva que são relatorio avaliativo.
e foi desativado a configuração criada pelo usuario descrito e ativo a estrutura que foi desavida.


-- Auto-generated SQL script #202609011656
UPDATE ensino_infantil.configuracao_relatorio_componente
    SET ativo=false
    WHERE id_configuracao_relatorio_componente IN (1, 2, 3, 4, 5, 6, 7, 8, 55471, 55473, 55474, 55475, 55534);


/*-- Solução 
 * 

UPDATE ensino_infantil.configuracao_relatorio_componente
    SET ativo=false
    WHERE id_configuracao_relatorio_componente IN (1, 2, 3, 4, 5, 6, 7, 8, 55471, 55473, 55474, 55475, 55534);

UPDATE ensino_infantil.configuracao_relatorio SET ativo=false WHERE id_configuracao_relatorio=43;
UPDATE ensino_infantil.configuracao_relatorio SET ativo=true WHERE id_configuracao_relatorio=1;

--backup

UPDATE ensino_infantil.configuracao_relatorio_componente
    SET ativo=false WHERE id_configuracao_relatorio_componente IN (1, 2, 3, 4, 5, 6, 7, 8, 55471, 55473, 55474, 55475, 55534);
    
UPDATE ensino_infantil.configuracao_relatorio SET ativo=true WHERE id_configuracao_relatorio=43;
UPDATE ensino_infantil.configuracao_relatorio SET ativo=false WHERE id_configuracao_relatorio=1;

*/









