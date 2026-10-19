do $$
declare
    v_ano integer := 2025;
    v_cpf bigint := 13944022440;
    v_id_estudante_esperado integer := 1016709;
    v_id_pessoa_esperada integer := 746746;
    v_id_escola_esperada integer := 52232908;
    v_id_turma_serie_esperada integer := 72411620;
    v_id_serie_4_ano integer := 1005221;
    v_id_mes_alvo_esperado integer := 1585999;
    v_id_vaga_serie_esperada integer := 71727778;

    v_sit_mes_reprovado integer := 3;
    v_sit_mes_cancelado integer := 5;
    v_sit_mc_reprovado integer := 6;
    v_sit_mc_cancelado integer := 3;

    v_id_estudante integer;
    v_id_pessoa integer;
    v_id_escola integer;
    v_id_turma_serie integer;
    v_id_turno integer;
    v_periodo integer;
    v_id_serie_escola integer;
    v_id_vaga_serie integer;
    v_id_mes_alvo integer;
    v_qtd integer;
begin
    select count(*)
      into v_qtd
      from public.discente d
      join comum.pessoa p on p.id_pessoa = d.id_pessoa
      join basico.estudante e on e.id_estudante = d.id_discente
     where p.cpf_cnpj = v_cpf;

    if v_qtd <> 1 then
        raise exception 'Esperado 1 estudante com CPF %, encontrados %.', v_cpf, v_qtd;
    end if;

    select e.id_estudante, p.id_pessoa
      into v_id_estudante, v_id_pessoa
      from public.discente d
      join comum.pessoa p on p.id_pessoa = d.id_pessoa
      join basico.estudante e on e.id_estudante = d.id_discente
     where p.cpf_cnpj = v_cpf;

    if v_id_estudante <> v_id_estudante_esperado then
        raise exception 'CPF % retornou id_estudante %, mas o esperado para o chamado e %.',
            v_cpf, v_id_estudante, v_id_estudante_esperado;
    end if;

    if v_id_pessoa <> v_id_pessoa_esperada then
        raise exception 'CPF % retornou id_pessoa %, mas o esperado para o chamado e %.',
            v_cpf, v_id_pessoa, v_id_pessoa_esperada;
    end if;

    select count(*)
      into v_qtd
      from escola.escola esc
     where esc.id_escola = v_id_escola_esperada;

    if v_qtd <> 1 then
        raise exception 'Escola esperada % nao encontrada.', v_id_escola_esperada;
    end if;

    v_id_escola := v_id_escola_esperada;

    select count(*)
      into v_qtd
      from basico.turma_serie ts
     where ts.id_turma_serie = v_id_turma_serie_esperada
       and ts.ano = v_ano
       and ts.id_escola = v_id_escola
       and ts.id_serie = v_id_serie_4_ano
       and ts.ativo is true;

    if v_qtd <> 1 then
        raise exception 'Turma serie esperada % nao encontrada ativa para escola %, serie % e ano %.',
            v_id_turma_serie_esperada, v_id_escola, v_id_serie_4_ano, v_ano;
    end if;

    select ts.id_turma_serie, ts.id_turno, ts.periodo
      into v_id_turma_serie, v_id_turno, v_periodo
      from basico.turma_serie ts
     where ts.id_turma_serie = v_id_turma_serie_esperada
       and ts.ano = v_ano
       and ts.id_escola = v_id_escola
       and ts.id_serie = v_id_serie_4_ano
       and ts.ativo is true;

    select count(*)
      into v_qtd
      from escola.escola_etapa_ensino_serie eees
     where eees.id_escola = v_id_escola
       and eees.id_serie = v_id_serie_4_ano
       and eees.ativo is true;

    if v_qtd <> 1 then
        raise exception 'Esperado 1 vinculo ativo escola/4o ano para escola %, encontrados %.', v_id_escola, v_qtd;
    end if;

    select eees.id_escola_etapa_ensino_serie
      into v_id_serie_escola
      from escola.escola_etapa_ensino_serie eees
     where eees.id_escola = v_id_escola
       and eees.id_serie = v_id_serie_4_ano
       and eees.ativo is true;

    select count(*)
      into v_qtd
      from matricula.vaga_serie vs
     where vs.ano_letivo = v_ano
       and vs.id_escola = v_id_escola
       and vs.id_serie = v_id_serie_4_ano
       and vs.id_turno = v_id_turno
       and vs.periodo = v_periodo
       and vs.id_vaga_serie = v_id_vaga_serie_esperada
       and coalesce(vs.removida, false) is false;

    if v_qtd <> 1 then
        raise exception 'Vaga_serie esperada % nao encontrada para escola %, serie %, turno %, periodo %, ano %.',
            v_id_vaga_serie_esperada, v_id_escola, v_id_serie_4_ano, v_id_turno, v_periodo, v_ano;
    end if;

    select vs.id_vaga_serie
      into v_id_vaga_serie
      from matricula.vaga_serie vs
     where vs.ano_letivo = v_ano
       and vs.id_escola = v_id_escola
       and vs.id_serie = v_id_serie_4_ano
       and vs.id_turno = v_id_turno
       and vs.periodo = v_periodo
       and vs.id_vaga_serie = v_id_vaga_serie_esperada
       and coalesce(vs.removida, false) is false;

    if not exists (
        select 1
          from matricula.vaga_serie vs
         where vs.id_vaga_serie = v_id_vaga_serie
           and coalesce(vs.vagas_validadas, 0) > coalesce(vs.vagas_ocupadas, 0)
    ) then
        raise exception 'Vaga_serie % sem vaga livre: vagas_validadas <= vagas_ocupadas.', v_id_vaga_serie;
    end if;

    select count(*)
      into v_qtd
      from basico.matricula_estudante_serie mes
     where mes.id_estudante = v_id_estudante
       and mes.ano_calendario = v_ano;

    if v_qtd = 0 then
        raise exception 'Nao existe MES de % para o estudante %.', v_ano, v_id_estudante;
    end if;

    select count(*)
      into v_qtd
      from basico.matricula_estudante_serie mes
     where mes.id_estudante = v_id_estudante
       and mes.ano_calendario = v_ano
       and mes.id_turma_serie = v_id_turma_serie
       and mes.id_matricula_discente_serie = v_id_mes_alvo_esperado;

    if v_qtd <> 1 then
        raise exception 'MES alvo esperada % nao encontrada para estudante %, ano % e turma alvo %.',
            v_id_mes_alvo_esperado, v_id_estudante, v_ano, v_id_turma_serie;
    end if;

    v_id_mes_alvo := v_id_mes_alvo_esperado;

    select count(*)
      into v_qtd
      from ensino.matricula_componente mc
      join ensino.turma t on t.id_turma = mc.id_turma
     where mc.id_discente = v_id_estudante
       and mc.ano = v_ano
       and t.id_turma_serie = v_id_turma_serie;

    if v_qtd = 0 then
        raise exception 'Nao foram encontradas matriculas de componente do estudante % na turma alvo %. O script nao cria componentes sem historico.',
            v_id_estudante, v_id_turma_serie;
    end if;

    update basico.matricula_estudante_serie mes
       set id_situacao_matricula_serie = v_sit_mes_reprovado,
           id_serie_escola = v_id_serie_escola,
           id_turma_serie = v_id_turma_serie,
           id_turno = v_id_turno,
           periodo = v_periodo,
           id_vaga_serie = v_id_vaga_serie,
           id_serie_multisseriado = null,
           id_turma_serie_multisseriado = null,
           data_atualizacao = now()
     where mes.id_matricula_discente_serie = v_id_mes_alvo;

    get diagnostics v_qtd = row_count;
    if v_qtd <> 1 then
        raise exception 'Atualizacao da MES alvo afetou % registros; esperado 1.', v_qtd;
    end if;

    update ensino.matricula_componente mc
       set id_situacao_matricula = v_sit_mc_reprovado,
           id_matricula_estudante_serie = v_id_mes_alvo,
           data_atualizacao = now()
      from ensino.turma t
     where t.id_turma = mc.id_turma
       and t.id_turma_serie = v_id_turma_serie
       and mc.id_discente = v_id_estudante
       and mc.ano = v_ano;

    get diagnostics v_qtd = row_count;
    raise notice 'Matriculas de componente reprovadas na turma alvo: %.', v_qtd;

    update basico.matricula_estudante_serie mes
       set id_situacao_matricula_serie = v_sit_mes_cancelado,
           data_atualizacao = now()
     where mes.id_estudante = v_id_estudante
       and mes.ano_calendario = v_ano
       and mes.id_matricula_discente_serie <> v_id_mes_alvo
       and mes.id_situacao_matricula_serie <> v_sit_mes_cancelado;

    get diagnostics v_qtd = row_count;
    raise notice 'MES duplicadas/corretivas canceladas em %: %.', v_ano, v_qtd;

    update ensino.matricula_componente mc
       set id_situacao_matricula = v_sit_mc_cancelado,
           data_atualizacao = now()
     where mc.id_discente = v_id_estudante
       and mc.ano = v_ano
       and mc.id_situacao_matricula <> v_sit_mc_cancelado
       and (
            mc.id_matricula_estudante_serie is distinct from v_id_mes_alvo
            or not exists (
                select 1
                  from ensino.turma t
                 where t.id_turma = mc.id_turma
                   and t.id_turma_serie = v_id_turma_serie
            )
       );

    get diagnostics v_qtd = row_count;
    raise notice 'Matriculas de componente fora da turma alvo canceladas em %: %.', v_ano, v_qtd;

    raise notice 'MES alvo mantida para o estudante: %. Turma serie: %. Vaga serie: %.',
        v_id_mes_alvo, v_id_turma_serie, v_id_vaga_serie;
end $$;