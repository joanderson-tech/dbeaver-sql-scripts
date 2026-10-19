select *  --string_agg(id_turma ::varchar, ', ') 
from ensino.turma where codigo = 'EFAIM5A' and ano = 2025; and id_turma = 716181;

select * from ensino.docente_turma dt where dt.id_turma = 721922;

select * from diario.topico_aula ta ;

SELECT * FROM ava.topico_aula ta WHERE id_turma = 721922; and ta.ativo = false;

select * from basico.matricula_componente_serie mcs; 
--3º Ano A- professora Vanessa Vieira dos Santos
SELECT * FROM comum.usuario u WHERE login = 'vanessa2017sb@hotmail.com' AND id_usuario = 104941;
SELECT * FROM comum.pessoa p WHERE id_pessoa = 51874801;
SELECT * FROM rh.servidor s WHERE id_pessoa = 51874801 AND id_servidor = 1202;
SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 52 AND id_docente_turma = 55875082 AND id_turma = 699756;
SELECT DATA, descricao, conteudo_ministrado, * FROM ava.topico_aula ta WHERE id_turma = 721922;

--3º Ano B - Ilana dos Santos Diniz Oliveira: conteúdos de 17 a 21 de junho
SELECT * FROM comum.usuario u WHERE login = 'dinizilana622@gmail.com' AND id_usuario = 105504;
SELECT * FROM comum.pessoa p WHERE id_pessoa = 755204;
SELECT * FROM rh.servidor s WHERE id_pessoa = 755204 AND id_servidor = 575;
SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 575 AND id_docente_turma = 55875098 AND id_turma = 699813;
SELECT * FROM ava.topico_aula ta WHERE id_turma = 699813;

--3 Ano C - Renata Alves Targino: Plano anual 1 e 2 bimestre e os conteúdos de 10 a 21 de junho
SELECT * FROM comum.usuario u WHERE login = 'renatacw7@gmail.com' AND id_usuario = 105513;
SELECT * FROM comum.pessoa p WHERE id_pessoa = 755243;
SELECT * FROM rh.servidor s WHERE id_pessoa = 755243 AND id_servidor = 583;
SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 583 AND id_docente_turma = 55944421 AND id_turma = 700076;
SELECT * FROM ava.topico_aula ta WHERE id_turma = 700076 AND ta.programado;

 select
	distinct rfs.data_aula
from
	ensino.registro_falta_professor rfs
join ensino.docente_turma dt on
	(dt.id_docente_turma = rfs.id_docente_turma)
where
	dt.ativo is true
	and rfs.ativo is true
	and dt.id_turma in (721922);
 
 with docente_turma_view as (
select
	dt.id_docente,
	dt.id_turma,
	dt.ativo,
	row_number() over(order by dt.data_fim desc) as ordem
from
	ensino.docente_turma dt
where
	dt.id_turma = ?
	and dt.ativo
)select
	distinct ie.id_interrupcao_escola
from
	ensino.interrupcao_escola_professor iep
join ensino.interrupcao_escola ie
		using (id_interrupcao_escola)
join docente_turma_view dtv on
	dtv.id_docente = iep.id_professor
	and dtv.ordem = 1
where
	dtv.id_turma = ?
	and (ie.id_turno is null
		or ie.id_turno = ? )
	and dtv.ativo 

	
	--3º Ano A- professora Vanessa Vieira dos Santos
SELECT * FROM comum.usuario u WHERE login = 'vanessa2017sb@hotmail.com' AND id_usuario = 104941;
SELECT * FROM comum.pessoa p WHERE id_pessoa = 746506;
SELECT * FROM rh.servidor s WHERE id_pessoa = 746506 AND id_servidor = 52;
SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 52 AND id_docente_turma = 55875082 AND id_turma = 699756;
SELECT DATA, descricao, conteudo_ministrado, * FROM ava.topico_aula ta WHERE id_turma = 699756;

--3º Ano B - Ilana dos Santos Diniz Oliveira: conteúdos de 17 a 21 de junho
SELECT * FROM comum.usuario u WHERE login = 'dinizilana622@gmail.com' AND id_usuario = 105504;
SELECT * FROM comum.pessoa p WHERE id_pessoa = 755204;
SELECT * FROM rh.servidor s WHERE id_pessoa = 755204 AND id_servidor = 575;
SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 575 AND id_docente_turma = 55875098 AND id_turma = 699813;
SELECT * FROM ava.topico_aula ta WHERE id_turma = 699813;

--3 Ano C - Renata Alves Targino: Plano anual 1 e 2 bimestre e os conteúdos de 10 a 21 de junho
SELECT * FROM comum.usuario u WHERE login = 'renatacw7@gmail.com' AND id_usuario = 105513;
SELECT * FROM comum.pessoa p WHERE id_pessoa = 755243;
SELECT * FROM rh.servidor s WHERE id_pessoa = 755243 AND id_servidor = 583;
SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente = 583 AND id_docente_turma = 55944421 AND id_turma = 700076;
SELECT * FROM ava.topico_aula ta WHERE id_turma = 700076 AND ta.programado;
