INSERT INTO fornasiero_gattarelli_pacheco."EmpresaMediosDeComunicacion"
VALUES
	(1675,'Artear', '30-50001091-2'),
	(1703, 'Grupo Clarin','33-70736658-9'),
	(1751, 'Editorial Haynes', '30-50003691-1'),
	(1824, 'Grupo Infobae', '33-67913936-9'),
	(1827, 'Grupo America', '30-50003196-0'),
	(2942, 'TCDRED', '30-50401884-5'),
	(8109, 'WarnerMedia', '30-68537634-9'),
	(1001, 'La Capital', '30-56211328-9'),
	(1002, 'La Patagonia', '34-50004533-9'),
	(1003, 'Red Litoral', '30-50005154-6');
	

INSERT INTO fornasiero_gattarelli_pacheco."EmisoraDeRadio"
VALUES
	(1, 'LT9', '3000', 'Juan Perez', 105.5, NULL),
	(2, 'LT10', '3000', 'Martin Martinez', 102.0, NULL),
	(3, 'Radio Mitre', '1234', 'Rodrigo Rodriguez', 79.0, NULL),
	(4, 'Radio Rivadavia', '1234', 'Hernan Hernandez', 63.0, NULL),
	(5, 'Radio Disney', '4567', 'Alfonso Alfonso', 94.3, NULL),
	(6, 'Cadena 3 Argentina', '7890', 'Juan Gomez', 70.0, NULL),
	(7, 'Blue', '31415', 'Emilio Catalano', 100.7, NULL),
	(8, 'Radio Continental', '4535', 'Nicolas Salinas', 59.0, NULL),
	(9, 'Aspen', '4324', 'Belen Sander', 105.5, NULL),
	(10, 'Latina', '4657', 'Agustina Castillo', 101.1, NULL),
	(11, 'Radio del Futuro', '4000', 'Silvia Iturraspe', 108.4, NULL),
	(12, 'La cosecha', '4000', 'Joaquin Elias', 103.3, NULL),
	(13, 'Abriendo caminos', '4000', 'Samanta Tarso', 104.5, NULL),
	(14, 'Tecno Sistems', '4000', 'Eusebio Klug', 100.8, NULL),
  	(15, 'Santa Fe Noticias', '4000', 'Mirta Klosseman', 101.2, NULL);


INSERT INTO fornasiero_gattarelli_pacheco."CadenaDeRadio"
VALUES 
	(1,'TDAmeritrade','Juan Perez', 1, 1001),
	(2, 'Interactive Brokers', 'Nicolas Salinas', 8, 1002),
	(3, 'Proyecto ITER', 'Ignacio Pilan', 6, 1003),
	(4, 'CRISPR-CAS9', 'Agustín Reynoso', 10, 1675),
	(5, 'Intel Inside', 'Jeff Musk', 7, 1703),
	(6, 'AMD rx', 'Elon Bezos', 3, 1751),
	(7, '3DFX', 'Martin Martinez', 2, 1824),
	(8, 'Foxconn', 'Federico Gattarelli', 4, 1827),
	(9, 'Arduino inside', 'Hugo Fornasiero', 5, 2942),
	(10, 'WSJ', 'Sandra Muller', 9, 8109),
	(11, 'Cadena del Litoral', 'Veronica Ramseyer', 4, 1001);

		
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 1 WHERE "nif" = 1;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 2 WHERE "nif" = 2;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 6 WHERE "nif" = 3;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 8 WHERE "nif" = 4;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 9 WHERE "nif" = 5;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 3 WHERE "nif" = 6;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 5 WHERE "nif" = 7;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 2 WHERE "nif" = 8;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 10 WHERE "nif" = 9;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 4 WHERE "nif" = 10;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 11 WHERE "nif" = 11;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 2 WHERE "nif" = 12;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 2 WHERE "nif" = 13;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 2 WHERE "nif" = 14;
UPDATE fornasiero_gattarelli_pacheco."EmisoraDeRadio" SET "idCadena" = 2 WHERE "nif" = 15;


