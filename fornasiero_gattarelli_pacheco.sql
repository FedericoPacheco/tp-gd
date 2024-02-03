--Consulta 1: "Para la emisora de radio LT10, listar la programación para la franja horaria 
--central de los martes, detallando programa, hora de inicio, duración, conductor(es)."

SELECT
	see."nombreProgramaDeRadio",
	fh."horaInicio",
	fh."duracion",
	c."conductor"
FROM
	fornasiero_gattarelli_pacheco."seEmiteEn" see,
	fornasiero_gattarelli_pacheco."conductor" c,
	fornasiero_gattarelli_pacheco."FranjaHoraria" fh
WHERE
	see."nombreProgramaDeRadio" = c."nombreProgramaDeRadio" AND
	see."horaInicio" = fh."horaInicio"			AND
	see."diaSemana" = fh."diaSemana"			AND
	fh."diaSemana" = 2					AND -- Martes
	fh."categoria" = 'Central'
ORDER BY
	fh."horaInicio",
	c."conductor";				


--Consulta 2: "Listar los oyentes que han realizado comentarios en cada una de las notas de 
--la categoría “Arte” escritas por programas de la cadena de radio “Cadena del Litoral”."

SELECT
	oy1."nombreUsuario"
FROM
	fornasiero_gattarelli_pacheco."EmisoraDeRadio" emrad1,
	fornasiero_gattarelli_pacheco."CadenaDeRadio" cadrad1,
	fornasiero_gattarelli_pacheco."ProgramaDeRadio" prograd1,
	fornasiero_gattarelli_pacheco."seEmiteEn" see1,
	fornasiero_gattarelli_pacheco."Nota" nota1,	
	fornasiero_gattarelli_pacheco."clasificadaEn" ce1,
	fornasiero_gattarelli_pacheco."Comentario" com1,
	fornasiero_gattarelli_pacheco."Oyente" oy1
WHERE
	oy1."email" = com1."emailOyente" 	  	 AND
	com1."idNota" = nota1."id"      	   	 AND 
	nota1."id" = ce1."idNota"      		  	 AND
	ce1."nombreCategoria" = 'Arte' 		 	 AND
	nota1."idBlogWeb" = prograd1."idBlogWeb" 	 AND
	prograd1."nombre" = see1."nombreProgramaDeRadio" AND
	see1."nifEmisoraDeRadio" = emrad1."nif"   	 AND
	emrad1."idCadena" = cadrad1."id" 	  	 AND
	cadrad1."nombre" = 'Cadena del Litoral' 
GROUP BY
	oy1."nombreUsuario",
	com1."idNota"
HAVING
	COUNT (DISTINCT com1."idNota") = 
	COUNT (DISTINCT
			(
				SELECT
					nota2."id"
				FROM 
					fornasiero_gattarelli_pacheco."EmisoraDeRadio" emrad2,
					fornasiero_gattarelli_pacheco."CadenaDeRadio" cadrad2,
					fornasiero_gattarelli_pacheco."ProgramaDeRadio" prograd2,
					fornasiero_gattarelli_pacheco."Nota" nota2,
					fornasiero_gattarelli_pacheco."seEmiteEn" see2,
					fornasiero_gattarelli_pacheco."clasificadaEn" ce2
				WHERE
					emrad2."idCadena" = cadrad2."id" 		  AND
					cadrad2."nombre" = 'Cadena del Litoral'		  AND
					see2."nifEmisoraDeRadio" = emrad2."nif"		  AND
					see2."nombreProgramaDeRadio" = prograd2."nombre"  AND
					prograd2."idBlogWeb" = nota2."idBlogWeb"	  AND
					nota2."id" = ce2."idNota"			  AND
					ce2."nombreCategoria" = 'Arte'
			)
		)
ORDER BY 
	oy1."nombreUsuario";


--Consulta 3: "Listar el Top 5 de las emisoras que en el trimestre enero-marzo 2021 han 
--tenido la menor cantidad de segundos de publicidad en su programación en franja horaria
--central. Listar emisora y cantidad de segundos de publicidad emitida en el trimestre."

