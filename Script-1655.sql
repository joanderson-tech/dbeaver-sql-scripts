WITH usuarios_responsaveis AS ( SELECT DISTINCT uf.id_usuario, e.id_unidade_escola
FROM basico.usuario_familiar uf
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = uf.id_discente_medio
JOIN escola.escola_etapa_ensino_serie es ON
mes.id_serie_escola = es.id_escola_etapa_ensino_serie
JOIN escola.escola e ON
e.id_escola = es.id_escola
WHERE uf.ativo ), usuarios_alunos AS ( SELECT DISTINCT u.id_usuario, ea.id_unidade_escola, d.matricula
FROM discente d
JOIN comum.usuario u ON
u.id_pessoa = d.id_pessoa
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN escola.escola_etapa_ensino_serie es ON
mes.id_serie_escola = es.id_escola_etapa_ensino_serie
JOIN escola.escola ea ON
ea.id_escola = es.id_escola
WHERE d.status = 1 ), usuarios_docentes AS( SELECT u.id_usuario, COALESCE(e.id_unidade_escola, s.id_unidade) AS id_unidade, cargo.denominacao, s.id_categoria, s.siape 
FROM rh.servidor s 
JOIN comum.usuario u ON u.id_pessoa = s.id_pessoa 
JOIN rh.cargo cargo USING (id_cargo) 
LEFT JOIN ensino.docente_turma dt ON dt.id_docente = s.id_servidor AND dt.ativo AND NOT dt.finalizada AND now() BETWEEN dt.data_inicio AND dt.data_fim 
LEFT JOIN ensino.turma t ON t.id_turma = dt.id_turma AND t.id_situacao_turma <> 4 
LEFT JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie 
LEFT JOIN escola.escola e ON e.id_escola = ts.id_escola
 ) 
SELECT DISTINCT u.id_usuario AS idUsuario, u.login, u.email, u.inativo, p.nome AS nomeUsuario, us.siape, ua.matricula, und.id_unidade AS idUnidade, und.nome AS nomeUnidade, COALESCE(e.nome, und.nome) AS nomeEscola, us.denominacao AS cargo, COALESCE(p.nome_responsavel_matricula, 'Não informado') AS nomeResponsavel, pessoa_responsavel.nome AS responsavel_por
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
LEFT JOIN usuarios_alunos ua ON
ua.id_usuario = u.id_usuario
LEFT JOIN usuarios_responsaveis ur ON
ur.id_usuario = u.id_usuario
LEFT JOIN usuarios_docentes us ON
us.id_usuario = u.id_usuario
LEFT JOIN comum.unidade und ON
und.id_unidade IN (ua.id_unidade_escola, ur.id_unidade_escola, us.id_unidade)
LEFT JOIN escola.escola e ON
e.id_unidade_escola = und.id_unidade
LEFT JOIN basico.usuario_familiar uf ON
u.id_usuario = uf.id_usuario
LEFT JOIN discente discente_responsavel ON
discente_responsavel.id_discente = uf.id_discente_medio
LEFT JOIN comum.pessoa pessoa_responsavel ON
discente_responsavel.id_pessoa = pessoa_responsavel.id_pessoa
WHERE 1 = 1;
AND und.id_unidade = 5873
ORDER BY nomeEscola ASC, p.nome ASC, us.denominacao ASC;


SELECT * FROM comum.unidade u ;


SELECT *
FROM comum.unidade
WHERE id_unidade = 5873;


SELECT *
FROM comum.unidade
WHERE id_unidade = 5873;

SELECT * FROM  rh.cargo; WHERE e.id_escola = 51877865;



SELECT *
FROM rh.servidor s 
JOIN ensino.docente_turma dt ON dt.id_docente = s.id_servidor 
AND dt.ativo 
AND NOT dt.finalizada
JOIN comum.usuario u ON u.id_pessoa = s.id_pessoa 
JOIN ensino.turma t ON t.id_turma = dt.id_turma AND t.id_situacao_turma <> 4 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
JOIN escola.escola e ON e.id_escola = ts.id_escola
JOIN rh.cargo cargo ON cargo.id_cargo = s.id_cargo ;

) 
SELECT DISTINCT u.id_usuario AS idUsuario, u.login, u.email, u.inativo, p.nome AS nomeUsuario, us.siape, ua.matricula, und.id_unidade AS idUnidade, und.nome AS nomeUnidade, COALESCE(e.nome, und.nome) AS nomeEscola, us.denominacao AS cargo, COALESCE(p.nome_responsavel_matricula, 'Não informado') AS nomeResponsavel, pessoa_responsavel.nome AS responsavel_por
FROM comum.usuario u
JOIN comum.pessoa p ON
p.id_pessoa = u.id_pessoa
LEFT JOIN usuarios_alunos ua ON
ua.id_usuario = u.id_usuario
LEFT JOIN usuarios_responsaveis ur ON
ur.id_usuario = u.id_usuario
LEFT JOIN usuarios_docentes us ON
us.id_usuario = u.id_usuario
LEFT JOIN comum.unidade und ON und.id_unidade IN (ua.id_unidade_escola, ur.id_unidade_escola, us.id_unidade)
LEFT JOIN escola.escola e ON
e.id_unidade_escola = und.id_unidade
LEFT JOIN basico.usuario_familiar uf ON
u.id_usuario = uf.id_usuario
LEFT JOIN discente discente_responsavel ON
discente_responsavel.id_discente = uf.id_discente_medio
LEFT JOIN comum.pessoa pessoa_responsavel ON
discente_responsavel.id_pessoa = pessoa_responsavel.id_pessoa
WHERE 1 = 1;
AND und.id_unidade = 5873
ORDER BY nomeEscola ASC, p.nome ASC, us.denominacao ASC;


