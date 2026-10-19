SELECT string_agg(id_configuracao_relatorio_componente :: varchar, ', ')
FROM ensino_infantil.configuracao_relatorio cr
join ensino_infantil.configuracao_relatorio_componente crc on crc.id_configuracao_relatorio = cr.id_configuracao_relatorio 
WHERE cr.id_curriculo_basico IN (53140733) and crc.id_configuracao_relatorio = 43;
ORDER BY cr.id_configuracao_relatorio;


 SELECT  (cr2.id_configuracao_relatorio = cr.id_configuracao_relatorio) as configuracao_igual    
			 FROM basico.matricula_estudante_serie mes    
			 JOIN basico.turma_serie ts ON ts.id_turma_serie = COALESCE(mes.id_turma_serie_multisseriado, mes.id_turma_serie)    
			 LEFT JOIN ensino_infantil.relatorio_avaliativo ra ON ra.id_matricula_discente_serie = mes.id_matricula_discente_serie    
			 LEFT JOIN ensino_infantil.configuracao_relatorio cr ON cr.id_configuracao_relatorio = ra.id_configuracao_relatorio  
			 left join ensino_infantil.configuracao_relatorio cr2 on cr2.id_curriculo_basico = ts.id_curriculo_medio and cr2.ativo 
			 WHERE mes.id_matricula_discente_serie =   1342324          
			 and ra.ativo;
			

163, 164, 165, 166, 167, 168, 169, 170, 171, 172 --crc.id_configuracao_relatorio = 42; novo

113, 114, 115, 116, 117, 118, 119, 120, 121, 122 --crc.id_configuracao_relatorio = 37; antigo

select * from ensino_infantil.configuracao_relatorio_componente_habilidade crch 
where crch.id_configuracao_relatorio_componente in (177, 176, 175, 174, 173, 182, 181, 180, 179, 178) and ativo;


/*No primeiro configuração EITIN1 na configuracao_relatorio_componente os componentes sao iguais 
e na configuracao_relatorio_componente_habilidade No antigo não tinha habilidade ja no novo possui*/ 

/*No primeiro configuração EITIN1 na configuracao_relatorio_componente os componentes sao iguais 
e na configuracao_relatorio_componente_habilidade No antigo não tinha habilidade ja no novo possui*/ 


select distinct t.codigo as TURMA , e.nome as ESCOLA,  p.nome as ESTUDANTE, pdi.descricao as PARECER 
from ensino_infantil.relatorio_avaliativo ra
join basico.matricula_estudante_serie mes on mes.id_matricula_discente_serie = ra.id_matricula_discente_serie 
join basico.turma_serie ts on ts.id_turma_serie = mes.id_turma_serie 
join ensino.turma t on t.id_turma_serie = mes.id_turma_serie
join ensino_infantil.parecer_descritivo_individual pdi on pdi.id_matricula_discente_serie   = mes.id_matricula_discente_serie 
join escola.escola e on e.id_escola = ts.id_escola 
join discente d on d.id_discente = mes.id_estudante 
join comum.pessoa p on p.id_pessoa = d.id_pessoa 
where ra.id_configuracao_relatorio in (25,26,27)
and ra.data_cadastro < '2025-09-11 18:10:15.349'
order by t.codigo,e.nome, p.nome;

select * from discente d where d.id_discente = 982585;

select *  
from ensino_infantil.relatorio_avaliativo ra where id_configuracao_relatorio in (25,26,27)  and ativo
and ra.data_cadastro > '2025-09-11 18:10:15.349';


select * from ensino_infantil.relatorio_avaliativo ra where ra.id_matricula_discente_serie  in (1331057);

select * from ensino_infantil.parecer_descritivo_individual pdi where pdi.id_parecer_descritivo_individual = 8797;


-- solução
UPDATE ensino_infantil.relatorio_avaliativo	SET ativo=false WHERE id_relatorio_avaliativo in (7530, 7552, 7553, 7531, 7562, 7567, 7564, 7566, 7554, 7555, 7556, 7557, 7558, 7559, 7560, 7561, 7568, 7569, 7563, 7565, 7532, 7534, 7535, 7528, 7533, 7536, 7537, 7538, 7539, 7540, 7541, 7542, 7543, 7544, 7546, 7545, 7492, 7493, 7494);
 
 -- Backup
UPDATE ensino_infantil.relatorio_avaliativo	SET ativo=true WHERE id_relatorio_avaliativo in (7530, 7552, 7553, 7531, 7562, 7567, 7564, 7566, 7554, 7555, 7556, 7557, 7558, 7559, 7560, 7561, 7568, 7569, 7563, 7565, 7532, 7534, 7535, 7528, 7533, 7536, 7537, 7538, 7539, 7540, 7541, 7542, 7543, 7544, 7546, 7545, 7492, 7493, 7494);
