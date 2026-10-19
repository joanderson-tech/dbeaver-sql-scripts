select * from usuario u ;
select * from municipio m ;
select * from atrativo_turistico at2;
select * from tipo_atrativo_turistico tat ;
select * from municipio m ;


INSERT INTO ATRATIVO_TURISTICO (
    DATA_DE_CRIACAO, DESCRICAO, CEP, COMPLEMENTOS, LATITUDE, LOGRADOURO, NUMERO, COMPLEMENTO,
    BAIRRO, LONGITUDE, PONTO_DE_REFERENCIA, MUNICIPIO_ID, NOME, LEGENDA, LINK, ULTIMA_ATUALIZACAO,
    VALIDADO, CRIADO_POR_USUARIO_ID, TIPO_ATRATIVO_TURISTICO_ID, USUARIO_QUE_VALIDOU_ID
) VALUES
    ('2024-01-15 10:00:00', 'Parque ecológico com atrações diversas', '58010-001', 
     'Próximo ao shopping', '-7.11949', 'Rua das Palmeiras', '120', 'Piso 1, Loja 3', 'Centro', 
     '-34.84598', 'Atrás do hospital', 5, 'Parque Verde', 'Atração principal', 
     'https://www.exemplo.com/parque-verde', '2024-01-15 12:00:00', TRUE, 1, 15, 2),
     
    ('2024-02-01 09:30:00', 'Museu histórico com peças locais', '58020-002', 
     'Ao lado da praça', '-7.12585', 'Rua da Cultura', '15', 'Edifício histórico', 'Centro Histórico', 
     '-34.88147', 'Próximo à igreja', 8, 'Museu da Memória', 'Memória cultural', 
     'https://www.exemplo.com/museu-memoria', '2024-02-01 10:30:00', FALSE, 2, 5, 1),
     
    ('2024-03-10 08:00:00', 'Praia famosa com águas cristalinas', '58030-003', 
     'Próximo ao quiosque 5', '-7.14320', 'Avenida Beira-Mar', '50', 'Barraca 3', 'Orla', 
     '-34.85032', 'De frente para o mar', 12, 'Praia do Sol', 'Verão inesquecível', 
     'https://www.exemplo.com/praia-sol', '2024-03-10 09:00:00', TRUE, 3, 8, 4),
     
    ('2024-04-05 14:00:00', 'Mirante com vista panorâmica da cidade', '58040-004', 
     'Estrada para o parque', '-7.11024', 'Rua do Mirante', '200', 'Estacionamento incluído', 
     'Região Alta', '-34.83427', 'Próximo ao restaurante Vista Bela', 20, 'Mirante do Horizonte', 
     'Vista espetacular', 'https://www.exemplo.com/mirante-horizonte', '2024-04-05 15:30:00', FALSE, 4, 12, 6),
     
    ('2024-05-12 11:00:00', 'Cachoeira com trilhas ecológicas', '58050-005', 
     'Dentro do parque estadual', '-7.15562', 'Estrada da Cachoeira', 'KM 10', 'Área de camping', 
     'Reserva Natural', '-34.89945', 'Próximo à entrada do parque', 25, 'Cachoeira Encantada', 
     'Natureza em harmonia', 'https://www.exemplo.com/cachoeira-encantada', '2024-05-12 12:00:00', TRUE, 5, 20, 3);
