--solucao
begin;

DELETE FROM ensino.turma WHERE id_turma=703953;
DELETE FROM ensino.turma WHERE id_turma=703952;
DELETE FROM ensino.turma WHERE id_turma=703958;
DELETE FROM ensino.turma WHERE id_turma=703954;
DELETE FROM ensino.turma WHERE id_turma=703955;
DELETE FROM ensino.turma WHERE id_turma=703959;
DELETE FROM ensino.turma WHERE id_turma=703956;
DELETE FROM ensino.turma WHERE id_turma=703957;
DELETE FROM ensino.turma WHERE id_turma=703951;

commit;
--rollback;