INSERT INTO fornasiero_gattarelli_pacheco."BlogWeb"
VALUES
	(36, 'ElLitoral'),
	(20, 'LaVoz'),
	(35, 'Ambito'),
	(47, 'LaPuertaDeAlLado'),
	(59, 'MusicayArte'),
	(64, 'ZappingSport'),
	(72, 'MusicayPalabras'),
	(83, 'LaPatagonia'),
	(90, 'ArteyNoticias'),
	(10, 'ClasicosdeSiempre'),
	(30, 'La10Central'),
	(40, 'LeoNoticiasxla10'),
	(50, 'Lavueltadela10'),
	(60, 'Economico10'),
	(70, 'Amanecer10'),
	(77, 'CadenadelLitoral'),
	(44, 'Blog9'),
	(45, 'MasQuePalabras'),
	(46, 'NET9'),
	(91, 'El Nacional');


INSERT INTO fornasiero_gattarelli_pacheco."ProgramaDeRadio"
VALUES
	('LaLigaDeLaCiencia', 'inserteUnaDescripcionAqui', 1000.0, 20),
	('ADosVoces', 'inserteUnaDescripcionAqui', 750.0, 35),
	('LanataSinFiltro','inserteUnaDescripcionAqui', 2000.0, 45),
	('unProgramaDeRadio','inserteUnaDescripcionAqui', 100.0, 59),
	('MusicaPorqueNoTenemosPrograma','inserteUnaDescripcionAqui', 50.0, 59),
	('inserteNombreDeProgramaAqui','inserteUnaDescripcionAqui', 50.0, 46),
	('WhatIveLearned','inserteUnaDescripcionAqui', 500.0, 91),
	('LaDuchaFria','inserteUnaDescripcionAqui', 600.0, 77),
	('RelatoDePartidoDeFutbol','inserteUnaDescripcionAqui', 550.0, 91),
	('LosLeuco','inserteUnaDescripcionAqui', 1750.0, 45),
	('La central de la 10', 'Noticias locales y provinciales de Santa Fe', 30.00,30),
	('Noticias con Leo', 'Noticias del ambito local, provincial y acional con Leonardo Leonarduzzi', 25.00, 40),
	('Musica y noticias de la 10', 'Las noticias del dia, de la mano de Jose Perez', 25.00, 50),
	('A las 10 por la 10', 'Analisis politico y economico', 20.00,'60'),
	('Noti10', 'Empezamos el dia informandonos sobre el transito, politica y economia por la 10', 19.50, 70),
	('Litoral', 'Noticias actuales de la zona del Litoral', 250.0,77),
	('Noti9', 'Programa radial de la mañana de LT9', 150.00, 44),
	('MasQuePalabras', 'Programa de noticias y cultura por LT9', 200.00, 45),
	('NET', 'Nunca es tarde para informarse de las cosas, aquí en LT9', 100.00, 46),
	('Noticias del Medio Dia', 'Programa emitido al mediodía por radio Nacional', 200.00, 91);


INSERT INTO fornasiero_gattarelli_pacheco."Oyente"
VALUES
	('celiadiaz02@hotmail.com','celiadiaz02', '1234', '2021-06-05'),
	('albertomedina05@gmail.com','medalberto', '9512', '2020-08-14'),
	('victorheredia@gmail.com','herediav', '1597', '2020-09-01'),
	('lorenaibarra@yahoo.com','loreibarra01', '1111', '2021-01-18'),
	('santiledesm08@gmail.com','santi182', '4444', '2019-05-01'),
	('joaquinarriaga_11@hotmail.com','joacoa', '9547', '2021-03-16'),
	('jorgelinacejas_03@gmail.com','jcejas', '1596', '2020-08-21'),
	('samucantero_012@gmail.com','samucantero', '1565', '2021-02-02'),
	('giselacasco_14@gmail.com','gisec', '1414', '2020-05-22'),
	('manuelencinas@gmail.com','manuenc', '7777', '2020-10-11'),
	('alegarcia@gmail.com', 'Alejandro Garcia', 'A10Garcia21', '2021-10-10'),
	('fitigraf@outlook.com', 'Pablo Graf', 'FitIgraf21', '2020-05-05'),
	('ricky22@hotmail.com', 'Ricardo Rodriguez', 'Ricky2021', '2021-03-05'),
	('analia96@gmail.com', 'Analia Cepeda', 'Lia9621', '2021-06-01'),
	('luisdonadio@hotmail.com', 'Luis Donadio', 'lito_2019', '2019-11-15'),
	('andresgimenez@gmail.com','Andres Gimenez', 'aGiMenez21', '2021-02-23');


