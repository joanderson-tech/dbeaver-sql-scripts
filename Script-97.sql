select 
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo;
    
   
   insert into comum.usuario (id_usuario, id_servidor, id_pessoa, login, tipo, autorizado, data_cadastro,  id_unidade, email, inativo,ramal) values (?,?,?,?,?,?,?,?,?,?,?)]; ERROR: insert or update on table "usuario" violates foreign key constraint "usuario_id_unidade_fkey"
  Detalhe: Key (id_unidade)=(0) is not present in table "unidade"