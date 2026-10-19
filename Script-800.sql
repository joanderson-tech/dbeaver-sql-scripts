select string_agg(id_turma :: varchar, ', ') from ensino.turma t where t.codigo = 'EFAIM1B';
tring_agg(id_atendimento_educacao_especial_estudante::varchar, ', ')
select * from basico.matricula_estudante_serie mes where mes.id_turma_serie = 51892644;

35497185

rollback;

-- Auto-generated SQL script #202507161659
UPDATE ava.topico_aula
	SET programado=true
	WHERE id_topico_aula=51912505;
UPDATE ava.topico_aula
	SET programado=false
	WHERE id_topico_aula=51912506;


select * from ava.topico_aula ta where  ta.id_turma in (681956, 681957, 681958, 681952, 681953, 681954, 681955, 681960, 681959) and ta."data" in('2025-06-23'); 

=(682125, 2025-05-05, t, f)

DELETE FROM ava.topico_aula WHERE id_topico_aula=51902648;

DELETE FROM ava.topico_aula WHERE id_topico_aula=51911933;
DELETE FROM ava.topico_aula WHERE id_topico_aula=51911934;
SELECT *--ta.id_turma, ta."data", ta.fim, ta.bimestre, ta.descricao, ta.conteudo_ministrado, ta.programado
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado 
  and ta.id_turma = 681952;

DELETE FROM ava.topico_aula WHERE id_topico_aula=51911915;
DELETE FROM ava.topico_aula WHERE id_topico_aula=51911355;

DELETE FROM ava.topico_aula WHERE id_topico_aula=51911921;
EF01MA07

select * from ava.topico_aula ta where 1 = 1
and ta.descricao is not null 
and ta.conteudo is not null 
and ta.programado = ativo ;

commit;
begin;
rollback;
SELECT
    'INSERT INTO ava.topico_aula (' || 
    'id_topico_aula, ' ||              
    'id_turma, descricao, "data", fim, id_topico_pai, conteudo, id_usuario, data_cadastro, visivel, ativo, id_docente_turma, aula_cancelada, id_aula_extra, bimestre, programado, bimestral, necessita_correcao, replica_conteudo, conteudo_ministrado' || -- Parte 2 das colunas
    ') VALUES(' ||                    
    'nextval(''hibernate_sequence''), ' || -
    ta.id_turma || ', ' ||
    'NULL, ' || 
    '''' || ta."data" || ''', ' || 
    CASE WHEN ta.fim IS NOT NULL THEN '''' || ta.fim || '''' ELSE 'NULL' END || ', ' || -- fim (pode ser NULL)
    'NULL, ' || 
    'NULL, ' || 
    '1, ' || 
    'now(), ' || 
    'false, ' || 
    'true, ' || 
    'NULL, ' || 
    'false, ' || -- aula_cancelada
    'NULL, ' || -- id_aula_extra
    ta.bimestre || ', ' || -- Pega o bimestre da consulta
    'false, ' || -- programado
    'false, ' || -- bimestral
    'false, ' || -- necessita_correcao
    'false, ' || -- replica_conteudo
    CASE WHEN ta.conteudo_ministrado IS NOT NULL THEN '''' || REPLACE(ta.conteudo_ministrado, '''', '''''') || '''' ELSE 'NULL' END || -- conteudo_ministrado (trata aspas internas)
    ');' AS insert_statement -- Fim da string
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado = true
  and ta.id_turma = 681952;




select * from public.backup_educ_660;




begin;

rollback;

-- Tabela para armazenar os IDs dos novos registros inseridos em ava.topico_aula
CREATE TEMPORARY TABLE temp_inserted_topico_aula_ids ( id_topico_aula BIGINT PRIMARY KEY );
-- Tabela para fazer um backup temporário do conteúdo original antes de ser alterado
CREATE TEMPORARY TABLE backup_conteudo_ministrado ( id_topico_aula BIGINT PRIMARY KEY, conteudo_original TEXT,  data_backup TIMESTAMP DEFAULT now() );
-- Tabela para armazenar IDs e conteúdos dos tópicos que possuem "datas duplicadas"
CREATE TEMPORARY TABLE temp_topicos_duplicados ( id_topico_aula INT, conteudo_ministrado TEXT );

