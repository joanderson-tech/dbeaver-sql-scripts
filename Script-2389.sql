BEGIN;

DO $$
DECLARE
    reg RECORD;
    novo_id INT;
BEGIN
    -- Criamos um laço para percorrer cada habilidade com sua respectiva descrição real
    FOR reg IN 
        WITH dados_originais(codigo, texto_completo) AS (
            VALUES
            ('EF15LP03', '(EF15LP03) Localizar informações explícitas em textos.'),
            ('EF35LP04', '(EF35LP04) Inferir informações implícitas nos textos lidos.'),
            ('EF35LP05', '(EF35LP05) Inferir o sentido de palavras ou expressões desconhecidas em textos, com base no contexto da frase ou do texto.'),
            ('EF35LP01', '(EF35LP01) Ler e compreender, silenciosamente e, em seguida, em voz alta, com autonomia e fluência, textos curtos com nível de textualidade adequado.'),
            ('EF15LP19', '(EF15LP19) Recontar oralmente, com e sem apoio de imagem, textos literários lidos pelo professor.'),
            ('EF35LP02', '(EF35LP02) Selecionar livros da biblioteca e/ou do cantinho de leitura da sala de aula e/ ou disponíveis em meios digitais para leitura individual, justificando a escolha e compartilhando com os colegas sua opinião, após a leitura.'),
            ('EF35LP21', '(EF35LP21) Ler e compreender, de forma autônoma, textos literários de diferentes gêneros e extensões, inclusive aqueles sem ilustrações, estabelecendo preferências por gêneros, temas, autores.'),
            ('EF35LP22', '(EF35LP22) Perceber diálogos em textos narrativos, observando o efeito de sentido de verbos de enunciação e, se for o caso, o uso de variedades linguísticas no discurso direto.'),
            ('EF35LP03', '(EF35LP03) Identificar a ideia central do texto, demonstrando compreensão global.'),
            ('EF35LP26', '(EF35LP26) Ler e compreender, com certa autonomia, narrativas ficcionais que apresentem cenários e personagens, observando os elements da estrutura narrativa: enredo, tempo, espaço, personagens, narrador e a construção do discurso indireto e discurso direto.'),
            ('EF15LP09', '(EF15LP09) Expressar-se em situações de intercâmbio oral com clareza, preocupando-se em ser compreendido pelo interlocutor e usando a palavra com tom de voz audível, boa articulação e ritmo adequado.'),
            ('EF15LP12', '(EF15LP12) Atribuir significado a aspectos não linguísticos (para linguísticos) observados na fala, como direção do olhar, riso, gestos, movimentos da cabeça (de concordância ou discordância), expressão corporal, tom de voz.'),
            ('EF35LP12', '(EF35LP12) Recorrer ao dicionário para esclarecer dúvida sobre a escrita de palavras, especialmente no caso de palavras com relações irregulares fonema - grafema.'),
            ('EF04LP01', '(EF04LP01) Grafar palavras utilizando regras de correspondência fonema grafema regulares diretas e contextuais.'),
            ('EF04LP02', '(EF04LP02) Ler e escrever, corretamente, palavras com sílabas VV e CVV em casos nos quais a combinação VV (ditongo) é reduzida na língua oral (ai, ei, ou).'),
            ('EF35LP13', '(EF35LP13) Memorizar a grafia de palavras de uso frequente nas quais as relações fonema-grafema são irregulares e com h inicial que não representa fonema.'),
            ('EF04LP03', '(EF04LP03) Localizar palavras no dicionário para esclarecer significados, reconhecendo o significado mais plausível para o contexto que deu origem à consulta.'),
            ('EF15LP10', '(EF15LP10) Escutar, com atenção, falas de professores e colegas, formulando perguntas pertinentes ao tema e solicitando esclarecimentos sempre que necessário.'),
            ('EF15LP11', '(EF15LP11) Reconhecer características da conversação espontânea presencial, respeitando os turnos de fala, selecionando e utilizando, durante a conversação, formas de tratamento adequadas, de acordo com a situação e a posição do interlocutor.'),
            ('EF35LP10', '(EF35LP10) Identificar gêneros do discurso oral, utilizados em diferentes situações e contextos comunicativos, e suas características linguístico expressivas e composicionais (conversação espontânea, conversação telefônica, entrevistas pessoais, entrevistas no rádio ou na TV, debate, noticiário de rádio e TV, narração de jogos esportivos no rádio e TV, aula, debate etc.).'),
            ('EF04LP10', '(EF04LP10) Ler e compreender, com autonomia, cartas pessoais de reclamação, dentre outros gêneros do campo da vida cotidiana, de acordo com as convenções do gênero carta e considerando a situação comunicativa e o tema/assunto/ finalidade do texto.'),
            ('EF35LP06', '(EF35LP06) Recuperar relações entre partes de um texto, identificando substituições lexicais (de substantivos por sinônimos) ou pronominais (uso de pronomes anafóricos – pessoais, possessivos, demonstrativos) que contribuem para a continuidade do texto.'),
            ('EF04LP11', '(EF04LP11) Planejar e produzir, com autonomia, cartas pessoais de reclamação, dentre outros gêneros do campo da vida cotidiana, de acordo com as convenções do gênero carta e com a estrutura própria desses textos (problema, opinião, argumentos), considerando a situação comunicativa e o tema/assunto/ finalidade do texto.'),
            ('EF04LP15', '(EF04LP15) Distinguir fatos de opiniões/sugestões em textos (informativos, jornalísticos, publicitários, etc.).'),
            ('EF04LP16', '(EF04LP16) Produzir notícias sobre fatos ocorridos no universo escolar, digitais ou impressas, para o jornal da escola, noticiando os fatos e seus atores e comentando decorrências, de acordo com as convenções do gênero notícia e considerando a situação comunicativa e o tema/assunto do texto.'),
            ('EF04LP19', '(EF04LP19) Ler e compreender textos expositivos de divulgação científica para crianças, considerando a situação comunicativa e o tema/assunto do texto.'),
            ('EF04LP20', '(EF04LP20) Reconhecer a função de gráficos, diagramas e tabelas em textos, como forma de apresentação de dados.'),
            ('EF04LP21', '(EF04LP21) Planejar e produzir textos sobre temas de interesse, com base em resultados de observações e pesquisas em fontes de informações impressas ou eletrônicas, incluindo, quando pertinente, imagens e gráficos ou tabelas simples, considerando a situação comunicativa e o tema/assunto do texto.'),
            ('EF15LP05', '(EF15LP05) Planejar, com a ajuda do professor, o texto que será produzido, considerando a situação comunicativa, os interlocutores (quem escreve/ para quem escreve); a finalidade ou o propósito (escrever para quê); a circulação (onde o texto vai circular); o suporte (qual é o portador do texto); a linguagem, organização e forma do texto e seu tema e pesquisando em meios impressos ou digitais, sempre que for preciso, informações necessárias à produção do texto, organizando em tópicos os dados e as fontes pesquisadas.'),
            ('EF04LP04', '(EF04LP04) Usar acento gráfico (agudo ou circunflexo) em paroxítonas terminadas em -i(s), -l, -r, -ão(s).'),
            ('EF04LP05', '(EF04LP05) Identificar a função na leitura e usar, adequadamente, na escrita ponto final, de interrogação, de exclamação, dois pontos e travessão em diálogos (discurso direto), vírgula em enumerações e em separação de vocativo e de aposto.'),
            ('EF04LP06', '(EF04LP06) Identificar em textos e usar na produção textual a concordância entre substantivo ou pronome pessoal e verbo (concordância verbal).'),
            ('EF35LP11', '(EF35LP11) Ouvir gravações, canções, textos falados em diferentes variedades linguísticas, identificando características regionais, urbanas e rurais da fala e respeitando as diversas variedades linguísticas como características do uso da língua por diferentes grupos regionais ou diferentes culturas locais, rejeitando preconceitos linguísticos.'),
            ('EF35LP18', '(EF35LP18) Escutar, com atenção, apresentações de trabalhos realizados por colegas, formulando perguntas pertinentes ao tema e solicitando esclarecimentos sempre que necessário.'),
            ('EF15LP01', '(EF15LP01) Identificar a função social de textos que circulam em campos da vida social dos quais participa cotidianamente (a casa, a rua, a comunidade, a escola) e nas mídias impressa, de massa e digital, reconhecendo para que foram produzidos, onde circulam, quem os produziu e a quem se destinam.'),
            ('EF15LP02', '(EF15LP02) Estabelecer expectativas em relação da função social do texto), apoiando-se em seus conhecimentos prévios sobre as condições de produção e recepção desse texto, o gênero, o suporte e o universo temático, bem como sobre saliências textuais, recursos gráficos, imagens, dados da própria obra (índice, prefácio etc.), confirmada antecipações e inferências realizadas antes e durante a leitura de textos, checando a adequação das hipóteses realizadas.'),
            ('EF15LP04', '(EF15LP04) Identificar o efeito de sentido produzido pelo uso de recursos expressivos gráficos visuais em textos multissemióticos.'),
            ('EF15LP06', '(EF15LP06) Reler e revisar o texto produzido com a ajuda do professor e a colaboração dos colegas, para corrigi-lo e aprimorá-lo, fazendo cortes, acréscimos, reformulações, correções de ortografia e pontuação.'),
            ('EF04LP12', '(EF04LP12) Assistir, em vídeo digital, a programa infantil com instruções de montagem, de jogos e brincadeiras e, a partir dele, planejar e produzir tutoriais em áudio ou vídeo.'),
            ('EF15LP13', '(EF15LP13) Identificar finalidades da interação oral em diferentes contextos comunicativos (solicitar informações, apresentar opiniões, informar, relatar Experiências etc.).'),
            ('EF04LP13', '(EF04LP13) Identificar e reproduzir, em textos injuntivos instrucionais (instruções de jogos digitais ou impressos), a formatação própria desses textos (verbos imperativos, indicação de passos a ser seguidos) e formato específico dos textos orais ou escritos desses gêneros (lista/ apresentação de materiais e instruções/passos de jogo).'),
            ('EF04LP17', '(EF04LP17) Produzir jornais radiofônicos ou televisivos e entrevistas veiculadas em rádio, TV e na internet, orientando-se por roteiro ou texto e demonstrando conhecimento dos gêneros jornal falado/televisivo e entrevista.'),
            ('EF04LP22', '(EF04LP22) Planejar e produzir, com certa autonomia, verbetes de enciclopédia infantil, digitais ou impressos, considerando a situação comunicativa e o tema/ assunto/finalidade do texto.'),
            ('EF04LP23', '(EF04LP23) Identificar e reproduzir, em verbetes de enciclopédia infantil, digitais ou impressos, a formatação e diagramação específica desse gênero (título do verbete, definição, detalhamento, curiosidades), considerando a situação comunicativa e o tema/ assunto/finalidade do texto.'),
            ('EF04LP24', '(EF04LP24) Identificar e reproduzir, em seu formato, tabelas, diagramas e gráficos em relatórios de observação e pesquisa, como forma de apresentação de dados'),
            ('EF35LP19', '(EF35LP19) Recuperar as Ideias principais em situações formais de escuta de exposições, apresentações e palestras.'),
            ('EF04LP26', '(EF04LP26) Observar, em poemas concretos, o formato, a distribuição e a diagramação das letras do texto na página.'),
            ('EF15LP17', '(EF15LP17) Apreciar poemas visuais e concretos, observando efeitos de sentido criados pelo formato do texto na página, distribuição e diagramação das letras, pelas ilustrações e por outros efeitos visuais.'),
            ('EF04LP07', '(EF04LP07) Identificar em textos e usar na produção textual a concordância entre artigo, substantivo e adjetivo (concordância no grupo nominal).'),
            ('EF04LP08', '(EF04LP08) Reconhecer e grafar, corretamente, palavras derivadas com os sufixos agem, -oso, -eza, -izar/-isar (regulares morfológica).'),
            ('EF35LP14', '(EF35LP14) Identificar em textos e usar na produção textual pronomes pessoais, possessivos e demonstrativos, como recurso coesivo anafórico.'),
            ('EF04LP09', '(EF04LP09) Ler e compreender, com autonomia, boletos, faturas e carnês, dentre outros gêneros do campo da vida cotidiana, de acordo com as convenções do gênero (campos, itens elencados, medidas de consumo, código de barras) e considerando a situação comunicativa e a finalidade do texto.'),
            ('EF15LP07', '(EF15LP07) Editar a versão final do texto, em colaboração com os colegas e com a ajuda do professor, ilustrando, quando for o caso, em suporte adequado, manual ou digital.'),
            ('EF15LP14', '(EF15LP14) Construir o sentido de histórias em quadrinhos e tirinhas, relacionando imagens e palavras e interpretando recursos gráficos (tipos de balões, de letras, onomatopeias).'),
            ('EF04LP14', '(EF04LP14) Identificar, em notícias, fatos, participantes, local e momento/ tempo da ocorrência do fato noticiado.'),
            ('EF35LP16', '(EF35LP16) Identificar e reproduzir, em notícias, manchetes, lides e corpo de notícias simples para público infantil e cartas de reclamação (revista infantil), digitais ou impressos, a formatação e diagramação específica de cada um desses gêneros, inclusive em suas versões orais.'),
            ('EF04LP18', '(EF04LP18) Analisar o padrão entonacional e a expressão facial e corporal de âncoras de jornais radiofônicos ou televisivos e de entrevistadores/entrevistados.'),
            ('EF35LP29', '(EF35LP29) Identificar, em narrativas, cenário, personagem central, conflito gerador, resolution e o ponto de vista com base no qual histórias são narradas, diferenciando narrativas em primeira e terceira pessoas.'),
            ('EF04LP25', '(EF04LP25) Planejar e produzir, com certa autonomia, verbetes de dicionário, digitais ou impressos, considerando a situação comunicativa e o tema/assunto/finalidade do texto.'),
            ('EF35LP20', '(EF35LP20) Expor trabalhos ou pesquisas escolares, em sala de aula, com apoio de recursos multissemióticos (imagens, diagrama, tabelas etc.), orientando-se por roteiro escrito, planejando o tempo de fala e adequando a linguagem à situação comunicativa .'),
            ('EF15LP15', '(EF15LP15) Reconhecer que os textos literários fazem parte do mundo do imaginário e apresentam uma dimensão lúdica, de encantamento, valorizando-os, em sua diversidade cultural, como patrimônio artístico da humanidade.'),
            ('EF15LP18', '(EF15LP18) Relacionar texto com ilustrações e outros recursos gráficos.'),
            ('EF35LP25', '(EF35LP25) Criar narrativas ficcionais, com certa autonomia, utilizando detalhes descritivos, sequências de eventos e imagens apropriadas para sustentar o sentido do texto, e marcadores de tempo, espaço e de fala de personagens.'),
            ('EF04LP27', '(EF04LP27) Identificar, em textos dramáticos, marcadores das falas das personagens e de cena.'),
            ('EF15LPO3', '(EF15LPO3) Localizar informações explícitas em textos.') -- Mantido caso use a grafia com "O"
        ),
        -- Filtro de unicidade para evitar processar duplicados vindos do texto bruto
        lista_limpa AS (
            SELECT DISTINCT ON (codigo) codigo, texto_completo 
            FROM dados_originais
        )
        SELECT codigo, texto_completo FROM lista_limpa
    LOOP
        -- 1. Validamos se o código em questão já existe na base
        IF NOT EXISTS (
            SELECT 1 
            FROM ensino_infantil.habilidade_competencia 
            WHERE descricao LIKE '%(' || reg.codigo || ')%'
        ) THEN
            -- 2. Descobre o maior ID atual e soma 1 para criar a chave primária incremental
            SELECT COALESCE(MAX(id_habilidade_competencia), 0) + 1 
            FROM ensino_infantil.habilidade_competencia 
            INTO novo_id;
            -- 3. Execução do INSERT estruturado
            INSERT INTO ensino_infantil.habilidade_competencia (
                id_habilidade_competencia, 
                descricao, 
                ativo, 
                data_cadastro, 
                habilitado_para_conteudo_ministrado, 
                prioridade_ordenacao
            ) VALUES (
                novo_id, 
                reg.texto_completo, 
                TRUE, 
                NOW(), 
                FALSE, 
                NULL
            );
            RAISE NOTICE 'Inserido com sucesso: % com ID %', reg.codigo, novo_id;
        ELSE
            RAISE NOTICE 'Código % já existe no banco. Pulando inserção.', reg.codigo;
        END IF;

    END LOOP;
