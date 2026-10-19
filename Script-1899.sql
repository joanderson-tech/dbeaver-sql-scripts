SELECT * FROM comum.corrigir_dados;

ALTER TABLE comum."corrigir_dados.CSV" RENAME TO corrigir_dados;

BEGIN;

-- Solução
UPDATE comum.corrigir_dados
SET data_nascimento = TO_DATE(data_nascimento, 'DD/MM/YYYY');

-- Backup Data de Nascimento
SELECT 
'UPDATE comum.pessoa SET data_nascimento = ' ||
CASE 
    WHEN p.data_nascimento IS NULL THEN 'NULL'
    ELSE '''' || p.data_nascimento || ''''
END ||
' WHERE cpf_cnpj = ''' || p.cpf_cnpj || ''';'
FROM comum.pessoa p
JOIN comum.corrigir_dados cd
  ON p.cpf_cnpj = cd.cpf
ORDER BY p.cpf_cnpj;

-- Solução Data de Nascimento
UPDATE comum.pessoa p
SET data_nascimento = cd.data_nascimento::DATE
FROM comum.corrigir_dados cd
WHERE p.cpf_cnpj = cd.cpf;

-- Backup SIAPE
SELECT 
'UPDATE rh.servidor SET siape = ' ||
CASE 
    WHEN s.siape IS NULL THEN 'NULL'
    ELSE '''' || s.siape || ''''
END ||
', digito_siape = ' ||
CASE 
    WHEN s.digito_siape IS NULL THEN 'NULL'
    ELSE s.digito_siape::text
END ||
' WHERE id_pessoa = ' || s.id_pessoa || ';'
AS script_backup
FROM rh.servidor s
JOIN comum.pessoa p 
  ON s.id_pessoa = p.id_pessoa
JOIN comum.corrigir_dados cd 
  ON cd.cpf = p.cpf_cnpj
WHERE NOT EXISTS (
    SELECT 1
    FROM rh.servidor s2
    WHERE s2.siape = cd.matricula
      AND s2.digito_siape = s.digito_siape
);

-- Solução SIAPE
UPDATE rh.servidor s
SET siape = cd.matricula
FROM comum.pessoa p
JOIN comum.corrigir_dados cd 
  ON cd.cpf = p.cpf_cnpj
WHERE s.id_pessoa = p.id_pessoa
AND s.siape IS DISTINCT FROM cd.matricula
AND cd.matricula NOT IN (
    '10655',
    '10173',
    '2884',
    'G52003',
    'E19121',
    'E19174',
    '72578'
);


ROLLBACK;