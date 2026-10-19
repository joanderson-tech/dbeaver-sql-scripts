682125

SELECT
    *
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado = true
  AND ta.id_turma = 682125;
  


WHERE ta.descricao IS NULL

AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')

AND ta.data_cadastro >= '2025-01-01'

AND ta.programado = false;

begin;

INSERT INTO backup_dadosDuplicados (ta.id_topico_aula, conteudo_ministrado)
WITH dados AS (
    SELECT
    	ta.id_topico_aula,
    	ta.conteudo_ministrado
    FROM
        ava.topico_aula ta
    WHERE
        ta.descricao IS NOT NULL
        AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
        AND ta.data_cadastro >= '2025-01-01'
        AND ta.programado = TRUE
        AND ta.id_turma = 682125
),
datas_duplicadas_e_nao_programados AS (
    SELECT
        d."data"
    FROM
        dados d
    JOIN
        ava.topico_aula taa ON d."data" = taa."data" AND d.id_turma = taa.id_turma
    WHERE
        taa.programado = FALSE -- Verifica se o registro correspondente NAO está programado
    GROUP BY
        d."data"
    HAVING
        COUNT(d."data") > 0 -- Garante que haja pelo menos um registro com essa data e condição
)
SELECT
    d.*
FROM
    dados d
JOIN
    datas_duplicadas_e_nao_programados ddp ON d."data" = ddp."data";

UPDATE ava.topico_aula
SET
    conteudo_ministrado = conteudo_ministrado
WHERE id_topico_aula IN (
    SELECT id_topico_aula FROM backup_dadosDuplicados -- Usa os IDs da tabela de backup
);

UPDATE ava.topico_aula
SET
    conteudo_ministrado = ''
WHERE id_topico_aula IN (
    SELECT id_topico_aula FROM backup_dadosDuplicados -- Usa os IDs da tabela de backup
);






























-- 1. Criação da Tabela Temporária (ou uso de uma CTE para simular a temporária)
-- Dependendo do seu banco de dados, a sintaxe de tabela temporária pode variar.
-- Abaixo, um exemplo comum para PostgreSQL/SQL Server. Para MySQL, use CREATE TEMPORARY TABLE.
--

begin;

rollback;

CREATE TEMPORARY TABLE temp_topicos_duplicados ( id_topico_aula INT, conteudo_ministrado TEXT );

-- 2. Inserção dos Dados Identificados na Tabela Temporária
INSERT INTO temp_topicos_duplicados (id_topico_aula, conteudo_ministrado)
WITH dados AS (
    SELECT
        ta.id_topico_aula,
        ta."data",
        ta.conteudo_ministrado,
        ta.descricao,
        ta.data_cadastro,
        ta.programado,
        ta.id_turma
    FROM ava.topico_aula ta
    WHERE ta.descricao IS NOT NULL
        AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
        AND ta.data_cadastro >= '2025-01-01'
        AND ta.programado = TRUE
),
datas_duplicadas_e_nao_programados AS (
    SELECT d."data"
    FROM dados d
    JOIN ava.topico_aula taa ON d."data" = taa."data" AND d.id_turma = taa.id_turma
    WHERE taa.programado = FALSE -- Verifica se o registro correspondente NAO está programado
    GROUP BY d."data" HAVING COUNT(d."data") > 0 -- Garante que haja pelo menos um registro com essa data e condição
)
SELECT d.id_topico_aula, d.conteudo_ministrado
FROM dados d
JOIN datas_duplicadas_e_nao_programados ddp ON d."data" = ddp."data";

-- 3. Geração dos Comandos SQL para Restauração (Backup)

SELECT 'UPDATE ava.topico_aula SET conteudo_ministrado = ' || CASE WHEN b.conteudo_ministrado IS NOT NULL THEN '''' || REPLACE(b.conteudo_ministrado, '''', '''''') || '''' ELSE 'NULL' END || ' WHERE id_topico_aula = ' || b.id_topico_aula || ';' AS restore_statement FROM temp_topicos_duplicados b;

-- 4. Segundo UPDATE: Define conteudo_ministrado como vazio para os registros identificados
UPDATE ava.topico_aula SET conteudo_ministrado = '' WHERE id_topico_aula IN (SELECT id_topico_aula FROM temp_topicos_duplicados);

-- 5. Opcional: Eliminar a Tabela Temporária (se não for necessária após as operações)
-- DROP TABLE temp_topicos_duplicados;






commit;


UPDATE ava.topico_aula SET conteudo_ministrado = 'NÚMEROS
(EF06MA02) Reconhecer o sistema 
de numeração decimal, como o que 
prevaleceu no mundo ocidental, e destacar 
semelhanças e diferenças com outros 
sistemas, de modo a sistematizar suas 
principais características (base, valor 
posicional e função do zero), utilizando, 
inclusive, a composição e decomposição de 
números naturais e números racionais em 
sua representação decimal.' WHERE id_topico_aula = 51911647;
UPDATE ava.topico_aula SET conteudo_ministrado = 'NÚMEROS
(EF06MA02) Reconhecer o sistema 
de numeração decimal, como o que 
prevaleceu no mundo ocidental, e destacar 
semelhanças e diferenças com outros 
sistemas, de modo a sistematizar suas 
principais características (base, valor 
posicional e função do zero), utilizando, 
inclusive, a composição e decomposição de 
números naturais e números racionais em 
sua representação decimal.' WHERE id_topico_aula = 51911651;
UPDATE ava.topico_aula SET conteudo_ministrado = 'NÚMEROS
(EF06MA02) Reconhecer o sistema 
de numeração decimal, como o que 
prevaleceu no mundo ocidental, e destacar 
semelhanças e diferenças com outros 
sistemas, de modo a sistematizar suas 
principais características (base, valor 
posicional e função do zero), utilizando, 
inclusive, a composição e decomposição de 
números naturais e números racionais em 
sua representação decimal.' WHERE id_topico_aula = 51911648;

