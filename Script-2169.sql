select p.nome,
        u.login, dt.*  
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo and p.nome ilike '%JENNYFER ALVES ROCHA%';

SELECT * FROM rh.servidor s WHERE s.id_pessoa = 749330;

SELECT * FROM ensino.docente_turma dt WHERE dt.id_docente IN (1117);

BEGIN;

ROLLBACK;




---SOLUÇÃO LIVIA SANTOS FERREIRA
UPDATE ensino.docente_turma SET id_docente=1064 WHERE id_docente_turma=52200167;
DELETE FROM rh.servidor WHERE id_servidor=1117;

---SOLUÇÃO ALENILDES OLIVEIRA DOS SANTOS
UPDATE ensino.docente_turma SET id_docente=392 WHERE id_docente_turma IN (52164167, 52059632, 52059634, 52059635, 52059637, 52059640, 52059642, 52094770, 52094789, 52094808, 52094836, 52094883, 52094889, 52095184, 52129658, 52164133, 52164153, 52164159, 52164161, 52164165) ;
DELETE FROM rh.servidor WHERE id_servidor=955;

---SOLUÇÃO JENNYFER ALVES ROCHA
UPDATE ensino.docente_turma SET id_docente=745 WHERE id_docente_turma=52129657;
DELETE FROM rh.servidor WHERE id_servidor=1109;



