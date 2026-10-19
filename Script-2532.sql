SELECT * FROM comum.parametro p WHERE p.descricao ILIKE '%educ21%'


-- Auto-generated SQL script #202607091047
UPDATE comum.parametro
    SET valor='true'
    WHERE codigo='acesso_portal_professor_educ21';