INSERT INTO fornasiero_gattarelli_pacheco."Nota"
VALUES
	(10, 'ColÃ³n CampeÃ³n', 'La fiesta del sabalero. Salieron campeones del torneo argentino, luego de 116 aÃ±os','2021-06-04','Con el corazon Rojo y Negro', '64'),
	(12,'Leve baja de Contagios', 'En el dia de hoy, se reportaron unos 120 casos menos. En el pais los contagios por Covid suben a 58300','2020-11-05', 'Reporte Diario Covid-19', '20'),
	(15, 'El arte de Da Vinci', 'De la mano de Elizabeth, la artista espaÃ±ola, recorremos los mejores museos de toda Italia, conocemos un poco de la historia y obra de Da Vinci', '2020-05-03','El artista que todos conocemos, Da Vinci', '83'),
	(16, 'Nuevo disco de Coti', 'El cantante argentino tiene nuevo disco. Se publicara el 14-06-2021, via streaming se podra ver la presentacion', '2020-08-15','','72'),
	(18, '4% de Inflacion en el ultimo mes', 'La inflacion en el mes de mayo fue de un 4%. Las nuevas medidas del gobierno, retener las exportaciones de la carne, ajustes en el monotributo','2020-03-19','La inflacion que no deja de subir', '35'),
	(42, 'Cuando la musica lo dice todo', 'Segun psicologos, la musica puede ayudar a prevenir enfermedades cerebrales. El doctor X explicÃ³ que tocar un instrumento genera millones de neuronas nuevas', '2020-02-25','La musica, una medicina natural', '72'),
	(55, 'Elecciones en Peru','Este fin de semana se realiza la segunda vuelta en el paÃ­s latinoamericano. Segun informes volverÃ­a a a ganar Fujimori', '2020-01-18','La segunda vuelta en las elecicones de Peru', '36'),
	(65, 'La cultura Inca', 'El historiador paranaense Fernando Quiroz nos explica las costumbres de las culturas indÃ­genas, el por quÃ© de ciertas ideas y guerras de la epoca', '2019-12-05','De la mano de Fernando Quiroz, Incas.. y un poco mÃ¡s', '90'),
	(70, 'Modernizando edificios', 'Laura nos cuenta como se estÃ¡n modernizando los edificios de la ciudad. Es un proyecto realizado en conjunto con el gobierno local', '2019-12-01','Modernizando antiguos edificios de la ciudad', '90'),
	(88, 'Disco de Oro para Bob Dylan', 'El cantante norteamericano de 80 aÃ±os acaba de ganar un nuevo disco de oro','2019-11-20','El poeta del rock hace historia', '59'),
	(11, 'Elvis, rey del Rock', 'De la mano de Rocko conocemos un poco de la historia del famoso cantante y actor de los 60, Elvis Presley', '2021-11-11', 'Leyendas del Rock', '72'),
	(20, 'Da Vinci y su arte', 'Gloria nos explica cómo Da Vinci era el genio del arte', '2020-10-04', 'Arte y renacimiento', '83'),
	(30, 'Analisis Musical y tonalidad', 'Para todos aquellos que se esten iniciando en la musica, aqui una mini clase, de la mano de Antonio Vargas', '2021-04-01', 'Aprendiendo musica', '59'),
	(40, 'Decorando tu casa', 'Lore nos trae unos tips para remodelar espacios de tu hogar', '2021-06-06', 'Renueva tus espacios', '35'),
	(50, 'Los vestidos de la realeza', 'La ganadora al mejor vestido de pelicula, nos da detalles de los vestidos de la reina', '2020-06-03', 'Moda y estilos, solo vestidos reales', '20'),
	(60, 'Tecnicas de Pintura en casa', 'Aprendiendo a pintar y decorar objetos con Leonela', '2021-03-01', 'Aprende a pintar cuadros y decorar desde casa', '36'),
	(71, 'Minimalismo', 'Es el concepto mas solicitado en lo que va de la última década', '2021-02-22', 'En la temática de la decoración de interiores, es por su gran capacidad de decorar, lo que determina su excelencia', '77'),
	(100, 'Gimnasia en Casa en tiempos de Cuarentena', 'El intructor Juan Perez nos enseña ejercicios para hacer desde casa y mantenernos en movimiento', '2021-06-10' , 'Salud, ejercicios para hacer en casa', '44'),
	(101, 'Recetas tradicionales', 'Te enseñamos a cocinar comidas típicas de la Argentina', '2021-06-10', 'Cocina en Casa', '44'),
	(102, 'Copa America', 'La Copa America se jugará en Brasil', '2021-06-10', 'Futbol', '45'),
	(103, 'Festivales al aire libre', 'El gobierno de la ciudad ha prohibido los espectáctulos y eventos al aire libre por el COVID.', '2021-06-11', 'Covid-19','45'),
	(104, '¿Es tiempo de pensar en la criptomoneda?', 'Según las estadísticas, los mineros del Bitcoin crecieron en un 45% este último mes.', '2021-06-11', 'Economía Digital', '46'),
	(105, 'Gran aumento de casos en la ciudad.','Luego de una semana de bajas considerables, los casos volvieron en aumento en la ciudad por las altas temperaturas y el poco aislamiento por los Santafesinos.', '2021-06-10', 'COVID-19', '46'),
	(200, 'Extraño el aplauso del publico', 'Mario Pasik, el reconocido actor, explicó en la entrevista que tuvo en nuestro programa que quisiera que pase la pandemia para volver a ver al público y oirlos aplaudir', '2021-06-01', 'Actuar es mi pasión', '91'),
	(210, 'Llegaron 811000 dosis de vacuna Astrazeneca', 'El gobierno nacional cerró acuerdo y llegaron nuevas vacunas al país', '2021-06-05', 'Covid, llegan nuevas vacunas', '91'),
	(220, 'San Juan: 42864 casos totales', 'En la provincia ya no hay camas UTI y preocupa el gran aumento de casos en la capital.', '2021-06-10', 'Casos de Covid en San Juan', '91'),
	(230, 'Los claroscuros de la cuarentena', 'A. Fernández y Kicillof: Escalvos de sus Palabras', '2021-06-15', 'Las palabras del gobierno', '91'),
	(240, 'Bares y gimnasios', 'El gobierno nacional autorizó la reapertura de estos dos rubros, bajo los protocolos y conservando la distancia social, se podrá comer afuera y volver al GYM.', '2021-06-20', 'Nuevas aperturas según DNU', '91'),
	(250, 'Vuelven las clases presenciales', 'Asi lo informó el gobierno nacional, a partir del Lunes, tanto nivel inicial como primario', '2021-06-23', 'Clases presenciales', '91'),
	(260, 'Vuelve el Tenis a Wimbledon', 'Según el ATP se informó que se jugará el famoso torneo de Inglaterra a partir del lunes 28 de Junio.', '2021-06-28', 'Tenis', '91');


