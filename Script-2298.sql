UPDATE comum.pessoa SET numero_documento_responsavel_matricula = REPLACE(REPLACE(numero_documento_responsavel_matricula, '.', ''), '-', '') WHERE numero_documento_responsavel_matricula LIKE '%.%' OR numero_documento_responsavel_matricula LIKE '%-%';




