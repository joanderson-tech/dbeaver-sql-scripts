
-- DROP FUNCTION basico.tiu_matricula_estudante_serie();

create or replace
function basico.tiu_matricula_estudante_serie() returns trigger language plpgsql as $function$ begin if (validar_matricula_serie(NEW.id_matricula_discente_serie, NEW.id_turma_serie, NEW.ano_calendario, NEW.id_serie_escola) = false) then raise exception 'basico.TIU_matricula_estudante_serie: A série da turma do estudante é diferente da série da matrícula.';
end if;

if TG_OP = 'UPDATE'
and old.id_turma_serie = new.id_turma_serie then return new;

elseif NEW.id_situacao_matricula_serie = 1
and (
select
	case
		when coalesce(ts.capacidade_aluno, 0) > 0 then COUNT (*) > ts.capacidade_aluno
		when coalesce(s.capacidade_maxima, 0) > 0 then COUNT (*) > (s.capacidade_maxima + coalesce(s.capacidade_excesso, 0))
		else COUNT (*) > (ee.capacidade_maxima + coalesce(ee.capacidade_excesso, 0))
	end
from
	basico.matricula_estudante_serie mes
join basico.turma_serie ts on
	ts.id_turma_serie = mes.id_turma_serie
left join basico.serie s on
	s.id_serie = ts.id_serie
left join basico.etapa_ensino ee on
	ee.id_etapa_ensino = s.id_etapa_ensino
where
	mes.id_turma_serie is not null
	and mes.id_turma_serie = NEW.id_turma_serie
	and mes.id_situacao_matricula_serie not in (4, 5, 6, 9, 12)
group by
	ts.regra_nao,
	ts.capacidade_aluno,
	s.capacidade_maxima,
	s.capacidade_excesso,
	ee.capacidade_maxima,
	ee.capacidade_excesso) then raise exception 'basico.TIU_matricula_estudante_serie: O número de estudantes enturmados ultrapassa a capacidade máxima definida. turma %, ano %, periodo % e matricula_discente_serie %.',
NEW.id_turma_serie,
NEW.ano_calendario,
NEW.periodo,
NEW.id_matricula_discente_serie;
end if;

return new;
end;

$function$ ;



begin;

rollback;