INSERT INTO fornasiero_gattarelli_pacheco."Comentario"
VALUES
	(1,3,'2019-05-02', 'Que buen proyecto. Mientras no quiten los espacios verdes...', 'santiledesm08@gmail.com',70),
	(2,5,'2019-05-15', 'Que viva la música', 'santiledesm08@gmail.com', 42),
	(3,1,'2020-05-23', 'Discazo el que se mandó Coti!!', 'giselacasco_14@gmail.com', 16),
	(4,1,'2020-05-25', 'Todavía sigue sacando discos este tipo?', 'giselacasco_14@gmail.com', 88),
	(5,2,'2020-08-16', 'Seamos sinceros... alguna vez ésto va a cambiar?', 'albertomedina05@gmail.com', 18),
	(6,5,'2020-08-20', 'Si no seguimos adentro, difícil que ésto vaya a pasar', 'albertomedina05@gmail.com', 12),
	(7,3,'2020-08-20', 'Pero si no salimos a trabajar, no hay forma de alimentarse', 'santiledesm08@gmail.com', 12),
	(8,5,'2021-01-19', 'Que locura. Han pasado varios meses y todo sigue igual...', 'lorenaibarra@yahoo.com', 12),
	(9,1,'2021-06-04', 'Aunque estemos de esta manera, que bueno es ver que pase algo bueno.', 'lorenaibarra@yahoo.com', 10),
	(10,3,'2021-06-04', 'Pero que triste que tengamos que ver personas que no respeten la cuarentena.', 'santiledesm08@gmail.com', 10),
	(11, 3, '2021-11-12', 'Comentario de Ale', 'alegarcia@gmail.com', 20),
	(12, 4, '2020-10-06', 'Comentario de Fiti', 'fitigraf@outlook.com', 30),
	(13, 5, '2021-04-04', 'Comentario de Ricky', 'ricky22@hotmail.com', 40),
	(14, 5, '2021-06-06', 'Comentario de Analia', 'analia96@gmail.com', 50),
	(15, 3, '2020-06-03', 'Comentario de Luis', 'luisdonadio@hotmail.com', 60),
	(16, 4, '2021-03-03', 'Comentario de Andres', 'andresgimenez@gmail.com', 60),
	(17, 5, '2021-03-05', 'Es cierto. En mi casa tengo diseñado con ese tipo de diseño', 'santiledesm08@gmail.com', 71),
	(20, 5, '2021-06-10', 'Comentario de Luis', 'luisdonadio@hotmail.com', 100),
	(21, 4, '2021-06-11', 'Comentario de Analia', 'analia96@gmail.com', 101),
	(22, 4, '2021-06-11', 'Comentario de Ricky', 'ricky22@hotmail.com', 102),
	(23, 3, '2021-06-11', 'Comentario de Andres', 'andresgimenez@gmail.com', 103),
	(24, 2, '2021-06-11', 'Yo pienso comprar una gráfica y le mando a la criptomoneda y minería!!', 'santiledesm08@gmail.com', 104),
	(25, 3, '2021-06-11', 'A quedarnos en casa, la única forma de frenar el virus..', 'fitigraf@outlook.com', 105),
	(300, 5, '2021-06-02', 'Sin dudas, quiero volver a verlo en los teatros', 'giselacasco_14@gmail.com', 200),
	(301, 4, '2021-06-03', 'Muy buen actor, lo recuerdo de muchas novelas', 'santiledesm08@gmail.com', 200),
	(302, 3, '2021-06-11', 'Me hace sentir muy mal que este virus no se va, no puedo ver mis familiares', 'lorenaibarra@yahoo.com', 220),
	(303, 4, '2021-06-15', 'Este gobierno no sabe para qué lado ir.. nunca pensé que no iba a cambiar con otro gobierno', 'albertomedina05@gmail.com', 230),
	(304, 5, '2021-06-22', 'Los chicos deben volver a estar con sus pares, pero no quiero que haya más contagios. En este momento quiero que siga la virtualidad, hay que cuidarse', 'luisdonadio@hotmail.com', 250),
	(305, 5, '2021-06-11', 'Comentario de Ricky', 'ricky22@hotmail.com', 102);