UPDATE ava.topico_aula SET conteudo_ministrado = 'Unidade temática: Vida e Evolução.

Objetos do conhecimento: Hereditariedade, Embriogênese, Leis de Mendel.

Habilidades:(EF09CI08) Associar os gametas; transmissão das características hereditárias, estabelecendo relações entre ancestrais e descendentes.
(EF09CI09) Discutir as ideias de Mendel sobre hereditariedade (fatores hereditários, segregação, gametas, fecundação), considerando-as para resolver problemas envolvendo a transmissão de características hereditárias em diferentes organismos.' WHERE id_topico_aula = 51909142;
UPDATE ava.topico_aula SET conteudo_ministrado = 'Unidade temática: Vida e Evolução.

Objetos do conhecimento: Hereditariedade, Embriogênese, Leis de Mendel.

Habilidades:(EF09CI08) Associar os gametas; transmissão das características hereditárias, estabelecendo relações entre ancestrais e descendentes.
(EF09CI09) Discutir as ideias de Mendel sobre hereditariedade (fatores hereditários, segregação, gametas, fecundação), considerando-as para resolver problemas envolvendo a transmissão de características hereditárias em diferentes organismos.' WHERE id_topico_aula = 51909143;
UPDATE ava.topico_aula SET conteudo_ministrado = 'Unidade temática: Vida e Evolução.

Objetos do conhecimento: Hereditariedade, Embriogênese, Leis de Mendel.

Habilidades:(EF09CI08) Associar os gametas; transmissão das características hereditárias, estabelecendo relações entre ancestrais e descendentes.
(EF09CI09) Discutir as ideias de Mendel sobre hereditariedade (fatores hereditários, segregação, gametas, fecundação), considerando-as para resolver problemas envolvendo a transmissão de características hereditárias em diferentes organismos.' WHERE id_topico_aula = 51909144;
UPDATE ava.topico_aula SET conteudo_ministrado = 'Unidade temática: Vida e Evolução.

Objetos do conhecimento: Hereditariedade, Embriogênese, Leis de Mendel.

Habilidades:(EF09CI08) Associar os gametas; transmissão das características hereditárias, estabelecendo relações entre ancestrais e descendentes.
(EF09CI09) Discutir as ideias de Mendel sobre hereditariedade (fatores hereditários, segregação, gametas, fecundação), considerando-as para resolver problemas envolvendo a transmissão de características hereditárias em diferentes organismos.' WHERE id_topico_aula = 51909145;
UPDATE ava.topico_aula SET conteudo_ministrado = 'Unidade temática: Vida e Evolução.

Objetos do conhecimento: Hereditariedade, Embriogênese, Leis de Mendel.

Habilidades:(EF09CI08) Associar os gametas; transmissão das características hereditárias, estabelecendo relações entre ancestrais e descendentes.
(EF09CI09) Discutir as ideias de Mendel sobre hereditariedade (fatores hereditários, segregação, gametas, fecundação), considerando-as para resolver problemas envolvendo a transmissão de características hereditárias em diferentes organismos.' WHERE id_topico_aula = 51910752;
UPDATE ava.topico_aula SET conteudo_ministrado = 'Unidade temática: Vida e Evolução.

Objetos do conhecimento: Hereditariedade, Embriogênese, Leis de Mendel.

Habilidades:(EF09CI08) Associar os gametas; transmissão das características hereditárias, estabelecendo relações entre ancestrais e descendentes.
(EF09CI09) Discutir as ideias de Mendel sobre hereditariedade (fatores hereditários, segregação, gametas, fecundação), considerando-as para resolver problemas envolvendo a transmissão de características hereditárias em diferentes organismos.' WHERE id_topico_aula = 51910753;






WITH dados AS (
    SELECT
        ta.id_topico_aula,
        ta."data",
        ta.conteudo_ministrado,
        ta.descricao,
        ta.data_cadastro,
        ta.programado,
        ta.id_turma
    FROM
        ava.topico_aula ta
    WHERE
        ta.descricao IS NOT NULL
        AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
        AND ta.data_cadastro >= '2025-01-01'
        AND ta.programado = TRUE
        AND ta.id_turma = 682125
),
datas_duplicadas_e_nao_programados AS (
    SELECT
        d."data"
    FROM
        dados d
    JOIN
        ava.topico_aula taa ON d."data" = taa."data" AND d.id_turma = taa.id_turma
    WHERE
        taa.programado = FALSE -- Verifica se o registro correspondente NAO está programado
    GROUP BY
        d."data"
    HAVING
        COUNT(d."data") > 0 -- Garante que haja pelo menos um registro com essa data e condição
)
SELECT
    d.*
FROM
    dados d
JOIN
    datas_duplicadas_e_nao_programados ddp ON d."data" = ddp."data";
