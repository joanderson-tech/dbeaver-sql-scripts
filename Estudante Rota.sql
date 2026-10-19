BEGIN;

SELECT t.data_hora AS DATA, p.nome AS ESTUDANTE, 
	CASE 
        WHEN t.type = 'I' THEN 'Alocação'
        WHEN t.type = 'D' THEN 'Desalocação'
        ELSE t.type 
    END AS Tipo,
    CASE 
        WHEN t.endereco = '/app/matricula/transferencia/movimentacaoEstudanteEscola/formCadastroMovimentacao.jsf' THEN 'Transferencia estudante'
        WHEN t.endereco = '/app/transporte/controle/gerencia_estudante_rota.jsf' THEN 'Gerencia Rota'
        ELSE t.endereco 
    END AS operacao,
    r.descricao AS ROTA -- Ajustado para data_referencia conforme sua tabela
FROM public.log_transporte t
JOIN discente d ON d.id_discente = t.id_discente
JOIN transporte.rota r ON r.id_rota = t.id_rota
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
JOIN comum.usuario u ON t.usuario_id
ORDER BY 
    r.descricao::integer ASC, -- Converte a descrição para número antes de ordenar
    p.nome ASC;

SELECT * FROM public.log_transporte;


DROP TABLE IF EXISTS public.carga_logs_temp;

CREATE TABLE public.carga_logs_temp (
    operacao VARCHAR(50), id_discente BIGINT, id_rota BIGINT, data_referencia TIMESTAMP
);



CREATE TABLE public.log_transporte (
    usuario_id    INTEGER,
    endereco      VARCHAR(255),
    type          CHAR(1),
    id_discente   BIGINT,
    id_rota       BIGINT,
    data_hora     TIMESTAMP,
    entity_name   VARCHAR(100)
);






SELECT 
    t.data_hora AS DATA, 
    p.nome AS ESTUDANTE, 
    p_resp.nome AS RESPONSAVEL_ACAO, -- Novo campo adicionado
    CASE 
        WHEN t.type = 'I' THEN 'Alocação'
        WHEN t.type = 'D' THEN 'Desalocação'
        ELSE t.type 
    END AS Tipo,
    CASE 
        WHEN t.endereco = '/app/matricula/transferencia/movimentacaoEstudanteEscola/formCadastroMovimentacao.jsf' THEN 'Transferencia estudante'
        WHEN t.endereco = '/app/transporte/controle/gerencia_estudante_rota.jsf' THEN 'Gerencia Rota'
        ELSE t.endereco 
    END AS operacao,
    r.descricao AS ROTA
FROM public.log_transporte t
JOIN discente d ON d.id_discente = t.id_discente
JOIN transporte.rota r ON r.id_rota = t.id_rota
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa -- Esta é a pessoa do estudante
-- Agora pegamos o usuário e a pessoa ligada a esse usuário
JOIN comum.usuario u ON u.id_usuario = t.usuario_id 
JOIN comum.pessoa p_resp ON p_resp.id_pessoa = u.id_pessoa -- Esta é a pessoa que operou o sistema
ORDER BY 
    r.descricao ASC, 
    p.nome ASC;



SELECT 
    t.data_hora AS DATA, 
    p.nome AS ESTUDANTE, 
    p_resp.nome AS RESPONSAVEL_ACAO,
    CASE 
        WHEN t.type = 'I' THEN 'Alocação'
        WHEN t.type = 'D' THEN 'Desalocação'
        ELSE t.type 
    END AS Tipo,
    CASE 
        WHEN t.endereco = '/app/matricula/transferencia/movimentacaoEstudanteEscola/formCadastroMovimentacao.jsf' THEN 'Transferência estudante'
        WHEN t.endereco = '/app/transporte/controle/gerencia_estudante_rota.jsf' THEN 'Gerência Rota'
        ELSE t.endereco 
    END AS operacao,
    r.descricao AS ROTA
FROM public.log_transporte t
JOIN discente d ON d.id_discente = t.id_discente
JOIN transporte.rota r ON r.id_rota = t.id_rota
JOIN comum.pessoa p ON p.id_pessoa = d.id_pessoa 
JOIN comum.usuario u ON u.id_usuario = t.usuario_id 
JOIN comum.pessoa p_resp ON p_resp.id_pessoa = u.id_pessoa 
ORDER BY 
	r.descricao DESC , 
    p.nome ASC,
	t.data_hora;