--2. Identificação e Inserção de Dados de "Tópicos Duplicados" na Tabela Temporária
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
    SELECT d."data"
    FROM dados d
    JOIN ava.topico_aula taa ON d."data" = taa."data" AND d.id_turma = taa.id_turma
    WHERE taa.programado = FALSE -- Verifica se o registro correspondente NAO está programado
    GROUP BY d."data" HAVING COUNT(d."data") > 0 -- Garante que haja pelo menos um registro com essa data e condição
)
SELECT d.id_topico_aula, d.conteudo_ministrado
FROM dados d
JOIN datas_duplicadas_e_nao_programados ddp ON d."data" = ddp."data";

-- 3. Geração de Comandos SQL para Restauração (Backup dos Tópicos Duplicados)
SELECT 'UPDATE ava.topico_aula SET conteudo_ministrado = ' || CASE WHEN b.conteudo_ministrado IS NOT NULL THEN '''' || REPLACE(b.conteudo_ministrado, '''', '''''') || '''' ELSE 'NULL' END || ' WHERE id_topico_aula = ' || b.id_topico_aula || ';' AS restore_statement FROM temp_topicos_duplicados b;

--4. Anular o Conteúdo Ministrado dos Tópicos Duplicados
UPDATE ava.topico_aula SET conteudo_ministrado = '' WHERE id_topico_aula IN (SELECT id_topico_aula FROM temp_topicos_duplicados);

--5. Inserção de Novos Registros (Com Conteúdo Ministrado Original)
WITH inserted_rows AS ( INSERT INTO ava.topico_aula ( id_topico_aula, id_turma, descricao, "data", fim, id_topico_pai, conteudo, id_usuario, data_cadastro, visivel, ativo, id_docente_turma, aula_cancelada, id_aula_extra, bimestre, programado,
        bimestral, necessita_correcao, replica_conteudo, conteudo_ministrado )
    SELECT nextval('hibernate_sequence') AS id_topico_aula, -- <<< CHAMAMOS NEXTVAL AQUI PARA CADA LINHA >>>
        ta.id_turma,
        NULL AS descricao,
        ta."data",
        ta.fim,
        NULL AS id_topico_pai, NULL AS conteudo, 1 AS id_usuario, now() AS data_cadastro, false AS visivel, true AS ativo,  NULL AS id_docente_turma, false AS aula_cancelada,  NULL AS id_aula_extra, ta.bimestre, false AS programado, false AS bimestral, false AS necessita_correcao, false AS replica_conteudo, ta.conteudo_ministrado
    FROM ava.topico_aula ta
    WHERE ta.descricao IS NOT NULL
      AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
      AND ta.data_cadastro >= '2025-01-01'
      AND ta.programado = true
    RETURNING id_topico_aula
)
INSERT INTO temp_inserted_topico_aula_ids (id_topico_aula)
SELECT id_topico_aula FROM inserted_rows;

--06
-- Inseri o dado na tabela temporia para o backup
INSERT INTO backup_conteudo_ministrado (id_topico_aula, conteudo_original)
SELECT ta.id_topico_aula, ta.conteudo_ministrado
FROM ava.topico_aula ta
WHERE ta.descricao IS NOT NULL
  AND (ta.conteudo_ministrado IS NOT NULL AND TRIM(ta.conteudo_ministrado) <> '')
  AND ta.data_cadastro >= '2025-01-01'
  AND ta.programado = true
  AND ta.id_turma = 681952;

--- Remove o conteudo, deixando-o vazio para os IDs que acabaram de ser backupeados
UPDATE ava.topico_aula SET conteudo_ministrado = '' WHERE id_topico_aula IN ( SELECT id_topico_aula FROM backup_conteudo_ministrado );

--07
---- Script de backup/restauração (gera comandos UPDATE para reverter as alterações)
SELECT 'UPDATE ava.topico_aula SET conteudo_ministrado = ' || CASE WHEN b.conteudo_original IS NOT NULL THEN '''' || REPLACE(b.conteudo_original, '''', '''''') || '''' ELSE 'NULL' END || ' WHERE id_topico_aula = ' || b.id_topico_aula || ';' AS restore_statement FROM backup_conteudo_ministrado b;
SELECT 'DELETE FROM ava.topico_aula WHERE id_topico_aula = ' || tid.id_topico_aula || ';' AS delete_statement FROM temp_inserted_topico_aula_ids tid;