-- Se usa una vista para intentar simplificar la consulta principal
CREATE VIEW fornasiero_gattarelli_pacheco."duracionPublicidadesPorEmisora"
AS
(
	SELECT
		see."nifEmisoraDeRadio",
		SUM ("duracionPublicidadesPorPrograma"."duracionTotal") "duracionTotal"
	FROM
		fornasiero_gattarelli_pacheco."seEmiteEn" see,
		(
			SELECT
				see."nombreProgramaDeRadio",
				SUM("duracionPublicidadesPorTanda"."duracionTotal") "duracionTotal"
			FROM
				fornasiero_gattarelli_pacheco."TandaPublicitaria" tp,
				fornasiero_gattarelli_pacheco."ProgramaDeRadio" prograd,
				fornasiero_gattarelli_pacheco."seEmiteEn" see,
				fornasiero_gattarelli_pacheco."FranjaHoraria" fh,
				(
					SELECT
						cp."idTandaPublicitaria",
						SUM(p."duracionEnSegundos") "duracionTotal"
					FROM
						fornasiero_gattarelli_pacheco."compuestaPor" cp,
						fornasiero_gattarelli_pacheco."Publicidad" p
					WHERE
						cp."idPublicidad" = p."id"	   			AND
						(EXTRACT(MONTH FROM cp."fechaEmision") BETWEEN 1 AND 3) AND
						(EXTRACT(YEAR FROM cp."fechaEmision") = 2021)
					GROUP BY
						cp."idTandaPublicitaria"
				) AS "duracionPublicidadesPorTanda"
			WHERE
				tp."nombreProgramaDeRadio" = see."nombreProgramaDeRadio"       	AND
				"duracionPublicidadesPorTanda"."idTandaPublicitaria" = tp."id" 	AND
				see."horaInicio" = fh."horaInicio"			       	AND
				see."diaSemana" = fh."diaSemana"			 	AND
				fh."categoria" = 'Central'	  
			GROUP BY 
				see."nombreProgramaDeRadio"
		) AS "duracionPublicidadesPorPrograma"	
	WHERE
		see."nombreProgramaDeRadio" = "duracionPublicidadesPorPrograma"."nombreProgramaDeRadio"
	GROUP BY
		see."nifEmisoraDeRadio"
);	

SELECT
	emrad."nif",
	emrad."nombre" "nombreEmisoraDeRadio",
	dppe."duracionTotal"
FROM
	fornasiero_gattarelli_pacheco."duracionPublicidadesPorEmisora" dppe,
	fornasiero_gattarelli_pacheco."EmisoraDeRadio" emrad
WHERE
	emrad."nif" = dppe."nifEmisoraDeRadio" AND
	dppe."duracionTotal" = (SELECT MIN("duracionTotal") FROM fornasiero_gattarelli_pacheco."duracionPublicidadesPorEmisora")
ORDER BY 
	emrad."nif"
LIMIT 5;


--Consulta 4: "Para la emisora LT9, listar el programa al cual corresponde la nota escrita en 
--su blog, que recibió la mayor cantidad de comentarios positivos (4 o 5 estrellas) en los 
--últimos dos días. Se quiere conocer programa, conductor(es), título de la nota, cantidad de 
--comentarios recibidos."

-- Se usa una vista para intentar simplificar la consulta principal
CREATE VIEW fornasiero_gattarelli_pacheco."cuentaComentariosPorPrograma"
AS 
(
	SELECT
		prograd."nombre" "nombreProgramaDeRadio",
		nota."titulo" "tituloNota",
		COUNT(DISTINCT com."id") "cuentaComentarios"
	FROM
		fornasiero_gattarelli_pacheco."EmisoraDeRadio" emrad,
		fornasiero_gattarelli_pacheco."seEmiteEn" see,
		fornasiero_gattarelli_pacheco."ProgramaDeRadio" prograd,
		fornasiero_gattarelli_pacheco."Nota" nota,
		fornasiero_gattarelli_pacheco."Comentario" com
	WHERE
		emrad."nombre" = 'LT9'				AND
		emrad."nif" = see."nifEmisoraDeRadio" 		AND
		see."nombreProgramaDeRadio" = prograd."nombre"  AND
		prograd."idBlogWeb" = nota."idBlogWeb" 		AND
		nota."id" = com."idNota"			AND
		(com.puntuacion BETWEEN 4 AND 5) 		AND
		(EXTRACT(EPOCH FROM CURRENT_DATE) - EXTRACT(EPOCH FROM  com."fechaRealizacion") <= 2 * 24 * 60 * 60)
		-- Puede que no de resultados
	GROUP BY
		prograd."nombre",
		nota."titulo"
);

