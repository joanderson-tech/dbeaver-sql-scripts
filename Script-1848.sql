SELECT 'UPDATE ensino.matricula_componente SET media_final = NULL WHERE id_matricula_componente =  ' || id_matricula_componente || ';' AS SOLUÇÃO,
			 'UPDATE ensino.matricula_componente SET media_final = ' || media_final || ' WHERE id_matricula_componente =  ' || id_matricula_componente || ';' AS BACKUP
FROM ensino.matricula_componente
WHERE id_matricula_componente IN (17158788, 17158770, 17158779, 17158797, 17158806, 17158815, 17158824, 17158833, 17158842, 17158851, 17158860, 17158869, 17158878, 17160050, 17160059);