-- 5. Opcional: Eliminar a Tabela Temporária (se não for necessária após as operações)
/*DROP TABLE temp_topicos_duplicados;
DROP table temp_inserted_topico_aula_ids;
DROP table temp_inserted_topico_aula_ids*/

[
  {
    "script": [
      "update comum.parametro p set valor = 'https://'||regexp_replace(di.valor, '^https?://(.*)', '\\1')||'/app/documentos' from comum.dados_institucionais di where p.codigo = '2_10100_8' AND p.valor LIKE '%sigeduc_cloud_ref-%' and di.nome = 'linkSigaa';"
    ],
    "database": "comumdb"
  }
]


DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912443;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912444;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912445;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912446;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912447;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912448;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912449;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912450;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912451;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912452;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912453;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912454;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912455;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912456;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912457;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912458;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912459;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912460;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912461;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912462;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912463;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912464;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912465;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912466;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912467;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912468;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912469;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912470;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912471;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912472;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912473;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912474;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912475;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912476;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912477;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912478;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912479;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912480;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912481;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912482;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912483;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912484;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912485;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912486;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912487;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912488;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912489;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912490;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912491;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912492;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912493;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912494;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912495;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912496;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912497;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912498;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912499;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912500;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912501;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912502;
DELETE FROM ava.topico_aula WHERE id_topico_aula = 51912503;

commit;

UPDATE ava.topico_aula SET conteudo_ministrado = 'CONTEÚDO MINISTRADO – 



 OBJETIVOS DE APRENDIZAGEM
Estimular a percepção visual e sensorial das cores e das formas por meio da arte.
Promover a expressão criativa e o entendimento dos elementos básicos da linguagem teatral.
Resolver problemas matemáticos de adição e subtração, utilizando estratégias diversas.
Compreender a relação entre espaço, quantidade e representação gráfica.

 HABILIDADES (BNCC)
Arte
EF15AR01 – Explorar diferentes formas de expressão artística (cores, traços, texturas, sons e gestos).
EF15AR02 – Experimentar materiais, ferramentas e suportes variados nas produções artísticas.
EF15AR04 – Criar produções individuais e coletivas com base em vivências culturais.
EF15AR06 – Compartilhar suas criações com os colegas, respeitando as dos outros.
EF13AR72RN – Reconhecer e utilizar elementos construtivos do teatro (personagens, cenário, corpo, voz, objetos, gestos).
Matemática
EF01MA06 – Resolver problemas de adição e subtração com números naturais até 20.
EF01MA08 – Utilizar estratégias pessoais e recursos diversos no cálculo mental e no registro de operações.

 UNIDADES TEMÁTICAS
Arte: Unidade 1 – Um mundo de cores (Livro de Artes – págs. 14 e 15)
Matemática: Adição e subtração com números até 20


Arte (Livro – páginas 14 e 15)
Observação e exploração de imagens artísticas com variedade de cores (quentes e frias).
Discussão sobre o significado das cores e as emoções que transmitem.
Identificação dos elementos do teatro presentes na ilustração: personagens, cenário, figurinos, gestos e expressões.
Produção de uma máscara ou personagem colorido, com base nas sensações transmitidas pelas cores.
Representação expressiva com gestos, sons e movimentos, relacionando arte visual com linguagem teatral.

Matemática (atividade oral + tarefa para casa)
Resolução de situações-problema simples com adição e subtração, usando objetos da sala (tintas, pincéis, lápis, etc.).
Fixação dos conceitos de somar (juntar) e subtrair (tirar), com apoio visual e corporal.
Desenvolvimento de estratégias pessoais de cálculo mental, explorando diferentes formas de encontrar o resultado.
Proposta de exercícios no livro (págs. 97 a 100) com atividades ilustradas, cálculos e uso de quadros numéricos.

' WHERE id_topico_aula = 51911475;
UPDATE ava.topico_aula SET conteudo_ministrado = 'CONTEUDO MINISTRADO
Geografia
Observação dos ritmos naturais: diferença entre o dia e a noite.

Percepção das mudanças de temperatura e clima: tempo de sol, chuva, frio e calor.

Comparação entre atividades feitas em diferentes períodos do dia (manhã, tarde e noite).

Registro no caderno com frases e desenhos representando ações de cada momento do dia.