INSERT INTO fornasiero_gattarelli_pacheco."TandaPublicitaria"
VALUES
	(1,'LaLigaDeLaCiencia'),
	(2,'ADosVoces'),
	(3,'LanataSinFiltro'),
	(4,'unProgramaDeRadio'),
	(5,'MusicaPorqueNoTenemosPrograma'),
	(6,'inserteNombreDeProgramaAqui'),
	(7,'WhatIveLearned'),
	(8,'LaDuchaFria'),
	(9,'RelatoDePartidoDeFutbol'),
	(10,'LosLeuco');


INSERT INTO fornasiero_gattarelli_pacheco."Patrocinador"
VALUES
	('12345678910', 'Puerto Madero', 'CABA', 'unEmail1@gmail.com', '123324321432'),	
	('12121212121', 'Santa Fe', 'Santa Fe', 'unEmail2@gmail.com', '4321432143'),
	('13131313131', 'Puerto Madero', 'CABA', 'unEmail3@gmail.com', '5435435423'),	
	('14141414141', 'Santa Fe', 'Santa Fe', 'unEmail4@gmail.com', '5245435436'),	
	('15151515151', 'Puerto Madero', 'CABA', 'unEmail5@gmail.com', '543543543540'),
	('16161616161', 'Santa Fe', 'Santa Fe', 'unEmail6@gmail.com', '8787686786787'),	
	('17171717171', 'Puerto Madero', 'CABA', 'unEmail7@gmail.com', '123412213'),
	('18181818181', 'Santa Fe', 'Santa Fe', 'unEmail8@gmail.com', '5264578550'),	
	('19191919191', 'Puerto Madero', 'CABA', 'unEmail9@gmail.com', '1324265760'),
	('21212121212', 'Santa Fe', 'Santa Fe', 'unEmail10@gmail.com', '32432142420');


