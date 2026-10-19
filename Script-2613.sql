UPDATE comum.parametro
SET
    codigo = 'diario.nomeRelatorioFinal',
    nome = 'NOME_RELATORIO_FINAL',
    descricao = 'Define qual nome será exibido na funcionalidade de relatório final em turmas avaliadas por nota.'
WHERE codigo = 'diario.nomeRelatorioFinalPolivalente';

INSERT INTO comum.parametro (
    nome,
    descricao,
    valor,
    id_sistema,
    codigo,
    tempo_maximo,
    tipo,
    bloquear_alteracao
)
VALUES (
    'NOME_RELATORIO_FINAL',
    'Define qual nome será exibido na funcionalidade de relatório final em turmas avaliadas por nota.',
    'Relatórios',
    2,
    'diario.nomeRelatorioFinal',
    0,
    12,
    FALSE
)
ON CONFLICT DO NOTHING;


SELECT * FROM comum.parametro p WHERE p.nome ILIKE '%ACESSO_PORTAL_PROFESSOR_EDUC21%'