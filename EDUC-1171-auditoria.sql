select * from log_db ld where entity_id = '751845';

select * from ensino.turma t where t.id_turma = 723568;


select * 
from  discente d 
where d.matricula = '202430006233' -- 1006166

16/01/2025 14:57:59
17/01/2025 07:25:55

17628241409 --cpf
751845
2164514
16/01/2025 14:29:40

5913600
5913656

select * from log_request lr where autenticacao_id = 6225692

select * from registro_entrada re where "data" = '2025-01-15 10:49:46.185';

SELECT to_char(lr.data_hora, 'DD/MM/YYYY hh24:MI:ss') AS data_hora, lr.autenticacao_id, --re.id_usuario, --re.ip, replace(ld.properties, 'ativo=true', '') as item,
    ld.* 
FROM log_db ld 
join public.log_request lr on lr.log_request_id = ld.log_request_id 
WHERE TRUE 
    AND entity_id IN ('56593341')
order by lr.data_hora;

SELECT 
    lr.data_hora - (interval '1 second'*lr.duration/1000) as start,
    lr.data_hora,
    lr.autenticacao_id,
    re.id_usuario,
    COALESCE(lr.url, e.endereco) AS endereco,
    lr.params,
    lr.error,
    lr.instance_name,
    lr.duration,
    lr.method,
    lr.total_update,
    lr.total_insert
FROM log_request lr  
LEFT JOIN endpoint e ON e.id = lr.endpoint_id 
left JOIN registro_entrada re ON re.id_entrada = lr.autenticacao_id 
WHERE TRUE  
    AND lr.data_hora >= '02/09/2025 08:40:34'
    AND autenticacao_id IN (6348814)
--	AND (params ilike '%[Concluir Processo]%')
ORDER BY 1 ;

Log da auditoria

o usuario LIGIA GOMES MAXIMO nada data/hora 2025-09-02 08:38:51.729  buscou a estudante e fez o cadastro do horario pelo caso de uso Portal da Gestão Escolar >> Turmas >> Estudantes da Turma >> Alocar Estudante em Turma
e depois comcluiu, em seguinda retornou ao PortalGestaoEscolar  e acessar o caso de uso 'tal' e faz o mesmo processo do cadatro na data/hora 2025-09-02 08:40:34.810 e cadastra o horario da terca, nessa auditoria n


ão foi visto o usuario cadatrar o Plano de Atendimento com isso concluio que não teve cadastro do plano.