INSERT INTO fornasiero_gattarelli_pacheco."Publicidad"
VALUES
	(1,'La LLama que llama',15,'Privada',840,'12345678910'),
	(2,'Quilmes, el sabor del encuentro',18,'Privada',1008,'12345678910'),
	(3,'Mamá Luccchetti',8,'Privada',448,'12121212121'),
	(4,'Kadicard, amiguito amarrete',6,'Privada',336,'17171717171'),
	(5,'Capuccino La Virginia',10,'Privada',560,'17171717171'),
	(6,'Dia de la madre, Personal',10,'Privada',560,'17171717171'),
	(7,'El imbancable, Cerveza Andes',15,'Privada',840,'18181818181'),
	(8,'Renault Clio, grande por dentro',8,'Privada',448,'12121212121'),
	(9,'Sprite, no estas solo',10,'Privada',560,'12345678910'),
	(10,'Campañá de vacunación Ministerio de Salud',10,'Oficial',560,'21212121212'),
	(11,'Coca Cola, para todos',15,'Privada',840,'15151515151');


INSERT INTO fornasiero_gattarelli_pacheco."conductor"
VALUES
	('LaLigaDeLaCiencia', 'Andrés Rieznik'),
	('ADosVoces', 'Marcelo Bonelli'),
	('LanataSinFiltro','Jorge Lanata'),
	('unProgramaDeRadio','Un Conductor'),
	('MusicaPorqueNoTenemosPrograma','Charles Brown'),
	('inserteNombreDeProgramaAqui','Conductor Prueba'),
	('WhatIveLearned','Joseph Everett Wil'),
	('LaDuchaFria','David Tesch'),
	('RelatoDePartidoDeFutbol','Pollo Vignolo'),
	('LosLeuco','Sebastian Leuco'),
	('La central de la 10','Juan Perez'),
	('Noticias con Leo', 'Leonardo Leonarduzzi'),
	('Musica y noticias de la 10', 'Mario Gomez'),
	('A las 10 por la 10', 'Mariana Zapata, Jorge Garcia'),
	('Noti10', 'Fernando Fernandez'),
	('MasQuePalabras', 'Alberto Dominguez');


INSERT INTO fornasiero_gattarelli_pacheco."FranjaHoraria"
VALUES
	('08:00', 0, 'Normal', '02:00'),
	('09:00', 1, 'Baja', '01:00'),
	('09:30', 2, 'Baja', '01:15'),
	('10:00', 3, 'Baja', '01:15'),
	('10:00', 2, 'Central', '01:15'),
	('11:30', 3, 'Normal', '01:30'),
	('12:00', 2, 'Central', '01:00'),
	('12:30', 5, 'Normal', '02:00'),
	('19:30', 6, 'Normal', '01:45'),
	('14:15', 6, 'Baja', '02:15'),
	('15:00', 3, 'Baja', '02:15'),
	('20:00', 3, 'Central', '02:00'),
	('22:00', 3, 'Central', '02:00'),
	('23:00', 1, 'Central', '02:00'),
	('21:15', 3, 'Central', '02:00'),
	('18:30', 4, 'Normal', '01:30'),
	('06:00', 4, 'Central', '01:30'),
	('06:30', 4, 'Central', '01:30'),
	('07:00', 4, 'Central', '01:30'),
	('07:30', 4, 'Central', '01:30');


INSERT INTO fornasiero_gattarelli_pacheco."Categoria"
VALUES
	('Viajes', 'Datos sobre tarifas de viajes, vacaciones, toda la informacion para preparar tus vacaciones', 'Cultura'),
	('Rock y Pop','Musica nacional e internacional, el estilo Rock', 'Musica'),
	('Decoracion y estilos', 'Tips para decorar tu casa', 'Urbanismo y decoracion'),
	('Futbol','Datos de partidos, tabla de posiciones, noticias sobre tu equipo', 'Deportes'),
	('Economia', 'Las ultimas noticias sobre la enconomia local e internacional', 'Economia'),
	('Salud', 'Mantener el cuerpo sano es esencial, por lo tanto tenemos una columna especial con algunos tips para la salud de tu cuerpo', 'Salud'),
	('Historia', 'La historia, parte de nosotros, hechos que marcaron un momento especial', 'Cultura'),
	('Politica Internacional', 'Noticias sobre las ultimas novedades de las ideologias y politicas internaciones', 'Politica'),
	('Espectaculos','Todas las novedades de la farandula de la mano de Martina', 'Sociedad'),
	('Locales', 'Informacion sobre la ciudad y alrededores', 'Noticias'),
	('Arte', 'Expresión de la forma de pensamiento de una época hecha con los medios propios de ese pensamiento', ''),
	('Musica y Estrellas', 'Informacion de tus bandas favoritas, historia de la musica, ultimos hits', 'Arte'),
	('Historia del arte','Aprendé la historia del arte junto a nosotros', 'Arte'),
	('Musica para Novatos', 'Aprende todo sobre musica, y domina el arte de composicion en poco tiempo', 'Arte'),
	('Modas y estilo', 'Analisis de vestimentas, fashion, modelos', 'Fashion'),
	('Arte y deco', 'Remodela espacios y aprende a decorar tu hogar', 'Decoracion'),
	('Jardineria', 'Decoracion de jardines y exteriores', 'Decoracion');