SELECT
	ccpp."nombreProgramaDeRadio",
	ccpp."tituloNota",
	ccpp."cuentaComentarios",
	cond."conductor" "nombreConductor"
FROM
	fornasiero_gattarelli_pacheco."conductor" cond,
	fornasiero_gattarelli_pacheco."cuentaComentariosPorPrograma" ccpp
WHERE 
	cond."nombreProgramaDeRadio" = ccpp."nombreProgramaDeRadio" AND
	ccpp."cuentaComentarios" = (SELECT MAX("cuentaComentarios") FROM fornasiero_gattarelli_pacheco."cuentaComentariosPorPrograma")
GROUP BY 
	ccpp."nombreProgramaDeRadio",
	ccpp."tituloNota",
	ccpp."cuentaComentarios",
	cond."conductor"
ORDER BY
	ccpp."nombreProgramaDeRadio",
	ccpp."tituloNota",
	cond."conductor";


--Consulta 5: "Para el programa “Noticias del Medio Dia” que se emite por radio Nacional, 
--listar todas las notas publicadas junto con los comentarios recibidos en las mismas (los 
--tengan o no), durante los últimos 30 días."

SELECT 
	"id" "idNota",
	"tituloNota",
	"idComentario",
	"emailOyente",
	"texto" "textoComentario"
FROM
	(
		SELECT
			nota."id",
			nota."titulo" "tituloNota"
		FROM	
			fornasiero_gattarelli_pacheco."ProgramaDeRadio" prograd,
			fornasiero_gattarelli_pacheco."Nota" nota
		WHERE	
			prograd."nombre" = 'Noticias del Medio Dia' AND
			prograd."idBlogWeb" = nota."idBlogWeb"
	) AS "notasNoticias"
	LEFT JOIN 
	(
		SELECT 
			com."idNota",
			com."id" "idComentario",
			com."emailOyente",
			com."texto"
		FROM 
			fornasiero_gattarelli_pacheco."Comentario" com
		WHERE 
			EXTRACT(EPOCH FROM CURRENT_DATE) - EXTRACT(EPOCH FROM  com."fechaRealizacion") <= 30 * 24 * 60 * 60
			-- Puede que no de resultados
	) AS "comentariosNotasNoticias30"
	ON ("notasNoticias"."id" = "comentariosNotasNoticias30"."idNota")
ORDER BY 
	"idNota";


--Consulta 6: "Listar las emisoras de radio cuya recaudación total en concepto de publicidad, 
--para los últimos 7 días, sea mayor al promedio de recaudación por publicidad de todas las 
--emisoras, para el mismo período."

-- Se usa una vista para intentar simplificar la consulta principal
CREATE VIEW fornasiero_gattarelli_pacheco."recaudacionTotalEmisoras"
AS 
(
	SELECT
		see."nifEmisoraDeRadio",
		SUM("costoTotalPorPrograma"."costoTotal") "recaudacionTotal"
	FROM
		fornasiero_gattarelli_pacheco."seEmiteEn" see,
		(
			SELECT 
				prograd."nombre",
				"duracionPublicidadesPorTanda"."duracionTotal" * prograd."costoPublicidadPorSegundo" "costoTotal"
			FROM	
				fornasiero_gattarelli_pacheco."TandaPublicitaria" tp,
				fornasiero_gattarelli_pacheco."ProgramaDeRadio" prograd,
				(
					SELECT
						cp."idTandaPublicitaria", 
						SUM(p."duracionEnSegundos") "duracionTotal"
					FROM
						fornasiero_gattarelli_pacheco."compuestaPor" cp,
						fornasiero_gattarelli_pacheco."Publicidad" p
					WHERE
						cp."idPublicidad" = p."id" AND
						(EXTRACT(EPOCH FROM CURRENT_DATE) - EXTRACT(EPOCH FROM  cp."fechaEmision") <= 7 * 24 * 60 * 60)	
						-- Puede que no de resultados
					GROUP BY
						cp."idTandaPublicitaria"
				) AS "duracionPublicidadesPorTanda" 
			WHERE
				tp."id" = "duracionPublicidadesPorTanda"."idTandaPublicitaria" AND
				tp."nombreProgramaDeRadio" = prograd."nombre"
		) AS "costoTotalPorPrograma"
	WHERE
		see."nombreProgramaDeRadio" = "costoTotalPorPrograma"."nombre"
	GROUP BY
		see."nifEmisoraDeRadio"
);


