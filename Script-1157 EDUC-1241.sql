/*UPDATE basico.curriculo_basico cb SET tipo_diario = 31 WHERE cb.id_curriculo_basico IN (52824704,52824686,52824719);
UPDATE basico.turma_serie ts SET tipo_diario = 31 WHERE ts.id_turma_serie IN (52824701,52826588,52826390,52826596,52824790,52824796,52826597,52825621,52825344,52825343,52825622,52825623,52826595,52825342);

UPDATE basico.curriculo_basico cb SET tipo_diario_diversificado = 31 WHERE cb.id_curriculo_basico IN (52824734);
UPDATE basico.curriculo_basico cb SET tipo_diario_diversificado = 31, possui_parte_diversificada = TRUE WHERE cb.id_curriculo_basico IN (52824749);*/

UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma IN (693184,693190,693191,693188,693189,693192,693068,693072,693074,693073,693076,693075,693387,693386,693384,693383,693379,693385);


select * from basico.curriculo_basico cb where cb.codigo in ('AI1INT','AI2INT','AI3INT');

UPDATE basico.curriculo_basico cb SET tipo_diario_diversificado = 31, possui_parte_diversificada = TRUE WHERE cb.id_curriculo_basico IN (51877801,51877814,51877827);
UPDATE basico.curriculo_basico_componente SET id_categoria_componente=2	WHERE id_curriculo_basico_componente in (51877802,51877804,51877805);

UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681862;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681863;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681864;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681871;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681872;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681873;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681880;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681881;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681882;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681889;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681890;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681891;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681898;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681899;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681900;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681907;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681908;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 681909;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682778;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682779;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682780;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682787;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682788;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682789;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682796;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682797;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682798;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682805;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682806;
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = 682807;

--backup 
UPDATE basico.curriculo_basico SET tipo_diario_diversificado=null,possui_parte_diversificada=false WHERE id_curriculo_basico in (51877801,51877814,51877827);
UPDATE basico.curriculo_basico_componente SET id_categoria_componente=1	WHERE id_curriculo_basico_componente in (51877802,51877804,51877805);

UPDATE ensino.turma t SET id_turma_agrupadora = 681856 WHERE t.id_turma = 681862;
UPDATE ensino.turma t SET id_turma_agrupadora = 681856 WHERE t.id_turma = 681863;
UPDATE ensino.turma t SET id_turma_agrupadora = 681856 WHERE t.id_turma = 681864;
UPDATE ensino.turma t SET id_turma_agrupadora = 681865 WHERE t.id_turma = 681871;
UPDATE ensino.turma t SET id_turma_agrupadora = 681865 WHERE t.id_turma = 681872;
UPDATE ensino.turma t SET id_turma_agrupadora = 681865 WHERE t.id_turma = 681873;
UPDATE ensino.turma t SET id_turma_agrupadora = 681874 WHERE t.id_turma = 681880;
UPDATE ensino.turma t SET id_turma_agrupadora = 681874 WHERE t.id_turma = 681881;
UPDATE ensino.turma t SET id_turma_agrupadora = 681874 WHERE t.id_turma = 681882;
UPDATE ensino.turma t SET id_turma_agrupadora = 681883 WHERE t.id_turma = 681889;
UPDATE ensino.turma t SET id_turma_agrupadora = 681883 WHERE t.id_turma = 681890;
UPDATE ensino.turma t SET id_turma_agrupadora = 681883 WHERE t.id_turma = 681891;
UPDATE ensino.turma t SET id_turma_agrupadora = 681892 WHERE t.id_turma = 681898;
UPDATE ensino.turma t SET id_turma_agrupadora = 681892 WHERE t.id_turma = 681899;
UPDATE ensino.turma t SET id_turma_agrupadora = 681892 WHERE t.id_turma = 681900;
UPDATE ensino.turma t SET id_turma_agrupadora = 681901 WHERE t.id_turma = 681907;
UPDATE ensino.turma t SET id_turma_agrupadora = 681901 WHERE t.id_turma = 681908;
UPDATE ensino.turma t SET id_turma_agrupadora = 681901 WHERE t.id_turma = 681909;
UPDATE ensino.turma t SET id_turma_agrupadora = 682772 WHERE t.id_turma = 682778;
UPDATE ensino.turma t SET id_turma_agrupadora = 682772 WHERE t.id_turma = 682779;
UPDATE ensino.turma t SET id_turma_agrupadora = 682772 WHERE t.id_turma = 682780;
UPDATE ensino.turma t SET id_turma_agrupadora = 682781 WHERE t.id_turma = 682787;
UPDATE ensino.turma t SET id_turma_agrupadora = 682781 WHERE t.id_turma = 682788;
UPDATE ensino.turma t SET id_turma_agrupadora = 682781 WHERE t.id_turma = 682789;
UPDATE ensino.turma t SET id_turma_agrupadora = 682790 WHERE t.id_turma = 682796;
UPDATE ensino.turma t SET id_turma_agrupadora = 682790 WHERE t.id_turma = 682797;
UPDATE ensino.turma t SET id_turma_agrupadora = 682790 WHERE t.id_turma = 682798;
UPDATE ensino.turma t SET id_turma_agrupadora = 682799 WHERE t.id_turma = 682805;
UPDATE ensino.turma t SET id_turma_agrupadora = 682799 WHERE t.id_turma = 682806;
UPDATE ensino.turma t SET id_turma_agrupadora = 682799 WHERE t.id_turma = 682807;


