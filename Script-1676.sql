-- Solução --
begin;

DELETE FROM matricula.operacao_vaga_serie
WHERE id_operacao_vaga_serie=52272321;
DELETE FROM matricula.operacao_vaga_serie
WHERE id_operacao_vaga_serie=52272322;
DELETE FROM matricula.operacao_vaga_serie
WHERE id_operacao_vaga_serie=52347893;
DELETE FROM matricula.operacao_vaga_serie
WHERE id_operacao_vaga_serie=52347894;
DELETE FROM matricula.operacao_vaga_serie
WHERE id_operacao_vaga_serie=52347895;
DELETE FROM matricula.vaga_serie
WHERE id_vaga_serie=52271816;
DELETE FROM matricula.vaga_serie
WHERE id_vaga_serie=52271817;
DELETE FROM matricula.vaga_serie
WHERE id_vaga_serie=52277394;
DELETE FROM matricula.vaga_serie
WHERE id_vaga_serie=52271594;
DELETE FROM matricula.vaga_serie
WHERE id_vaga_serie=52271595;
DELETE FROM matricula.vaga_serie
WHERE id_vaga_serie=52346731;
DELETE FROM matricula.vaga_serie
WHERE id_vaga_serie=52346730;
DELETE FROM matricula.vaga_serie
WHERE id_vaga_serie=52346729;
DELETE FROM escola.escola_etapa_ensino_serie
WHERE id_escola_etapa_ensino_serie=52236195;
DELETE FROM basico.serie
WHERE id_serie=51942993;
DELETE FROM matricula.periodo_novos_alunos_etapa_ensino
WHERE id_periodo_novos_alunos=1 AND id_etapa_ensino=51942989;
DELETE FROM matricula.periodo_novos_alunos_etapa_ensino
WHERE id_periodo_novos_alunos=2 AND id_etapa_ensino=51942989;
DELETE FROM matricula.periodo_novos_alunos_etapa_ensino
WHERE id_periodo_novos_alunos=3 AND id_etapa_ensino=51942989;
DELETE FROM matricula.periodo_novos_alunos_etapa_ensino
WHERE id_periodo_novos_alunos=4 AND id_etapa_ensino=51942989;
DELETE FROM matricula.periodo_novos_alunos_etapa_ensino
WHERE id_periodo_novos_alunos=5 AND id_etapa_ensino=51942989;
DELETE FROM basico.etapa_ensino
WHERE id_etapa_ensino=51942989;
commit;