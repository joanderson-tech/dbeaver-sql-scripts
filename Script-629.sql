select * from  comum.pessoa p where p.nome ILIKE '%FRANCISCA AMARO SOARES AURELIANO%';

select * from  comum.pessoa p where p.id_pessoa in (51874724, 746487 );;

select * from rh.servidor s where s.id_pessoa in (51874724, 746487 );
    
select * from comum.usuario u where u.id_pessoa  in (51874724, 746487 );
    
    
    -- Auto-generated SQL script #202506060902
UPDATE comum.usuario SET id_pessoa=51874724 WHERE id_usuario=105015;
