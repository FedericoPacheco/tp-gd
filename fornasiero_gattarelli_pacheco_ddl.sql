CREATE SCHEMA fornasiero_gattarelli_pacheco;


CREATE TABLE fornasiero_gattarelli_pacheco."EmpresaMediosDeComunicacion"
(
	"cuit" VARCHAR(12) PRIMARY KEY,
	"nombre" VARCHAR(64) NOT NULL,
	"direccionPostal" VARCHAR(64) NOT NULL	
);


CREATE TABLE fornasiero_gattarelli_pacheco."EmisoraDeRadio"
(
	"nif" INTEGER PRIMARY KEY,
	"nombre" VARCHAR(64) NOT NULL,
	"direccionPostal" VARCHAR(64) NOT NULL,
	"nombreDirector" VARCHAR(64) NOT NULL,
	"banda" DECIMAL(8,2) NOT NULL
);


CREATE TABLE fornasiero_gattarelli_pacheco."CadenaDeRadio"
(
	"id" INTEGER PRIMARY KEY NOT NULL,
	"nombre" VARCHAR(64) NOT NULL,
	"nombreDirector" VARCHAR(64) NOT NULL,
	"nifSedeCentral" INTEGER REFERENCES fornasiero_gattarelli_pacheco."EmisoraDeRadio" ("nif"),
	"cuitEmpresaMediosDeComunicacion" VARCHAR(12) REFERENCES fornasiero_gattarelli_pacheco."EmpresaMediosDeComunicacion" ("cuit")
);


ALTER TABLE fornasiero_gattarelli_pacheco."EmisoraDeRadio" ADD COLUMN "idCadena" INTEGER REFERENCES fornasiero_gattarelli_pacheco."CadenaDeRadio" ("id");


CREATE TABLE fornasiero_gattarelli_pacheco."BlogWeb"
(
	"id" INTEGER PRIMARY KEY,
	"nombre" VARCHAR(64) NOT NULL
); 


CREATE TABLE fornasiero_gattarelli_pacheco."ProgramaDeRadio"
(
	"nombre" VARCHAR(64) PRIMARY KEY,
	"descripcion" VARCHAR(512) NOT NULL,
	"costoPublicidadPorSegundo" DECIMAL(8,2) NOT NULL,
	"idBlogWeb" INTEGER REFERENCES fornasiero_gattarelli_pacheco."BlogWeb" ("id")
);


CREATE TABLE fornasiero_gattarelli_pacheco."Oyente"
(
	"email" VARCHAR(64) PRIMARY KEY,
	"nombreUsuario" VARCHAR(64) NOT NULL,
	"contrasenia" VARCHAR(64) NOT NULL,
	"fechaRegistro" DATE NOT NULL
);


CREATE TABLE fornasiero_gattarelli_pacheco."Nota"
(
	"id" INTEGER PRIMARY KEY,
	"titulo" VARCHAR(64) NOT NULL,
	"contenido" VARCHAR(4096) NOT NULL,
	"fechaPublicacion" DATE NOT NULL,
	"resumen" VARCHAR(512) NOT NULL,
	"idBlogWeb" INTEGER REFERENCES fornasiero_gattarelli_pacheco."BlogWeb" ("id")
);


CREATE TABLE fornasiero_gattarelli_pacheco."Comentario"
(
	"id" INTEGER PRIMARY KEY,
	"puntuacion" INTEGER CHECK("puntuacion" > 0 AND "puntuacion" < 6),
	"fechaRealizacion" DATE NOT NULL,
	"texto" VARCHAR(512) NOT NULL,
	"emailOyente" VARCHAR(64) REFERENCES fornasiero_gattarelli_pacheco."Oyente" ("email"),
	"idNota" INTEGER REFERENCES fornasiero_gattarelli_pacheco."Nota" ("id")
);


CREATE TABLE fornasiero_gattarelli_pacheco."TandaPublicitaria"
(
	"id" INTEGER PRIMARY KEY,
	"nombreProgramaDeRadio" VARCHAR(64) REFERENCES fornasiero_gattarelli_pacheco."ProgramaDeRadio" ("nombre")
);


