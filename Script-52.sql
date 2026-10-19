SELECT 
    es.denominacao AS etapaEJA, 
    m.nome AS municipio, 
    u.nome AS dired, 
    u.id_unidade AS id_dired, 
    e.nome,
    COUNT(DISTINCT id_estudante) AS total_estudantes 
FROM 
    basico.matricula_estudante_serie mes 
JOIN 
    escola.escola_etapa_ensino_serie eees ON mes.id_serie_escola = eees.id_escola_etapa_ensino_serie 
JOIN 
    basico.serie s ON eees.id_serie = s.id_serie 
JOIN 
    basico.etapa_ensino es ON es.id_etapa_ensino = s.id_etapa_ensino 
JOIN 
    escola.escola e ON eees.id_escola = e.id_escola 
JOIN 
    comum.municipio m ON e.id_municipio = m.id_municipio 
JOIN 
    comum.unidade u ON e.id_regional_ensino = u.id_unidade 
WHERE 
    ano_calendario = 2023
    AND mes.id_situacao_matricula_serie NOT IN (4, 6, 5, 9) 
     AND es.id_modalidade = 2 
GROUP BY 
    e.nome, m.nome, u.nome, u.id_unidade, es.denominacao 
ORDER BY 
    u.id_unidade, m.nome,total_estudantes DESC;

   public List<Map<String,Object>> findTotalEstudantesEJA(int ano, String escola) {

    String sql  =
        "select es.denominacao as etapaEJA, m.nome as municipio, e.nome, u.nome as dired, u.id_unidade as id_dired, count(distinct id_estudante) as total_estudantes from basico.matricula_estudante_serie mes " + 
        "join escola.escola_etapa_ensino_serie eees on mes.id_serie_escola = eees.id_escola_etapa_ensino_serie " +
        "join basico.serie s on eees.id_serie =  s.id_serie  " +
        "join basico.etapa_ensino es on es.id_etapa_ensino = s.id_etapa_ensino " +
        "join escola.escola e on eees.id_escola = e.id_escola " +
        "join comum.municipio m on e.id_municipio = m.id_municipio " +
        "join comum.unidade u on e.id_regional_ensino = u.id_unidade " +
        "where ano_calendario =  " + ano + 
        " and mes.id_situacao_matricula_serie not in ( 4,6,5,9 )" + 
        " and es.id_modalidade = " + ModalidadeEnsinoBasico.EJA + " ";

    // Verifica se o campo 'escola' está preenchido e adiciona a condição ao SQL
    if (escola != null && !escola.isEmpty()) {
        sql += " and e.nome = '" + escola + "' ";
    }
    
    sql += "group by m.nome, e.nome, u.nome, u.id_unidade, es.denominacao " +
        "order by u.id_unidade, m.nome, total_estudantes desc ";

    return getJdbcTemplate().queryForList(sql);
}

public List<Map<String, Object>> findTotalEstudantesEJA(int ano, String escola) {

    StringBuilder sqlBuilder = new StringBuilder();
    sqlBuilder.append("select es.denominacao as etapaEJA, m.nome as municipio, e.nome, u.nome as dired, u.id_unidade as id_dired, count(distinct id_estudante) as total_estudantes from basico.matricula_estudante_serie mes ");
    sqlBuilder.append("join escola.escola_etapa_ensino_serie eees on mes.id_serie_escola = eees.id_escola_etapa_ensino_serie ");
    sqlBuilder.append("join basico.serie s on eees.id_serie = s.id_serie ");
    sqlBuilder.append("join basico.etapa_ensino es on es.id_etapa_ensino = s.id_etapa_ensino ");
    sqlBuilder.append("join escola.escola e on eees.id_escola = e.id_escola ");
    sqlBuilder.append("join comum.municipio m on e.id_municipio = m.id_municipio ");
    sqlBuilder.append("join comum.unidade u on e.id_regional_ensino = u.id_unidade ");
    sqlBuilder.append("where ano_calendario = ").append(ano);
    sqlBuilder.append(" and mes.id_situacao_matricula_serie not in (4, 6, 5, 9) ");
    sqlBuilder.append(" and es.id_modalidade = ").append(ModalidadeEnsinoBasico.EJA);

    if (escola != null && !escola.isEmpty()) {
        sqlBuilder.append(" and e.nome = '").append(escola).append("'");
    }

    sqlBuilder.append(" group by m.nome, e.nome, u.nome, u.id_unidade, es.denominacao ");
    sqlBuilder.append("order by u.id_unidade, m.nome, total_estudantes desc");

    String sql = sqlBuilder.toString();

    return getJdbcTemplate().queryForList(sql);
}

public String emitirRelatorioEJA() {
    QuantitativoEstudantesDao dao = getDAO(QuantitativoEstudantesDao.class);
    try {
        if (nomeEscola != null && !nomeEscola.isEmpty()) {
            dadosRelatorioQuantitativoEstudantes = dao.findTotalEstudantesEJA(ano, nomeEscola);
        } else {
            dadosRelatorioQuantitativoEstudantes = dao.findTotalEstudantesEJA(ano, null);
        }

        if (ValidatorUtil.isEmpty(dadosRelatorioQuantitativoEstudantes)) {
            addMensagem(MensagensArquitetura.BUSCA_SEM_RESULTADOS);
            return null;
        }
    } finally {
        dao.close();
    }
    // Restante do seu código
}



select * from escola.escola e 
where e.nome = 'CENTRO MUNICIPAL DE EDUCACAO INFANTIL CAIC'