Relato oral dos alunos sobre o que fazem em dias frios ou chuvosos.

 Ensino Religioso
Reconhecimento de sentimentos, lembranças e memórias pessoais relacionadas ao clima e ao tempo (ex: lembrar da família, de um momento feliz ou triste).

Valorização das histórias de vida e das emoções dos colegas.

Desenho livre com o tema: “Minha lembrança favorita do tempo”.

Reflexão coletiva sobre o cuidado com o outro e o respeito às vivências diferentes.

 OBJETIVOS DE APRENDIZAGEM
Observar e descrever mudanças naturais como o dia e a noite, o calor e o frio, o tempo seco ou chuvoso.

Reconhecer que essas mudanças afetam nossas atividades, roupas, alimentação e sentimentos.

Identificar lembranças, sentimentos e saberes pessoais relacionados a esses momentos (ex: “Gosto do frio porque me lembro do chocolate quente da vovó”).

Valorizar e compartilhar experiências afetivas, respeitando as dos colegas.

 HABILIDADES (BNCC)
Geografia

EF01GE05 – Observar e descrever ritmos naturais (dia e noite, variações de temperatura e umidade) em diferentes escalas, comparando com a sua realidade.

Ensino Religioso

EF01ER05 – Identificar e acolher sentimentos, lembranças, memórias e saberes de cada um.

 UNIDADES TEMÁTICAS
Geografia: Tempo atmosférico e ritmos naturais
Ensino Religioso: Emoções, lembranças e sabedoria das experiências
' WHERE id_topico_aula = 51911373;
UPDATE ava.topico_aula SET conteudo_ministrado = 'OBJETIVOS DE APRENDIZAGEM
Resolver operações de adição com dois algarismos.

Desenvolver o cálculo mental e o uso do algoritmo da adição.

Identificar a operação de adição como forma de juntar quantidades.

Estimular a atenção, organização e autonomia na realização da tarefa.

 HABILIDADES (BNCC)
EF01MA06 – Resolver e elaborar problemas de adição e subtração com números naturais, com o uso de estratégias pessoais, como o cálculo mental, cálculo por estimativa e algoritmos.

EF01MA08 – Utilizar fatos básicos da adição e da subtração como estratégia para resolver problemas.

 CONTEÚDO MINISTRADO
Revisão do conceito de adição como "juntar ou acrescentar".

Introdução à adição com dois dígitos, com e sem necessidade de reagrupamento.

Leitura e resolução oral de problemas simples do tipo:
"Havia 3 pássaros. Chegaram mais 2. Quantos há agora?"

Orientação coletiva na lousa com exemplos visuais e numéricos.

Registro da adição usando o formato vertical e horizontal.

Correção coletiva de alguns exemplos, reforçando a contagem e o valor posicional.

' WHERE id_topico_aula = 51911570;
UPDATE ava.topico_aula SET conteudo_ministrado = 'CONTEÚDO MINISTRADO
UNIDADE TEMÁTICA
Língua Portuguesa:

Sistema de escrita alfabética: relações entre letras e sons.

Construção do vocabulário e formação de palavras.

Leitura e escrita de palavras com foco em fonemas e sílabas.

Educação Física:

Jogos e brincadeiras.

Expressão corporal e movimentos no espaço.

Coordenação motora ampla e organização espacial.

OBJETIVOS DE APRENDIZAGEM
Identificar e escrever palavras com a letra P.

Desenvolver consciência fonológica focando no som /p/.

Ampliar o vocabulário com palavras do cotidiano que iniciam com a letra P (ex: pato, panela, pipoca, pé).

Estimular a coordenação motora ampla por meio de brincadeiras educativas.

Valorizar a socialização, o respeito às regras e a expressão corporal.

HABILIDADES (BNCC)
Língua Portuguesa:

EF01LP04 – Reconhecer o sistema de escrita alfabética, relacionando grafemas e fonemas.

EF01LP05 – Localizar informações explícitas em textos.

Educação Física:

EF01EF03 – Participar de brincadeiras e jogos que envolvam deslocamentos e movimentos do corpo.

EF01EF05 – Demonstrar atitudes de respeito e cooperação nas atividades.



Conteúdo
Língua Portuguesa:
Palavras iniciadas com a letra P (ex: pato, panela, pipa, pé, pão, pedra).

