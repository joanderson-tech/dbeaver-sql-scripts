select * from basico.curriculo_basico cb 
where cb.codigo = 'EFINT1A';

select * from basico.turma_serie ts 
where ts.id_serie in (1005218)
and ts.ano = 2023;

select * from ensino_infantil.relatorio_avaliativo ra;

SELECT * 
FROM ensino_infantil.configuracao_relatorio ;


--solução 
UPDATE ensino_infantil.relatorio_avaliativo
	SET ativo=false
	WHERE id_relatorio_avaliativo=1;

UPDATE ensino_infantil.configuracao_relatorio
	SET possui_parecer_descritivo=false 
	WHERE id_configuracao_relatorio=17;


-- backup 
UPDATE ensino_infantil.relatorio_avaliativo
	SET ativo=true
	WHERE id_relatorio_avaliativo=1;

UPDATE ensino_infantil.configuracao_relatorio
	SET possui_parecer_descritivo=true
	WHERE id_configuracao_relatorio=17;

UPDATE basico.curriculo_basico
	SET ativo=true
	WHERE id_curriculo_basico=52309900;

-- Auto-generated SQL script #202309131510
UPDATE ensino_infantil.configuracao_relatorio
	SET possui_parecer_descritivo=false
	WHERE id_configuracao_relatorio=17;



