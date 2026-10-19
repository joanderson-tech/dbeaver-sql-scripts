SELECT * FROM comum.pessoa p WHERE p.nome_ascii ILIKE 'FRANCISCA ROMAO DO NASCIMENTO';

SELECT * FROM rh.servidor s WHERE s.id_pessoa IN (781277, 783855);

SELECT * FROM discente d WHERE d.id_pessoa   IN (781277, 783855);

SELECT * FROM comum.usuario u WHERE u.id_pessoa IN (781277, 783855);