SELECT s
FROM Servidor s
WHERE s.pessoa.id = :idPessoa
AND s.servidorAtivo = + Ativo.SERVIDOR_ATIVO)
		  
		  
SELECT p.*
FROM rh.servidor s
join comum.pessoa p on p.id_pessoa = s.id_pessoa 
where p.nome ilike '%CRISTINA AMARO%';

select distinct e.* from escola.escola e
join basico.turma_serie ts on ts.id_escola = e.id_escola 
where e.unidade_anexo = false
and e.id_escola in (51870339, 51870340, 51870341, 51870342, 51870343, 51870344, 51870345, 51870346, 51870347, 51870348, 51870349, 51870350, 51870351, 51870352, 51870353, 51870354, 51870355, 51870356, 51870357, 51870358, 51870359, 51870360, 51870361, 51870362, 51870363, 51870364, 51870365, 51870366, 51870367, 51870368, 51870369, 51870370, 51870371, 51870372, 51870373, 51870374, 51870375, 51870376, 51870377, 51870378, 51870379, 51870380, 51870381, 51870382, 51870383, 51870384, 51870385, 52902326, 53877856, 53886804, 53898153, 53898193, 54448999, 54454612, 55087459)

select distinct ts.id_escola  from basico.turma_serie ts 
where ts.ano = 2026
and ts.ativo 

-- Consulta SQL equivalente
SELECT e.*
FROM escola e
WHERE 1 = 1
  AND e.codigo_inep = :codigoINEP  -- Executado se 'codigoINEP' for informado
  AND e.id <> :idEscola            -- Executado se 'idEscola' for informado
LIMIT 1;