END $$;


SELECT * FROM ensino_infantil.habilidade_competencia hc
WHERE hc.ativo = true
  AND hc.descricao SIMILAR TO '%(EF04LP01|EF04LP02|EF04LP03|EF04LP04|EF04LP05|EF04LP06|EF04LP07|EF04LP08|EF04LP09|EF04LP10|EF04LP11|EF04LP12|EF04LP13|EF04LP14|EF04LP15|EF04LP16|EF04LP17|EF04LP18|EF04LP19|EF04LP20|EF04LP21|EF04LP22|EF04LP23|EF04LP24|EF04LP25|EF04LP26|EF04LP27|EF15LP01|EF15LP02|EF15LP03|EF15LP04|EF15LP05|EF15LP06|EF15LP07|EF15LP09|EF15LP10|EF15LP11|EF15LP12|EF15LP13|EF15LP14|EF15LP15|EF15LP17|EF15LP18|EF15LP19|EF15LPO3|EF35LP01|EF35LP02|EF35LP03|EF35LP04|EF35LP05|EF35LP06|EF35LP10|EF35LP11|EF35LP12|EF35LP13|EF35LP14|EF35LP16|EF35LP19|EF35LP20|EF35LP21|EF35LP22|EF35LP25|EF35LP26|EF35LP29)%'
