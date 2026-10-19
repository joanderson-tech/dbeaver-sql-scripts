select * from comum.pessoa p where p.nome = 'JAKSON MARTINS TIBÚRCIO DA SILVA';
select * from comum.pessoa p where p.nome = 'MARIA EDUARDA CORREIRA ALVES';
select * from discente d where d.id_pessoa  in (52788861,776554);
select * from basico.estudante e where e.id_estudante in (1370053);
select * from basico.matricula_estudante_serie mes where mes.id_estudante in (1370053);
select string_agg(id_matricula_componente::text, ', ')  from ensino.matricula_componente mc where mc.id_discente = 1370053;
select string_agg(id_frequencia::text, ', ')  from ensino.frequencia_aluno fa where fa.id_discente = 1370053;
select * from ensino.abono_frequencia af where af.id_estudante = 1370053;
select * from escola.solicitacao_documento sd where sd.id_estudante =  980220;
select * from basico.movimentacao_estudante me where id_discente = 980220;
select * from matricula.estudante_inscrito ei where id_estudante  =980220;
select * from comum.pessoa_necessidade_especial pne where id_pessoa = 980220;

select * from comum.pessoa p 
where cpf_cnpj = 17760905432;
-- pessoa mais antigo correto 748767 / errado 750118, 753694

select matricula , id_pessoa , * 
 from discente d 
 where id_pessoa  in (748767,750118, 753694 );
 --id_disc correto 975709   / errado 976966,   980220 

select * 
from basico.matricula_estudante_serie mes 
 where id_estudante in ( 976966,980220 )
 order by ano_calendario; 
 -- pega os ids errados no id Discente errado / e setar no update para o id discente correto /vai para o update

select string_agg(id_matricula_componente::varchar, ', ')  
from ensino.matricula_componente mc where id_discente = 980220;
--17149223, 17149224, 17149225, 17149226, 17149227, 17149228, 17149229, 17149230, 17467751

select string_agg(id_matricula_discente_serie ::varchar, ', ')  
from basico.matricula_estudante_serie where id_estudante  = 980220;
--1412594

select string_agg(id_renovacao_matricula::varchar, ', ')  
from matricula.renovacao_matricula where id_discente  = 980220;
--null

select string_agg(id_frequencia::varchar, ', ')  
from ensino.frequencia_aluno where id_discente  = 980220;
--151805040, 151806143, 151806095, 151805089, 151806035, 151805931, 151807451, 151806983, 151806165, 151807349, 151807432, 151807453, 151807491, 151807509, 151807614, 151807808, 151807810, 151807829, 151816675

select string_agg(id_estudante_documento_pendente::varchar, ', ')  
from basico.estudante_documento_pendente edp where id_estudante  = 980220;
--null

select string_agg(id::varchar, ', ')  from diario.competencia_habilidades_aluno cha where id_discente =  980220;
--NULL

select string_agg(id_historico_implantado::varchar, ', ') from diario.historico_implantado  where id_estudante  =  980220;
--NULL

select id_observacao_discente from ensino.observacao_discente od  where id_discente  =  980220;
--null

SELECT * FROM comum.pessoa_necessidade_especial pne WHERE pne.id_pessoa  = 980220;

select from basico.tipo_movimentacao_estudante tme 
where  = 1402005;

-------------------------------------------------------------------------------
--Usar dados antigos que serão deletados para o backup;
select * FROM basico.estudante WHERE id_estudante in (980220);
select * FROM public.discente WHERE id_discente=980220;
select * FROM comum.pessoa where id_pessoa = 753694; 

--backup



-------------------------------------------------------------------------------
BEGIN;
commit;
rollback;

--SOLUÇÃO

--atualiza ensino.matricula_componente seta no id correto os id discentes errados para univficar
UPDATE ensino.matricula_componente 
	SET id_discente =1392816 
	WHERE id_matricula_componente  in (17021961, 17021962, 17021963, 17022695, 17022692, 17049696, 17049697, 17049698, 17022694, 17022693, 17022696, 17022699, 17022698, 17022697, 17022691, 17049699, 17049692, 17049693, 17049694, 17049695);