SELECT *
FROM comum.unidade
WHERE id_unidade = 605;

SELECT * FROM  ensino.docente_turma dt; WHERE e.id_escola = 51877865;


SELECT u.id_usuario, COALESCE(e.id_unidade_escola, s.id_unidade) AS id_unidade, cargo.denominacao, s.id_categoria, s.siape 
FROM rh.servidor s 
JOIN ensino.docente_turma dt ON dt.id_docente = s.id_servidor 
JOIN ensino.turma t ON t.id_turma = dt.id_turma AND t.id_situacao_turma <> 4 
JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie
JOIN escola.escola e ON e.id_escola = ts.id_escola
LEFT JOIN rh.cargo cargo ON cargo.id_cargo = s.id_cargo
JOIN comum.usuario u ON u.id_pessoa = s.id_pessoa ;
) 
SELECT * FROM usuarios_docentes;
where id_unidade = 5873;



105158, 104915, 105181, 105139, 104988, 105306, 105088, 104948, 105118, 104947, 105211, 104894, 105065, 105321, 105130, 104902, 105186, 105072, 104921, 105086, 104944, 105023, 105070, 105294, 105185, 105157, 105024, 105073, 104908, 105187, 105227, 105085, 105143, 105138, 105172, 105288, 105265, 105262, 104920, 104900, 104912, 104925, 105313, 105275, 105148, 105116, 105166, 105099, 105274, 105093, 105105, 105150, 105170, 105202, 105114, 105159, 104934, 105110, 105190, 105077, 105152, 105125, 105269, 105239, 104926, 104930, 104954, 105079, 105224, 105082, 105195, 105071, 104883, 104916, 104897, 105097, 104889, 105131, 105133, 105320, 105315, 105104, 105184, 105109, 104922, 104990, 105223, 105025, 105090, 105084, 105074, 105205, 105066, 105309, 105248, 105151, 104885, 105232, 105252, 105200, 104919, 104910, 105230, 104936, 105162, 104911, 105290, 105197, 105198, 105209, 104929, 105027, 105161, 105123, 105180, 104887, 105067, 105235, 105276, 105303, 105210, 105064, 105168, 105237, 105243, 105134, 104905, 105142, 105212, 105222, 105279, 105234, 105285, 105193, 104909, 105287, 105028, 105312, 105083, 105299, 105277, 105310, 105164, 105258, 105141, 104945, 1, 105293, 105217, 104928, 104923, 105098, 105259, 105173, 105119, 105231, 105273, 105296, 105163, 104895, 104938, 105284, 105280, 105251, 105112, 105165, 105308, 105076, 105092, 105221, 105167, 104891, 104949, 105253, 105246, 105080, 105304, 105245, 105026, 105266, 105229, 105135, 105127, 104924, 105247, 105267, 105194, 104950, 105174, 105238, 104904, 104917, 105264, 105319, 105263, 105292, 105281, 105206, 105120, 105176, 105178, 105154, 105146, 105095, 105096, 105249, 104932, 104953, 105250, 105075, 105147, 104939, 105244, 105100, 105175, 105156, 104952, 105316, 105215, 105317, 105124, 105301, 105177, 105137, 105289, 105228, 105145, 105155, 104899, 105160, 104893, 105314, 104914, 104898, 105283, 105179, 105117, 105081, 105300, 105103, 105214, 105068, 104907, 105111, 105220, 104943, 105108, 105219, 105029, 105282, 104901, 105169, 105302, 105078, 105260, 105091, 104946, 104896, 105271, 104940, 105307, 105196, 105113, 105063, 105213, 104906, 105255, 105191, 105225, 105089, 105183, 105216, 105226, 105208, 105106, 105318, 105242, 105129, 105199, 105236, 104941, 105171, 104888, 105270, 105291, 105203, 105286, 104927, 105272, 105298, 105311, 105121, 104935, 105240, 105278, 104918, 104884, 105069, 105204, 105087, 104886, 105094, 105201, 105107, 105153, 105102, 105305, 105254, 105241, 105140, 105149, 105192, 105136, 105297, 105128, 104931, 104989, 105122, 105126, 104942, 104892, 104951, 105144, 104882, 104987, 105261, 105182, 104890, 105207, 105268, 105115, 105256, 105295, 105233, 105188, 105101, 104933, 105189, 105218, 104913, 104937, 105257, 105062, 104903, 105132
