select * from ensino.horario_turma ht WHERE ht.id_turma in (687235, 687236, 687237);


select * from ensino.horario_turma h where h.id_horario_turma in (52328472);

select * -- string_agg(id_horario_turma :: varchar, ',')  
from ensino.horario_turma ht  where ht.id_turma in (687183); 

--Solucao EFAIM1A ARTE
UPDATE ensino.horario_turma SET data_inicio='2025-07-02' WHERE id_horario_turma in (1415514, 1415519);
UPDATE ensino.horario_turma	SET data_inicio='2025-07-01',data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma in (1415494,1415489);
UPDATE ensino.horario_turma	SET data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma in (1414052,1414057); 

--BACKUP EFAIM3A ARTE
UPDATE ensino.horario_turma SET data_inicio='2025-07-31' WHERE id_horario_turma in (1415514, 1415519);
UPDATE ensino.horario_turma	SET data_inicio='2025-07-28',data_alteracao='2025-07-31 16:39:23.000',data_fim='2025-07-31'	WHERE id_horario_turma in (1415494,1415489);
UPDATE ensino.horario_turma	SET data_alteracao='2025-07-28 15:34:12.000',data_fim='2025-07-28'	WHERE id_horario_turma in (1414052,1414057); 
----------------------------------------
--Solucao EFAIM1A Ensino Religioso
UPDATE ensino.horario_turma SET data_inicio='2025-07-02' WHERE id_horario_turma in (1415534);
UPDATE ensino.horario_turma	SET data_inicio='2025-07-01',data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma in (1415509);
UPDATE ensino.horario_turma	SET data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma in (1414072); 

--BACKUP EFAIM1A ARTE
UPDATE ensino.horario_turma SET data_inicio='2025-07-31' WHERE id_horario_turma in (1415534);
UPDATE ensino.horario_turma	SET data_inicio='2025-07-28',data_alteracao='2025-07-31 16:39:23.000',data_fim='2025-07-31'	WHERE id_horario_turma in (1415509);
UPDATE ensino.horario_turma	SET data_alteracao='2025-07-28 15:34:12.000',data_fim='2025-07-28'	WHERE id_horario_turma in (1414072); 
----------------------------------------
--Solucao EFAIM1A Educação Física
UPDATE ensino.horario_turma SET data_inicio='2025-07-02',data_fim='2025-12-15' WHERE id_horario_turma in (1415524,1415529);
UPDATE ensino.horario_turma	SET data_inicio='2025-07-01',data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma in (1415499,1415504);
UPDATE ensino.horario_turma	SET data_inicio='2025-03-10',data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma in (1414062,1414067);

--BACKUP EFAIM1A Educação Física
UPDATE ensino.horario_turma SET data_inicio=NULL,data_fim=NULL WHERE id_horario_turma in (1415524,1415529);
UPDATE ensino.horario_turma	SET data_inicio='2025-07-28',data_alteracao='2025-07-31 16:39:23.000',data_fim='2025-07-31'	WHERE id_horario_turma in (1415499,1415504);
UPDATE ensino.horario_turma	SET data_inicio=null,data_alteracao=null,data_fim=null	WHERE id_horario_turma in (1414062,1414067);



----------------------------------------
--Solucao EFAIM3A ARTE
UPDATE ensino.horario_turma SET data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01' WHERE id_horario_turma in (1414174,1415437,1414179,1415442);
UPDATE ensino.horario_turma SET data_inicio='2025-07-02' WHERE id_horario_turma in (1415462, 1415467);

--BACKUP EFAIM3A ARTE
UPDATE ensino.horario_turma SET data_alteracao='2025-07-28 14:22:12.000',data_fim='2025-07-28' WHERE id_horario_turma in (1414174,1415437,1414179,1415442);
UPDATE ensino.horario_turma SET data_inicio='2025-07-28' WHERE id_horario_turma in (1415462, 1415467);
----------------------------------------
--Solucao EFAIM3A Ensino Religioso
UPDATE ensino.horario_turma SET data_inicio='2025-07-02', data_fim = '2025-12-15'  WHERE id_horario_turma in (1415482);
UPDATE ensino.horario_turma SET data_inicio='2025-07-01',data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01' WHERE id_horario_turma in (1415457);
UPDATE ensino.horario_turma	SET data_inicio='2025-03-10',data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma=52328472;

--BACKUP EFAIM3A Ensino Religioso
UPDATE ensino.horario_turma SET data_inicio=null, data_fim = null WHERE id_horario_turma in (1415482);
UPDATE ensino.horario_turma SET data_inicio='2025-07-28',data_alteracao='2025-07-28 15:31:20.000',data_fim='2025-07-28' WHERE id_horario_turma=1415457;
UPDATE ensino.horario_turma	SET data_inicio=null,data_alteracao='2025-07-28 14:22:12.000',data_fim=null	WHERE id_horario_turma=52328472;
----------------------------------------
--Solucao EFAIM3A Educação Física
UPDATE ensino.horario_turma SET data_inicio='2025-07-01',data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01' WHERE id_horario_turma in (1415447, 1415452);
UPDATE ensino.horario_turma SET data_inicio='2025-07-02', data_fim = '2025-12-15'  WHERE id_horario_turma in (1415472, 1415477);
UPDATE ensino.horario_turma	SET data_inicio='2025-03-10',data_alteracao='2025-07-01 00:00:00.000',data_fim='2025-07-01'	WHERE id_horario_turma in (52328470,52328471);

--BACKUP EFAIM3A Educação Física
UPDATE ensino.horario_turma SET data_inicio='2025-07-28',data_alteracao='2025-07-28 15:31:20.000',data_fim='2025-07-28' WHERE id_horario_turma in (1415447, 1415452);
UPDATE ensino.horario_turma SET data_inicio=null, data_fim = null WHERE id_horario_turma in (1415472, 1415477);
UPDATE ensino.horario_turma	SET data_inicio=null,data_alteracao='2025-07-28 14:22:12.000',data_fim=null	WHERE id_horario_turma in (52328470,52328471);
----------------------------------------