---------------------------------
--Arte 229, Educação Física 238 e Ensino Religioso 230
UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma IN (681889, 681890, 681891, 681907, 681908, 681909, 681880, 681881, 681882, 681898, 681899, 681900, 682805, 682806, 682807, 681871, 681872, 681873, 682778, 682779, 682780, 682787, 682788, 682789, 682797, 682798, 682796, 681862, 681863, 681864)

select t.*
from basico.curriculo_basico cb 
join basico.turma_serie ts on ts.id_curriculo_medio = cb.id_curriculo_basico 
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
where cb.id_curriculo_basico in (51877801,51877814,51877827) 
and t.id_disciplina in (229,238,230);


SELECT
    'UPDATE ensino.turma t SET id_turma_agrupadora = ' || t.id_turma_agrupadora || ' WHERE t.id_turma = ' || t.id_turma || ';' AS backup_sql,
    'UPDATE ensino.turma t SET id_turma_agrupadora = NULL WHERE t.id_turma = ' || t.id_turma || ';' AS solucao_sql
from basico.curriculo_basico cb
join basico.turma_serie ts ON ts.id_curriculo_medio = cb.id_curriculo_basico
join ensino.turma t ON t.id_turma_serie = ts.id_turma_serie
where cb.id_curriculo_basico IN (51877801, 51877814, 51877827)
    AND t.id_disciplina IN (229, 238, 230)
GROUP BY
    t.id_turma, t.id_turma_agrupadora;


fOI ALTERADO O CURRICULO BASICO NA PARTE DIVERSIFICADA PARA  RELATORIO_HABILIDADES_COMPETENCIAS_PARAIBA TAMBEM ABILIDANTO A PARTE SE POSSUI PARTE DIVERFIFICADA EM SEGUINDA FOI ALTERADO 
O COMPONENTE do CURRICULO BASICO COMPONENTE PARA Parte Diversificada EM SEGUINDA FOI FEITA ALTERAÇÃO NA TURMA PARA ESSES COMEPOENTES 
Arte, Educação Física e Ensino Religioso DEIXARAM DE SER TURMA AGRUPADORA DA POLIVALENTE E MUDADA A CATEGORIA PARA Parte Diversificada EM SEGUINDA A CRIAÇÃO DA CONFIGURAÇÃO DE RELATORIA PARA CADA ESTRUTURA E A A CRIAÇÃO DA CONFIGURAÇÃO do  RELATORIO COMPONENTE
PARA CADA ESTRUTURA DE ACORDO COMO DESCRIOT NA TAREFA 




