

BEGIN;


select distinct t.id_turma_serie, t.id_turma_agrupadora, t.codigo, t.id_turma
into temp turmatemporaria
from basico.curriculo_basico cb
join basico.turma_serie ts on ts.id_curriculo_medio = cb.id_curriculo_basico 
join ensino.turma t on t.id_turma_serie = ts.id_turma_serie 
where cb.id_curriculo_basico in (51880606, 35503513)
and t.id_situacao_turma = 1
and t.id_turma_agrupadora is not null;


select 'UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = ' || t.id_turma || ' ;' as solucao, 
'UPDATE ensino.turma	SET id_turma_agrupadora=' || t.id_turma_agrupadora  || ' WHERE id_turma = ' || t.id_turma || ' ;' as backup
from turmatemporaria as t;


COMMIT;




UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682932 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682975 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684260 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682978 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682940 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682964 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682945 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684269 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682927 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682956 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682952 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682977 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682920 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684263 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682939 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682917 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682941 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682934 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682930 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682966 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684268 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682963 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682929 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682946 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682969 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682979 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682916 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682983 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684258 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682971 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682931 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682957 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682970 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684261 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682951 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682953 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682918 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682967 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682922 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682947 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682928 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684266 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682943 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682944 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682955 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684264 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682933 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684262 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682942 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682968 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682954 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682980 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682921 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682923 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684265 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682935 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682965 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682981 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684259 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 684267 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682958 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682982 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682919 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682915 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682976 ;
UPDATE ensino.turma	SET id_turma_agrupadora=null WHERE id_turma = 682959 ;