SELECT
	emrad."nif" "nifEmisora",
	emrad."nombre" "nombreEmisora"
FROM
	fornasiero_gattarelli_pacheco."EmisoraDeRadio" emrad,
	fornasiero_gattarelli_pacheco."recaudacionTotalEmisoras" rte
WHERE 
	emrad."nif" = rte."nifEmisoraDeRadio" AND	
	"recaudacionTotal" > (SELECT AVG("recaudacionTotal") FROM fornasiero_gattarelli_pacheco."recaudacionTotalEmisoras")
ORDER BY 
	emrad."nif";


--Consulta 7: "Listar los nombres de los programas que sólo son emitidos en franjas horarias 
--centrales y por cadenas de radio compuestas por más de 5 emisoras."

SELECT
	cadrad."id" "idCadena",
	cadrad."nombre" "nombreCadena",
	see1."nombreProgramaDeRadio"
FROM
	fornasiero_gattarelli_pacheco."EmisoraDeRadio" emrad,
	fornasiero_gattarelli_pacheco."CadenaDeRadio" cadrad,
	fornasiero_gattarelli_pacheco."seEmiteEn" see1
WHERE
	emrad."idCadena" = cadrad."id"			AND
	emrad."nif" = see1."nifEmisoraDeRadio" 		AND
	emrad."idCadena" IN (
					SELECT "idCadena"
					FROM fornasiero_gattarelli_pacheco."EmisoraDeRadio"
					GROUP BY "idCadena"
					HAVING COUNT(*) > 5 
			    )				AND
	NOT EXISTS (
			SELECT *
			FROM 
				fornasiero_gattarelli_pacheco."seEmiteEn" see2,
				fornasiero_gattarelli_pacheco."FranjaHoraria" fh
			WHERE
				see2."nifEmisoraDeRadio" = emrad."nif" 			    AND
				see2."nombreProgramaDeRadio" = see1."nombreProgramaDeRadio" AND
				see2."horaInicio" = fh."horaInicio" 			    AND
				see2."diaSemana" = fh."diaSemana"			    AND
				fh."categoria" != 'Central'	
		   )
ORDER BY
	cadrad."id",
	see1."nombreProgramaDeRadio";


--Consulta 8: "Listar aquellas cadenas de radio cuyo director es distinto al director de la 
--emisora de radio que es sede central de la cadena. Mostrar nombre de la cadena de radio, nombre 
--de la radio emisora sede central de la cadena, nombre del director de la cadena, nombre del 
--director de la radio emisora sede central."

SELECT
	cadrad1."nombre" "nombreCadenaDeRadio",
	emrad1."nombre" "nombreEmisoraDeRadioCentral",
	cadrad1."nombreDirector" "nombreDirectorCadena",
	emrad1."nombreDirector" "nombreDirectorEmisora"
FROM
	fornasiero_gattarelli_pacheco."CadenaDeRadio" cadrad1,
	fornasiero_gattarelli_pacheco."EmisoraDeRadio" emrad1,
	(
		SELECT "id"
		FROM fornasiero_gattarelli_pacheco."CadenaDeRadio"
		EXCEPT
		SELECT cadrad2."id"	
		FROM 
			fornasiero_gattarelli_pacheco."CadenaDeRadio" cadrad2,
			fornasiero_gattarelli_pacheco."EmisoraDeRadio" emrad2
		WHERE
			cadrad2."nifSedeCentral" = emrad2."nif" 	    AND
			cadrad2."nombreDirector" = emrad2."nombreDirector"
	) AS "idCadenasDirectoresNoCoincidentes"
WHERE
	cadrad1."id" = "idCadenasDirectoresNoCoincidentes"."id" AND
	cadrad1."nifSedeCentral" = emrad1."nif"
ORDER BY 
	cadrad1."nombre";



