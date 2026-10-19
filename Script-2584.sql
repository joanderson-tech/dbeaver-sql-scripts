SELECT dt.* FROM ensino.docente_turma dt 
JOIN rh.servidor s ON s.id_servidor = dt.id_docente 
WHERE dt.id_turma = 685025;
AND dt.finalizada = FALSE;



    public int cargaHorariaTotalAclocadaTurma(int idTurma){
        
        String sql = " SELECT * FROM ensino.docente_turma dt WHERE dt.id_turma = "+ idTurma +
                
        
    
            return getJdbcTemplate().queryForObject(sql, Integer.class);

    }