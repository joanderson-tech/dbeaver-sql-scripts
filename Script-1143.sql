	select
	*
from
	comum.SUBSISTEMA subsistema0_
left outer join comum.SISTEMA sistema1_ on
	subsistema0_.ID_SISTEMA = sistema1_.ID;
where
	subsistema0_.ID =?