INSERT INTO fornasiero_gattarelli_pacheco."seEmiteEn"
VALUES
	('La central de la 10', '12:00',2, '2'),
	('Noticias con Leo', '20:00', 3, '2'),
	('Musica y noticias de la 10', '21:15', 3, '2'),
	('A las 10 por la 10', '10:00', 3, '2'),
	('Noti10', '22:00', 3, '2'),
	('Litoral', '15:00', 3, '10'),
	('Noti9', '9:00', 1, 1),
	('MasQuePalabras', '10:00', 2, 1),
	('NET', '23:00', 1, 1),
	('LaDuchaFria', '06:00', 7, 11),
	('LaLigaDeLaCiencia', '06:30', 4, 12),
	('MusicaPorqueNoTenemosPrograma', '07:00', 4, 13),
	('WhatIveLearned', '07:30', 4, 14);


INSERT INTO fornasiero_gattarelli_pacheco."seRegistraEn"
VALUES
	('alegarcia@gmail.com', '72'),
	('fitigraf@outlook.com', '83'),
	('ricky22@hotmail.com', '59'),
	('analia96@gmail.com', '35'),
	('luisdonadio@hotmail.com', '20'),
	('andresgimenez@gmail.com', '36');


INSERT INTO fornasiero_gattarelli_pacheco."clasificadaEn"
VALUES
	('Futbol',10),
	('Salud',12),
	('Locales',12),
	('Decoracion y estilos',15),
	('Rock y Pop',16),
	('Economia',18),
	('Rock y Pop',42),
	('Politica Internacional',55),
	('Historia',65),
	('Decoracion y estilos',70),
	('Rock y Pop',88),
	('Arte',71);


INSERT INTO fornasiero_gattarelli_pacheco."compuestaPor"
VALUES
	(1,1,'2021-01-03','20:00'),
	(1,2,'2021-01-05','21:15'),
	(1,10,'2021-03-15','18:00'),
	(2,2,'2021-02-06','16:30'),
	(2,4,'2021-02-06','10:00'),
	(2,10,'2020-05-15','11:53'),
	(3,1,'2020-04-13','00:15'),
	(3,5,'2020-12-15','11:36'),
	(3,6,'2021-01-23','04:15'),
	(3,10,'2021-02-03','22:01'),
	(4,8,'2021-06-25','06:11'),
	(4,9,'2021-06-25','23:48'),
	(4,10,'2021-02-20','01:36'),
	(4,11,'2021-03-16','14:47'),
	(5,3,'2020-04-25','13:02'),
	(5,11,'2020-11-24','22:14'),
	(6,10,'2021-06-25','17:34'),
	(7,4,'2021-06-25','18:26'),
	(7,8,'2021-06-25','13:35'),
	(7,10,'2020-01-27','13:45'),
	(7,11,'2021-04-19','19:55'),
	(8,1,'2021-03-18','20:30'),
	(8,4,'2021-01-26','05:18'),
	(8,5,'2021-02-25','10:15'),
	(8,7,'2021-06-25','10:47'),
	(8,10,'2021-06-25','12:36'),
	(8,11,'2021-06-25','08:49'),
	(9,2,'2021-06-25','23:59'),
	(9,5,'2020-09-09','18:04'),
	(9,6,'2020-10-01','07:15'),
	(9,10,'2021-06-25','18:45'),
	(9,11,'2021-03-08','17:54'),
	(10,3,'2020-05-09','21:38'),
	(10,4,'2020-03-18','17:35'),
	(10,8,'2021-01-24','14:21'),
	(10,9,'2021-02-02','12:15'),
	(10,10,'2021-01-01','15:15');