ORDER BY hc.descricao ASC;





Código EF04LP01 já existe no banco. Pulando inserção.
Código EF04LP02 já existe no banco. Pulando inserção.
Inserido com sucesso: EF04LP03 com ID 51870309
Inserido com sucesso: EF04LP04 com ID 51870310
Inserido com sucesso: EF04LP05 com ID 51870311
Código EF04LP06 já existe no banco. Pulando inserção.
Inserido com sucesso: EF04LP07 com ID 51870312
Código EF04LP08 já existe no banco. Pulando inserção.
Inserido com sucesso: EF04LP09 com ID 51870313
Inserido com sucesso: EF04LP10 com ID 51870314
Inserido com sucesso: EF04LP11 com ID 51870315
Inserido com sucesso: EF04LP12 com ID 51870316
Inserido com sucesso: EF04LP13 com ID 51870317
Inserido com sucesso: EF04LP14 com ID 51870318
Inserido com sucesso: EF04LP15 com ID 51870319
Inserido com sucesso: EF04LP16 com ID 51870320
Código EF04LP17 já existe no banco. Pulando inserção.
Inserido com sucesso: EF04LP18 com ID 51870321
Inserido com sucesso: EF04LP19 com ID 51870322
Inserido com sucesso: EF04LP20 com ID 51870323
Código EF04LP21 já existe no banco. Pulando inserção.
Inserido com sucesso: EF04LP22 com ID 51870324
Inserido com sucesso: EF04LP23 com ID 51870325
Inserido com sucesso: EF04LP24 com ID 51870326
Inserido com sucesso: EF04LP25 com ID 51870327
Código EF04LP26 já existe no banco. Pulando inserção.
Inserido com sucesso: EF04LP27 com ID 51870328
Código EF15LP01 já existe no banco. Pulando inserção.
Código EF15LP02 já existe no banco. Pulando inserção.
Código EF15LP03 já existe no banco. Pulando inserção.
Código EF15LP04 já existe no banco. Pulando inserção.
Código EF15LP05 já existe no banco. Pulando inserção.
Código EF15LP06 já existe no banco. Pulando inserção.
Código EF15LP07 já existe no banco. Pulando inserção.
Código EF15LP09 já existe no banco. Pulando inserção.
Código EF15LP10 já existe no banco. Pulando inserção.
Código EF15LP11 já existe no banco. Pulando inserção.
Código EF15LP12 já existe no banco. Pulando inserção.
Código EF15LP13 já existe no banco. Pulando inserção.
Código EF15LP14 já existe no banco. Pulando inserção.
Código EF15LP15 já existe no banco. Pulando inserção.
Código EF15LP17 já existe no banco. Pulando inserção.
Código EF15LP18 já existe no banco. Pulando inserção.
Código EF15LP19 já existe no banco. Pulando inserção.
Inserido com sucesso: EF15LPO3 com ID 51870329
Código EF35LP01 já existe no banco. Pulando inserção.
Código EF35LP02 já existe no banco. Pulando inserção.
Código EF35LP03 já existe no banco. Pulando inserção.
Código EF35LP04 já existe no banco. Pulando inserção.
Código EF35LP05 já existe no banco. Pulando inserção.
Código EF35LP06 já existe no banco. Pulando inserção.
Código EF35LP10 já existe no banco. Pulando inserção.
Código EF35LP11 já existe no banco. Pulando inserção.
Inserido com sucesso: EF35LP12 com ID 51870330
Código EF35LP13 já existe no banco. Pulando inserção.
Inserido com sucesso: EF35LP14 com ID 51870331
Inserido com sucesso: EF35LP16 com ID 51870332
Inserido com sucesso: EF35LP18 com ID 51870333
Inserido com sucesso: EF35LP19 com ID 51870334
Inserido com sucesso: EF35LP20 com ID 51870335
Inserido com sucesso: EF35LP21 com ID 51870336
Inserido com sucesso: EF35LP22 com ID 51870337
Inserido com sucesso: EF35LP25 com ID 51870338
Inserido com sucesso: EF35LP26 com ID 51870339
Inserido com sucesso: EF35LP29 com ID 51870340