select * from comum.parametro WHERE codigo='2_10_16';


Plano Trabalho Professor
PLANO_TRABALHO_PROFESSOR


INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao) VALUES('PLANO_TRABALHO_PROFESSOR', 'Parâmetro que controla a exibição do caso de uso Portal da gestão escolar >> diário de classe >> gerenciar plano de trabalho >> professor / escola;
Portal do professor >> diário >> gerenciar plano de trabalho, quando desabilitado, oculta o acesso a essa funcionalidade.', 'true', NULL, 2, '2_10_16', 0, 16, NULL, NULL, NULL, false);



[
    {
        "script":[
            "INSERT INTO comum.parametro (nome, descricao, valor, id_subsistema, id_sistema, codigo, tempo_maximo, tipo, padrao, valor_minimo, valor_maximo, bloquear_alteracao) VALUES('PLANO_TRABALHO_PROFESSOR', 'Parâmetro que controla a exibição do caso de uso Portal da gestão escolar >> diário de classe >> gerenciar plano de trabalho >> professor / escola; Portal do professor >> diário >> gerenciar plano de trabalho, quando desabilitado, oculta o acesso a essa funcionalidade.', 'false', NULL, 2, '2_10_16', 0, 16, NULL, NULL, NULL, false);"
        ],
        "database":"comumdb"
    }
]



select 
        u.login 
    from comum.usuario u 
    join comum.pessoa p on p.id_pessoa = u.id_pessoa 
    join rh.servidor s on s.id_pessoa = p.id_pessoa 
    join ensino.docente_turma dt on dt.id_docente = s.id_servidor 
    join ensino.turma t on t.id_turma = dt.id_turma 
    where dt.ativo