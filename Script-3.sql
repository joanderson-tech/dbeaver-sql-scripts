select * 
from rh.servidor s 
where s.id_pessoa  = 762052;


-- solução - Banco comum
UPDATE rh.servidor
	SET siape='0934747',id_servidor=290
	WHERE id_servidor=441;

-- backup - Banco comum
UPDATE rh.servidor
	SET siape='934747',id_servidor=441
	WHERE id_servidor=290;


begin;
commit;