Ditado e leitura de palavras com sílabas PA, PE, PI, PO, PU.

Jogo com sílabas móveis para formação de palavras.

Atividade com imagens para ligar palavra–figura com P.

Educação Física:

Atividade corporal lúdica no pátio:

“O Pulo do Pato” – pular como pato até o cartaz com palavra que começa com P.

“Corrida da Pipa” – correr de um ponto ao outro equilibrando uma folha com a letra P na mão.

“Panela Maluca” – circuito com movimentos como agachar, girar e saltar.

' WHERE id_topico_aula = 51912023;
UPDATE ava.topico_aula SET conteudo_ministrado = 'TESTE' WHERE id_topico_aula = 51911355;



-------------------
UPDATE ava.topico_aula SET conteudo_ministrado = 'CONTEÚDO MINISTRADO – 



 OBJETIVOS DE APRENDIZAGEM
Estimular a percepção visual e sensorial das cores e das formas por meio da arte.
Promover a expressão criativa e o entendimento dos elementos básicos da linguagem teatral.
Resolver problemas matemáticos de adição e subtração, utilizando estratégias diversas.
Compreender a relação entre espaço, quantidade e representação gráfica.

 HABILIDADES (BNCC)
Arte
EF15AR01 – Explorar diferentes formas de expressão artística (cores, traços, texturas, sons e gestos).
EF15AR02 – Experimentar materiais, ferramentas e suportes variados nas produções artísticas.
EF15AR04 – Criar produções individuais e coletivas com base em vivências culturais.
EF15AR06 – Compartilhar suas criações com os colegas, respeitando as dos outros.
EF13AR72RN – Reconhecer e utilizar elementos construtivos do teatro (personagens, cenário, corpo, voz, objetos, gestos).
Matemática
EF01MA06 – Resolver problemas de adição e subtração com números naturais até 20.
EF01MA08 – Utilizar estratégias pessoais e recursos diversos no cálculo mental e no registro de operações.

 UNIDADES TEMÁTICAS
Arte: Unidade 1 – Um mundo de cores (Livro de Artes – págs. 14 e 15)
Matemática: Adição e subtração com números até 20


Arte (Livro – páginas 14 e 15)
Observação e exploração de imagens artísticas com variedade de cores (quentes e frias).
Discussão sobre o significado das cores e as emoções que transmitem.
Identificação dos elementos do teatro presentes na ilustração: personagens, cenário, figurinos, gestos e expressões.
Produção de uma máscara ou personagem colorido, com base nas sensações transmitidas pelas cores.
Representação expressiva com gestos, sons e movimentos, relacionando arte visual com linguagem teatral.

Matemática (atividade oral + tarefa para casa)
Resolução de situações-problema simples com adição e subtração, usando objetos da sala (tintas, pincéis, lápis, etc.).
Fixação dos conceitos de somar (juntar) e subtrair (tirar), com apoio visual e corporal.
Desenvolvimento de estratégias pessoais de cálculo mental, explorando diferentes formas de encontrar o resultado.
Proposta de exercícios no livro (págs. 97 a 100) com atividades ilustradas, cálculos e uso de quadros numéricos.

' WHERE id_topico_aula = 51911475;
UPDATE ava.topico_aula SET conteudo_ministrado = 'CONTEUDO MINISTRADO
Geografia
Observação dos ritmos naturais: diferença entre o dia e a noite.

Percepção das mudanças de temperatura e clima: tempo de sol, chuva, frio e calor.

Comparação entre atividades feitas em diferentes períodos do dia (manhã, tarde e noite).

Registro no caderno com frases e desenhos representando ações de cada momento do dia.

Relato oral dos alunos sobre o que fazem em dias frios ou chuvosos.

 Ensino Religioso
Reconhecimento de sentimentos, lembranças e memórias pessoais relacionadas ao clima e ao tempo (ex: lembrar da família, de um momento feliz ou triste).

Valorização das histórias de vida e das emoções dos colegas.

Desenho livre com o tema: “Minha lembrança favorita do tempo”.

Reflexão coletiva sobre o cuidado com o outro e o respeito às vivências diferentes.

 OBJETIVOS DE APRENDIZAGEM
Observar e descrever mudanças naturais como o dia e a noite, o calor e o frio, o tempo seco ou chuvoso.

