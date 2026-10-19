select * from comum.pessoa p where P.nome ilike 'Luana de Jesus Santos';
select * from rh.servidor s where s.id_pessoa in (51953602); --and s.id_ativo = 1;
select * from ava.aula_extra ae where ae.id_servidor = 2836;
select string_agg(id_docente_turma::varchar, ', ') from ensino.docente_turma dt where dt.id_docente = 2836;
select string_agg(id_historico_servidor_terceirizado::varchar, ', ') from pessoas.historico_servidor_terceirizado hst where hst.id_servidor = 2836;
select string_agg(id_historico_transferencia_servidor::varchar, ', ') from rh.historico_transferencia_servidores hts where hts.id_servidor= 2836;

---Patrícia Silva Santos MATRICULA = 1980 NOVO SERVIDOR = 54387259 

Detalhe: Key (id_servidor)=(1734) is still referenced from table "aula_extra".
Detalhe: Key (id_servidor)=(1734) is still referenced from table "docente_turma"
Detalhe: Key (id_servidor)=(1734) is still referenced from table "historico_servidor_terceirizado".
Detalhe: Key (id_servidor)=(1090) is still referenced from table "historico_transferencia_servidores".

begin;
rollback;

MOVER PARA QUAL MATRICULA 18558,501129 TODAS ESTAM DESATIVADAS 

FOI MOVIDO PARA MATRICULA 15164671 QUE ESTAVA COM STATUS ATIVO MAS POSSUI DUAS MATRICULAS 19130, 501557 ALEM DA DITA ANTES




--1º
---Patrícia Silva Santos OS DADOS FORAM UNIFICADOS NA MATRICULA -> 20191

--2º
---Maria da Conceição Santos Araújo da Silva OS DADOS FORAM UNIFICADOS NA MATRICULA -> 501210

--3º
--Amanda Fernandes Lima --NÃO PRECISOU

--4º
--Ana Lucia de Santana Santos OS DADOS FORAM UNIFICADOS NA MATRICULA -> 15164671

--5º
--Luana de Jesus Santos OS DADOS FORAM UNIFICADOS NA MATRICULA -> 501129

SELECT * FROM rh.servidor s WHERE s.id_servidor IN (1090, 1718, 2836);