select * --string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_turma ft   where ft.id_turma= 687833 and ativo and ft."data" in ('2025-05-31', '2025-06-07');

select string_agg(id_frequencia  ::varchar, ', ')  
from ensino.frequencia_aluno fa 
where fa.id_turma = 687833 
and fa."data" in ('2025-05-31', '2025-06-07');

select * from ava.aula_extra ae where ae.id_turma = 687833 and ae.data_aula in ('2025-05-31', '2025-06-07');



select * from ava.aula_extra ae where ae.id = 52309921;

select
*
from
	ensino.motivo_interrupcao_escola motivointe0_
where
	motivointe0_.id_motivo_interrupcao_escola =5

--Solução
DELETE FROM ava.aula_extra WHERE id in (52309921,52309922);

UPDATE ensino.frequencia_aluno SET ativo=false WHERE id_frequencia in (139222295, 139222296, 139222297, 139222298, 139222299, 139222300, 139222301, 139222302, 139222303, 139222304, 139222305, 139222306, 139222307, 139222308, 139222309, 139222310, 139222311, 139222312, 139222313, 139222314, 139222315, 139272531, 139272532, 139272533, 139272534, 139272535, 139272536, 139272537, 139272538, 139272539, 139272540, 139272541, 139272542, 139272543, 139272544, 139272545, 139272546, 139272547, 139272548, 139272549, 139272550);

UPDATE ensino.frequencia_turma SET ativo=false WHERE id_frequencia_turma in (67417,65045);


--Backup
INSERT INTO ava.aula_extra (id, id_turma, observacoes, data_aula, criado_em, criado_por, numero_aulas, tipo, aula_reposta, descricao, id_servidor, id_registro_cadastro, id_registro_atualizacao, dia_equivalente, de_interrupcao) VALUES(52309921, 687833, 'CAMPO DE EXPERIÊNCIA: ESCUTA, FALA, PENSAMENTO E IMAGINAÇÃO.
EIXO TEMATICO: CONTAÇÂO DE HISTÓRIA
LEITURA DO CONTO (CHAPEUZINHO VERMELHO)
ATIVIDADE ENCAMINHADA PARA CASA COM EXPLICAÇÃO NO GRUPO DE PAIS DO WHATSAPP.', '2025-05-31', '2025-07-11 14:40:06.322', NULL, 1, 1, NULL, 'REPOSIÇÃO DE ATIVIDADE REFERENTE AO DIA 06/03', NULL, 5699463, 5700305, 'Quinta', false);

INSERT INTO ava.aula_extra (id, id_turma, observacoes, data_aula, criado_em, criado_por, numero_aulas, tipo, aula_reposta, descricao, id_servidor, id_registro_cadastro, id_registro_atualizacao, dia_equivalente, de_interrupcao) VALUES(52309922, 687833, 'CAMPO DE EXPERIÊNCIA:ESPAÇOS, TEMPOS, QUANTIDADES, RELAÇÕES E TRANSFORMAÇÕES.
EIXO TEMATICO: CONCEITOS ( ALTO E BAIXO)
ATIVIDADE ENCAMINHADA PARA CASA COM EXPLICAÇÃO NO GRUPO DE PAIS DO WHATSAPP.', '2025-06-07', '2025-07-11 14:41:06.335', NULL, 1, 1, NULL, 'REPOSIÇÃO DE ATIVIDADE REFERENTE AO DIA 07/03', NULL, 5699463, 5700305, 'Sexta', false);

UPDATE ensino.frequencia_aluno SET ativo=true WHERE id_frequencia in (139222295, 139222296, 139222297, 139222298, 139222299, 139222300, 139222301, 139222302, 139222303, 139222304, 139222305, 139222306, 139222307, 139222308, 139222309, 139222310, 139222311, 139222312, 139222313, 139222314, 139222315, 139272531, 139272532, 139272533, 139272534, 139272535, 139272536, 139272537, 139272538, 139272539, 139272540, 139272541, 139272542, 139272543, 139272544, 139272545, 139272546, 139272547, 139272548, 139272549, 139272550);

UPDATE ensino.frequencia_turma SET ativo=true WHERE id_frequencia_turma in (67417,65045);




begin;
commit;

select t.id_turma, t.codigo,
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo  AND u.login ILIKE '%gessicacecilia2016@gmail.com%'














