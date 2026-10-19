WITH usuarios_responsaveis AS ( SELECT DISTINCT uf.id_usuario, e.id_unidade_escola
FROM basico.usuario_familiar uf
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = uf.id_discente_medio
JOIN escola.escola_etapa_ensino_serie es ON
mes.id_serie_escola = es.id_escola_etapa_ensino_serie
JOIN escola.escola e ON
e.id_escola = es.id_escola
WHERE uf.ativo ), usuarios_alunos AS ( 
SELECT DISTINCT u.id_usuario, ea.id_unidade_escola, d.matricula
FROM discente d
JOIN comum.usuario u ON
u.id_pessoa = d.id_pessoa
JOIN basico.matricula_estudante_serie mes ON
mes.id_estudante = d.id_discente
JOIN escola.escola_etapa_ensino_serie es ON
mes.id_serie_escola = es.id_escola_etapa_ensino_serie
JOIN escola.escola ea ON
ea.id_escola = es.id_escola
WHERE d.status = 1 ), usuarios_docentes AS( 
SELECT u.id_usuario, COALESCE(e.id_unidade_escola, s.id_unidade) AS id_unidade, cargo.denominacao, s.id_categoria, s.siape
FROM rh.servidor s
JOIN comum.usuario u ON
u.id_pessoa = s.id_pessoa
JOIN rh.cargo cargo
	USING (id_cargo)
LEFT JOIN ensino.docente_turma dt ON
dt.id_docente = s.id_servidor
AND dt.ativo
AND NOT dt.finalizada
AND now() BETWEEN dt.data_inicio AND dt.data_fim
LEFT JOIN ensino.turma t ON
t.id_turma = dt.id_turma
AND t.id_situacao_turma <> 4
LEFT JOIN basico.turma_serie ts ON
ts.id_turma_serie = t.id_turma_serie
LEFT JOIN escola.escola e ON
e.id_escola = ts.id_escola ) SELECT DISTINCT u.id_usuario AS idUsuario, u.login, u.email, u.inativo, p.nome AS nomeUsuario, us.siape, ua.matricula, und.id_unidade AS idUnidade, und.nome AS nomeUnidade, COALESCE(e.nome, und.nome) AS nomeEscola, us.denominacao AS cargo, COALESCE(p.nome_responsavel_matricula, 'Não informado') AS nomeResponsavel, pessoa_responsavel.nome AS responsavel_por
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
WHERE 1 = 1
AND ua IS NOT NULL
ORDER BY nomeEscola ASC, p.nome ASC, us.denominacao ASC ;

SELECT *
FROM discente d
WHERE d.matricula = '202530005417';

SELECT *
FROM comum.usuario u
WHERE u.login ILIKE '%abraha%'
--u.id_pessoa = 777906;



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
WHERE d.status = 1 ), usuarios_docentes AS( SELECT u.id_usuario, COALESCE(e.id_unidade_escola, s.id_unidade) AS id_unidade, cargo.denominacao, s.id_categoria, s.siape FROM rh.servidor s JOIN comum.usuario u ON u.id_pessoa = s.id_pessoa JOIN rh.cargo cargo USING (id_cargo) LEFT JOIN ensino.docente_turma dt ON dt.id_docente = s.id_servidor AND dt.ativo AND NOT dt.finalizada AND now() BETWEEN dt.data_inicio AND dt.data_fim LEFT JOIN ensino.turma t ON t.id_turma = dt.id_turma AND t.id_situacao_turma <> 4 LEFT JOIN basico.turma_serie ts ON ts.id_turma_serie = t.id_turma_serie LEFT JOIN escola.escola e ON e.id_escola = ts.id_escola ) SELECT DISTINCT u.id_usuario AS idUsuario, u.login, u.email, u.inativo, p.nome AS nomeUsuario, us.siape, ua.matricula, und.id_unidade AS idUnidade, und.nome AS nomeUnidade, COALESCE(e.nome, und.nome) AS nomeEscola, us.denominacao AS cargo, COALESCE(p.nome_responsavel_matricula, 'Não informado') AS nomeResponsavel, pessoa_responsavel.nome AS responsavel_por
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
WHERE 1 = 1
AND und.id_unidade = 1932
ORDER BY nomeEscola ASC, p.nome ASC, us.denominacao ASC;