-- Alterar basico.matricula_estudante_serie
UPDATE basico.matricula_estudante_serie
	SET id_estudante=1392816
	WHERE id_matricula_discente_serie=1412594;

-- Alterar matricula.renovacao_matricula
UPDATE matricula.renovacao_matricula SET id_discente=1342055 WHERE id_renovacao_matricula in(52803263, 52644623);

-- Alterar ensino.frequencia_aluno
UPDATE ensino.frequencia_aluno 
	SET id_discente= 1392816
	WHERE id_frequencia in (137950183, 137950184, 137950185, 137950186, 137950187, 137950188, 137950189, 137950190, 137950191, 137950436, 137950438, 137950442, 137950440, 137950652, 137950654, 137950655, 137950657, 137950858, 137950859, 137950860, 137950861, 137950857, 137951031, 137951032, 137951033, 137951034, 137951030, 137951172, 137951174, 137951173, 137951348, 137951350, 137951351, 137951352, 137951353, 137951354, 137951355, 137951505, 137950437, 137951175, 137950656, 137976807, 137980893, 137980924, 137980955, 137980986, 137981048, 137981079, 137981109, 137981139, 137981568, 137950862, 137951349, 137983207, 137990973, 137991004, 138005408, 138017099, 138019342, 138021667, 138029557, 138033704, 138057604, 138057981, 138062670, 138074422, 138086748, 138106877, 138107764, 138107795, 138107826, 138107857, 138112751, 138124383, 138139462, 138139493, 138139524, 138145189, 138180076, 138180107, 138182596, 138182627, 138182658, 138182735, 138188092, 138188221, 138192937, 138197490, 138198658, 138204046, 138211754, 138216288, 138217032, 138219572, 138223550, 138230270, 138236498, 138241377, 138243475, 138248910, 138259436, 138261628, 138264349, 138268136, 138269578, 138293237, 138293268, 138293299, 138298069, 138309156, 138334243, 138334317, 138335979, 138336009, 138336078, 138336159, 138342078, 138342172, 138342314, 138342472, 138342502, 138345025, 138350487, 138355125, 138376444, 138376721, 138385168, 138385225, 138385255, 138385285, 138394871, 138389749, 138395341, 138395371, 138395401, 138397413, 138399781, 138399946, 138408042, 138427457, 138434794, 138441699, 138444998, 138454575, 138477457, 138483315, 138489089, 138499145, 138499270, 138504574, 138507313, 138512322, 138513566, 138513731, 138513806, 138542235, 138542264, 138542293, 138545165, 138573995, 138574024, 138574053, 138594582, 138626300, 138626378, 138626406, 138626458, 138626498, 138626526, 138626554, 138626261, 138633971, 138594524, 138594553, 138569073, 138565090, 138449070, 138635064, 138681637, 138681665, 138681693, 138681721, 138283586, 138427512, 138425650, 138335949, 138005899, 138401749, 137986072, 138364174, 138352955, 138335841, 138190574, 138187979, 138211835, 138778642, 138778682, 138778683);


--update comum.pessoa set nome  = 'JANIKLEYSON FERNANDES DA SILVA BATISTA' where id_pessoa  = 751684;

--update matricula.renovacao_excepcional_matricula_processamento set id_discente = 978392 where id_discente = 982836;

--update basico.estudante_documento_pendente set id_estudante = 1359546 where id_estudante_documento_pendente in (52440254, 52440255);

update diario.competencia_habilidades_aluno set id_discente = 978392 where id in (41140, 41141, 41142);

update diario.historico_implantado set id_estudante = 978392 where id_historico_implantado in (26862, 26863, 26864, 27599);

--update ensino.observacao_discente set id_discente = 1399592 where id_observacao_discente = 615159912;

-- Deletar basico.estudante o ERRADO
DELETE FROM basico.estudante WHERE id_estudante=1373427;
--1387237

-- Deletar public.discente
DELETE FROM public.discente WHERE id_discente=1373427;

-- Deletar comum.pessoa
DELETE FROM comum.pessoa WHERE id_pessoa=52792235; 




  
 