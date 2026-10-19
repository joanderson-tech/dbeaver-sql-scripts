SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname 
IN ('portalsigeduc_desenv_pb_campinagrande')AND pid <> pg_backend_pid();



/* 

turma do 4º Ano Manhã: Andreia Maria Araujo Pedrosa (EFAIM4A)
21, 29 de julho e 11 a 13 de agosto esta sem registros 

5º Ano
Manhã: Fernanda Ferreira de Castro (EFAIM5A) dia 13 de agosto não tem registro

Alguns dias das turmas abaixo não estão preenchidas.
1º Ano- EFAIV1A
 Fábia Jucely Lopes Laurentino (1º ano) -- Não tem registro de frequencia nos dias que estão faltando 16 e 23 de abril e 24 e 25 de julo 
 
 3º Ano - EFAIM3A
Patrícia Marques Hóstio Monteiro (3º ano). dia 23 de abril não tem registro

4º Ano - EFAIM4A
 Eufrázia Maria de Araújo (4º ano) dia 10 de março, dia 1,2 e 3 de abril  não tem registro

 * */*/