SELECT pe.id, pe.id_papel, pe.id_usuario, p.descricao, p.nome, und.nome AS nome_unidade
FROM comum.permissao pe
JOIN comum.papel p ON
p.id = pe.id_papel
JOIN comum.usuario u ON
u.id_usuario = pe.id_usuario
LEFT JOIN comum.unidade und ON
und.id_unidade = pe.id_unidade_papel
WHERE pe.autorizada
AND pe.id_unidade_papel = 1932
--AND pe.id_usuario IN ( 110906, 106745, 108177, 106576, 107547, 109143, 107596, 108593, 110783, 110485, 106753, 109123, 106776, 106781, 107593, 109087, 108293, 108633, 108215, 108392, 110415, 107463, 107869, 108132, 110689, 108516, 108122, 110486, 109505, 108506, 108308, 108268, 107553, 109261, 107929, 108250, 106714, 106414, 107419, 109071, 108469, 108265, 107975, 108882, 109336, 108251, 107512, 106743, 106389, 111151, 108160, 110692, 106394, 106709, 109124, 108234, 108330, 111171, 106678, 106677, 109974, 110955, 110095, 111184, 111159, 106683, 106242, 108599, 108006, 109016, 107934, 107314, 110429, 108714, 108618, 107295, 108236, 110181, 110510, 108879, 108218, 109315, 109148, 107323, 106682, 110520, 106536, 110219, 108481, 109039, 107585, 109217, 108757, 108201, 108621, 110022, 110728, 106413, 108492, 107403, 106685, 111178, 108674, 109049, 106660, 111186, 108748, 108747, 108518, 108525, 107727, 107654, 108255, 106515, 108008, 106606, 110269, 109632, 108316, 110464, 108194, 106800, 106411, 110189, 107939, 108715, 106400, 110592, 108192, 108360, 106444, 109047, 107922, 108049, 109258, 107492, 110657, 109196, 108246, 108148, 108756, 109253, 106789, 106403, 108917, 109664, 108261, 109075, 108267, 109503, 108168, 108217, 110795, 108952, 107324, 108758, 108705, 107871, 108118, 110212, 109069, 110730, 108167, 107471, 106679, 107935, 108860, 107497, 109771, 109103, 107548, 106401, 107268, 108224, 108299, 106379, 109073, 109078, 107209, 108300, 106567, 107286, 106101, 108864, 106787, 106733, 110407, 106786, 108531, 107487, 106704, 106892, 110387, 108894, 108064, 110623, 108704, 107774, 108468, 108699, 108649, 107289, 110560, 108871, 110658, 106378, 108679, 107215, 107234, 110551, 110611, 106533, 110630, 106736, 107313, 108279, 107652, 108523, 107775, 108806, 108303, 108706, 108608, 108068, 108974, 108286, 108225, 109141, 106412, 108972, 108263, 108247, 106755, 107322, 108120, 106381, 107409, 108703, 108227, 106404, 109170, 106551, 107413, 108307, 108322, 108312, 108673, 108124, 108018, 107302, 110469, 108708, 108050, 107474, 108238, 110650, 107555, 108845, 106408, 109191, 107886, 110741, 106387, 106756, 109280, 108025, 110058, 107233, 109131, 107467, 108297, 108311, 107554, 109051, 108281, 107990, 107904, 108561, 108637, 108012, 106663, 109133, 106846, 107913, 108494, 107468, 108946, 107955, 109927, 106759, 108603, 108797, 108272, 109090, 107566, 108830, 110715, 106250, 109948, 109412, 107872, 108529, 107211, 108682, 108441, 108321, 108278, 110779, 109690, 107530, 108929, 107718, 106842, 107857, 108244, 107219, 106388, 107461, 108159, 107539, 111022, 106453, 107732, 106537, 109063, 108690, 108743, 108833, 107885, 108460, 108249, 108713, 108508, 108877, 108154, 109704, 107858, 108479, 109502, 109216, 106855, 111146, 106699, 107367, 109731, 107658, 106397, 108718, 109469, 109265, 106626, 106774, 107294, 108288, 108571, 107902, 106757, 107278, 107725, 107914, 107586, 108127, 107558, 109074, 109082, 110816, 108398, 110785, 108912, 109607, 108539, 108759, 108029, 107741, 107282, 110441, 106634, 108313, 107414, 106540, 107534, 108720, 110502, 109142, 110059, 106742, 108723, 107462, 108601, 110419, 108875, 109295, 108702, 110787, 110787, 108277, 107574, 106779, 110311, 106632, 106424, 108123, 108205, 109043, 106722, 108448, 108717, 107250, 107966, 106784, 107204, 106723, 110476, 106782, 108656, 107301, 107941, 107469, 107828, 110418, 107942, 109462, 107720, 108629, 109962, 108171, 107493, 109460, 108470, 108681, 108147, 107440, 107213, 107600, 108258, 106697, 106380, 107470, 106696, 108149, 108461, 110840, 108052, 106473, 107949, 107249, 107481, 109857, 108283, 110814, 107933, 108324, 107559, 108062, 109317, 108725, 108726, 106655, 107923, 107739, 109059, 108517, 106711, 107862, 108509, 107584, 109030, 111149, 106676, 108045, 107229, 107280, 106791, 110646, 110204, 109158, 106785, 108666, 110877, 106377, 108858, 108554, 108881, 108857, 107269, 109067, 107279, 108700, 108310, 107936, 111185, 108798, 107744, 109706, 111007, 110408, 108110, 108932, 107860, 106647, 107208, 107873, 111153, 110612, 109993, 109070, 109275, 106245, 110060, 110498, 108569, 109104, 110111, 108287, 106200, 106419, 109058, 109072, 107212, 107745, 108146, 108198, 107937, 109086, 106398, 106686, 108495, 106406, 109310, 106665, 107988, 106794, 106416, 107912, 106871, 107528, 108716, 110803, 109145, 108253, 107405, 106717, 108216, 106392, 110495, 107640, 106396, 108276, 110193, 109085, 108846, 108669, 109083, 106881, 107265, 106777, 108309, 106382, 108157, 111193, 107724, 107541, 111166, 106769, 106734, 108893, 108260, 109341, 107899, 106701, 108502, 109837, 109277, 107206, 108615, 108612, 109986, 108170, 107220, 108182, 106538, 106763, 110115, 107588, 106568, 108406, 110526, 110744, 108583, 109727, 108707, 110128, 108639, 110231, 107884, 109068, 106376, 111164, 106451, 108295, 106243, 106752, 108301, 107546, 106857, 108686, 109136, 107589, 109432, 109432, 108909, 109048, 107522, 108027, 107919, 110718, 107245, 108515, 107784, 106539, 107587, 109933, 109091, 107415, 108842, 108908, 110227, 107543, 107429, 109089, 110444, 111173, 108111, 108619, 109703, 107421, 107733, 109296, 109732, 109287, 106582, 106719, 107993, 107653, 108401, 109152, 108496, 109983, 107464, 108059, 109064, 107883, 107401, 110039, 106710, 106448, 106421, 110042, 108878, 106760, 108219, 108805, 108065, 108294, 106564, 106841, 108721, 107224, 109694, 111145, 109065, 110705, 107210, 110217, 108315, 106788, 107400, 107438, 107207, 108659, 106670, 111050, 108610, 110203, 106765, 108901, 109156, 106872, 110594, 107533, 109707, 108350, 107243, 105423, 106681, 106420, 110003, 108822, 107731, 107854, 110004, 108522, 110389, 109730, 108602, 108701, 108605, 107870, 108886, 110280, 107789, 108169, 106423, 107945, 106995, 107482, 106639, 110033, 106415, 106666, 107723, 109092, 106636, 108493, 107878, 107412, 106700, 106773, 107954, 108252, 108231, 108323, 108967, 109084, 109262, 107756, 108243, 107865, 106839, 106407, 110755, 106863, 110209, 106241, 108880, 107761, 109490, 107466, 106758, 106532, 106637, 108302, 110320, 106628, 110780, 110778, 108850, 106385, 110279, 107665, 110530, 110733, 107951, 109292, 110539, 111019, 106203, 108695, 107903, 108282, 107214, 106772, 109662, 106694, 108152, 108100, 106764, 108240, 109076, 108409, 108304, 107734, 108077, 108683, 110129, 107222, 108410, 109851, 108078, 108128, 108331, 110524, 108861, 108628, 110855, 108291, 108269, 106399, 108153, 110197, 109643, 109081, 106442, 109203, 107705 )
AND (pe.data_expiracao IS NULL
	OR pe.data_expiracao > CURRENT_DATE )
ORDER BY pe.id_usuario;