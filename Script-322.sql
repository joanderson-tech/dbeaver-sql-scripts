select * from comum.dados_institucionais di ;
select * from comum.parametro;

SELECT * FROM comum.parametro p WHERE p.codigo = '2_10100_8' AND p.valor LIKE '%sigeduc_cloud_ref-%';


SELECT 
'https://'||regexp_replace(di.valor, '^https?://(.*)', '\1')||'/app/documentos',
di.valor, 
p.valor 
FROM comum.parametro p
cross join comum.dados_institucionais di 
WHERE p.codigo = '2_10100_8' AND p.valor LIKE '%sigeduc_cloud_ref-%' and di.nome = 'linkSigaa';


SELECT regexp_replace('https://minucipio-uf.portalsugeduc.com.br', '^https?://(.*)', '\1');

begin;
rollback;

update comum.parametro p set valor = 'https://'||regexp_replace(di.valor, '^https?://(.*)', '\1')||'/app/documentos' from comum.dados_institucionais di where p.codigo = '2_10100_8' AND p.valor LIKE '%sigeduc_cloud_ref-%' and di.nome = 'linkSigaa';

update comum.parametro p set valor ='https://sigeduc_cloud_ref-rn.portalsigeduc.com.br/app/documentos' where p.codigo = '2_10100_8'


--solução
[
  {
    "script": [
      "update comum.parametro p set valor = 'https://'||regexp_replace(di.valor, '^https?://(.*)', '\1')||'/app/documentos' from comum.dados_institucionais di where p.codigo = '2_10100_8' AND p.valor LIKE '%sigeduc_cloud_ref-%' and di.nome = 'linkSigaa';",
    ],
    "database": "comumdb"
  }
]


--s
[
  {
    "script": [
      "update comum.parametro p set valor ='https://sigeduc_cloud_ref-rn.portalsigeduc.com.br/app/documentos' where p.codigo = '2_10100_8'"
    ],
    "database": "comumdb",
    "cities":["afonsobezerra-rn","alexandria-rn","antoniomartins-rn","arapiraca-al","arapiraca-validacao","assu-rn","baiaformosa-rn","barauna-rn","bentofernandes-rn","boasaude-rn","bomjardim-pe","branquinha-al","brejodocruz-pb","campinagrande-pb","campinagrande-validacao","canguaretama-rn","carnaubadosdantas-rn","carnaubais-rn","casinhas-pe","cearamirim-rn","demo","demonstracao","demonstracao2","doutorseveriano-rn","espiritosanto-rn","extremoz-rn","franciscodantas-rn","galinhos-rn","ielmomarinho-rn","ipanguacu-rn","itapororoca-pb","janduis-rn","jardimdepiranhas-rn","joaodias-rn","jundia-rn","junqueiro-al","lagarto-se","lagoadanta-rn","lagoadepedras-rn","lagoasalgada-rn","lajes-rn","luisgomes-rn","majorsales-rn","montanhas-rn","monteiro-pb","mossoro-rn","murici-al","murici-validacao","nisiafloresta-rn","nossasenhoradosocorro-se","novacruz-rn","orobo-pe","orobo-validacao","parazinho-rn","parelhas-rn","parnamirim-rn","passaefica-rn","passagem-rn","pedragrande-rn","pedroavelino-rn","pocobranco-rn","prata-pb","pureza-rn","rafaelgodeiro-rn","referencia","riachodacruz-rn","riachuelo-rn","ruybarbosa-rn","santamaria-rn","santanadomatos-rn","santarita-pb","santoantonio-rn","saojosedoserido-rn","saopedro-rn","saorafael-rn","saotome-rn","sengeorginoavelino-rn","sousa-pb","tangara-rn","telha-se","timbaubadosbatistas-rn","treinamento","treinamento-cl","treinamento-v2","varzea-rn"
 ]
  }
]