CREATE TABLE fornasiero_gattarelli_pacheco."Patrocinador"
(
	"cuit" VARCHAR(12) PRIMARY KEY,
	"localidad" VARCHAR(64) NOT NULL,
	"provincia" VARCHAR(64) NOT NULL,	
	"email" VARCHAR(64) NOT NULL,
	"telefono" VARCHAR(32) NOT NULL
);


CREATE TABLE fornasiero_gattarelli_pacheco."Publicidad"
(
	"id" INTEGER PRIMARY KEY,
	"descripcion" VARCHAR(512) NOT NULL,
	"duracionEnSegundos" INTEGER NOT NULL,
	"tipo" VARCHAR(8) CHECK("tipo" IN ('Privada', 'Oficial')),
	"segundosPorSemana" INTEGER NOT NULL,
	"cuitPatrocinador" VARCHAR(12) REFERENCES fornasiero_gattarelli_pacheco."Patrocinador" ("cuit")
);


CREATE TABLE fornasiero_gattarelli_pacheco."conductor"
(
	"nombreProgramaDeRadio" VARCHAR(64) REFERENCES fornasiero_gattarelli_pacheco."ProgramaDeRadio" ("nombre"),
	"conductor" VARCHAR(64),
	PRIMARY KEY("nombreProgramaDeRadio", "conductor")
); 


CREATE TABLE fornasiero_gattarelli_pacheco."FranjaHoraria"
(
	"horaInicio" TIME,
	"diaSemana" INTEGER, -- 0: Domingo, 1: Lunes, 2: Martes, 3: Miercoles, 4: Jueves, 5: Viernes, 6: Sabado
	"categoria" VARCHAR(8) CHECK("categoria" IN ('Central', 'Normal', 'Baja')),
	"duracion" TIME NOT NULL, 
	 PRIMARY KEY("horaInicio", "diaSemana")
);


CREATE TABLE fornasiero_gattarelli_pacheco."Categoria"
(
	"nombre" VARCHAR(64) PRIMARY KEY,
	"descripcion" VARCHAR(512) NOT NULL,
	"nombreCategoriaPadre" VARCHAR(64) REFERENCES fornasiero_gattarelli_pacheco."Categoria" ("nombre") 
);


CREATE TABLE fornasiero_gattarelli_pacheco."seEmiteEn"
(
	"nombreProgramaDeRadio" VARCHAR(64) REFERENCES fornasiero_gattarelli_pacheco."ProgramaDeRadio" ("nombre"),
	"horaInicio" TIME,
	"diaSemana" INTEGER,
	"nifEmisoraDeRadio" INTEGER REFERENCES fornasiero_gattarelli_pacheco."EmisoraDeRadio" ("nif"),
	FOREIGN KEY ("horaInicio", "diaSemana") REFERENCES fornasiero_gattarelli_pacheco."FranjaHoraria" ("horaInicio", "diaSemana"),
	PRIMARY KEY ("nombreProgramaDeRadio", "horaInicio", "diaSemana","nifEmisoraDeRadio")
);


CREATE TABLE fornasiero_gattarelli_pacheco."seRegistraEn"
(
	"emailOyente" VARCHAR(64) REFERENCES fornasiero_gattarelli_pacheco."Oyente" ("email"),
	"idBlogWeb" INTEGER REFERENCES fornasiero_gattarelli_pacheco."BlogWeb" ("id"),
	PRIMARY KEY ("emailOyente", "idBlogWeb")
);


CREATE TABLE fornasiero_gattarelli_pacheco."clasificadaEn"
(
	"nombreCategoria" VARCHAR(64) REFERENCES fornasiero_gattarelli_pacheco."Categoria" ("nombre"),
	"idNota" INTEGER REFERENCES fornasiero_gattarelli_pacheco."Nota" ("id"),
	PRIMARY KEY ("nombreCategoria", "idNota")
);


CREATE TABLE fornasiero_gattarelli_pacheco."compuestaPor"
(
	"idTandaPublicitaria" INTEGER REFERENCES fornasiero_gattarelli_pacheco."TandaPublicitaria" ("id"),
	"idPublicidad" INTEGER REFERENCES fornasiero_gattarelli_pacheco."Publicidad" ("id"),
	PRIMARY KEY ("idTandaPublicitaria", "idPublicidad"),
	"fechaEmision" DATE NOT NULL,
	"horaEmision" TIME NOT NULL
);