Reconhecer que essas mudanças afetam nossas atividades, roupas, alimentação e sentimentos.

Identificar lembranças, sentimentos e saberes pessoais relacionados a esses momentos (ex: “Gosto do frio porque me lembro do chocolate quente da vovó”).

Valorizar e compartilhar experiências afetivas, respeitando as dos colegas.

 HABILIDADES (BNCC)
Geografia

EF01GE05 – Observar e descrever ritmos naturais (dia e noite, variações de temperatura e umidade) em diferentes escalas, comparando com a sua realidade.

Ensino Religioso

EF01ER05 – Identificar e acolher sentimentos, lembranças, memórias e saberes de cada um.

 UNIDADES TEMÁTICAS
Geografia: Tempo atmosférico e ritmos naturais
Ensino Religioso: Emoções, lembranças e sabedoria das experiências
' WHERE id_topico_aula = 51911373;
UPDATE ava.topico_aula SET conteudo_ministrado = 'OBJETIVOS DE APRENDIZAGEM
Resolver operações de adição com dois algarismos.

Desenvolver o cálculo mental e o uso do algoritmo da adição.

Identificar a operação de adição como forma de juntar quantidades.

Estimular a atenção, organização e autonomia na realização da tarefa.

 HABILIDADES (BNCC)
EF01MA06 – Resolver e elaborar problemas de adição e subtração com números naturais, com o uso de estratégias pessoais, como o cálculo mental, cálculo por estimativa e algoritmos.

EF01MA08 – Utilizar fatos básicos da adição e da subtração como estratégia para resolver problemas.

 CONTEÚDO MINISTRADO
Revisão do conceito de adição como "juntar ou acrescentar".

Introdução à adição com dois dígitos, com e sem necessidade de reagrupamento.

Leitura e resolução oral de problemas simples do tipo:
"Havia 3 pássaros. Chegaram mais 2. Quantos há agora?"

Orientação coletiva na lousa com exemplos visuais e numéricos.

Registro da adição usando o formato vertical e horizontal.

Correção coletiva de alguns exemplos, reforçando a contagem e o valor posicional.

' WHERE id_topico_aula = 51911570;
UPDATE ava.topico_aula SET conteudo_ministrado = 'CONTEÚDO MINISTRADO
UNIDADE TEMÁTICA
Língua Portuguesa:

Sistema de escrita alfabética: relações entre letras e sons.

Construção do vocabulário e formação de palavras.

Leitura e escrita de palavras com foco em fonemas e sílabas.

Educação Física:

Jogos e brincadeiras.

Expressão corporal e movimentos no espaço.

Coordenação motora ampla e organização espacial.

OBJETIVOS DE APRENDIZAGEM
Identificar e escrever palavras com a letra P.

Desenvolver consciência fonológica focando no som /p/.

Ampliar o vocabulário com palavras do cotidiano que iniciam com a letra P (ex: pato, panela, pipoca, pé).

Estimular a coordenação motora ampla por meio de brincadeiras educativas.

Valorizar a socialização, o respeito às regras e a expressão corporal.

HABILIDADES (BNCC)
Língua Portuguesa:

EF01LP04 – Reconhecer o sistema de escrita alfabética, relacionando grafemas e fonemas.

EF01LP05 – Localizar informações explícitas em textos.

Educação Física:

EF01EF03 – Participar de brincadeiras e jogos que envolvam deslocamentos e movimentos do corpo.

EF01EF05 – Demonstrar atitudes de respeito e cooperação nas atividades.



Conteúdo
Língua Portuguesa:
Palavras iniciadas com a letra P (ex: pato, panela, pipa, pé, pão, pedra).

Ditado e leitura de palavras com sílabas PA, PE, PI, PO, PU.

Jogo com sílabas móveis para formação de palavras.

Atividade com imagens para ligar palavra–figura com P.

Educação Física:

Atividade corporal lúdica no pátio:

“O Pulo do Pato” – pular como pato até o cartaz com palavra que começa com P.

“Corrida da Pipa” – correr de um ponto ao outro equilibrando uma folha com a letra P na mão.

“Panela Maluca” – circuito com movimentos como agachar, girar e saltar.

' WHERE id_topico_aula = 51912023;
UPDATE ava.topico_aula SET conteudo_ministrado = 'TESTE' WHERE id_topico_aula = 51911355;

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



