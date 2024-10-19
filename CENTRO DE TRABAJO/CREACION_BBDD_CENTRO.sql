/* CREAMOS LA BASE DE DATOS QUE UTILIZAREMOS */
CREATE DATABASE EXAMEN;
USE EXAMEN;
/* CREAMOS LAS TABLAS SOLICITADAS EN LA TAREA */

# TABLA CENTROS
CREATE TABLE centros (
	num_ce int not null, # Numero centro
    nom_ce varchar(25), # Nombre centro
    dir_ce varchar(25), # Direccion centro
    PRIMARY KEY (num_ce) # Llave primaria num_ce
);

# TABLA DEPARTAMENTOS
CREATE TABLE departamentos (
	num_de int not null, # Numero departamento
    num_ce int not null, # Numero centro
    director int, # Director
    tipo_director char, # Tipo (en Propiedad (P), en Funciones (F))
    presupuesto int, # Presupuesto â‚¬ en miles
    dep_de int, # Departamento del que depende
    nom_de varchar(20), # Nombre departamento,
    PRIMARY KEY (num_de),
    FOREIGN KEY (num_ce) REFERENCES centros(num_ce), # Llave foranea num_ce
    FOREIGN KEY (dep_de) REFERENCES departamentos(num_de) # Llave foranea dep_de
);

# TABLA EMPLEADOS
CREATE TABLE empleados (
	num_em int not null, # Numero empleado
    ex_tel int, # Extension telefonica
    fecha_nac date, # fecha nacimiento
    fecha_inc date, # fecha incorporacion
    salario int, # Salario empleado
    comision int, # comision
    num_hijos int, # Numero de hijos
    nom_em varchar(10),
    num_de int, # Numero departamento al que pertenece
    PRIMARY KEY (num_em), # Llave primaria num_em
    FOREIGN KEY (num_de) REFERENCES departamentos(num_de) # Llave foranea num_de
);
/*
# INSERTAMOS EL PRIMER DATO PARA TABLA DEPARTAMENTOS
-- INSERT INTO departamentos VALUES (
--	100, 10, 260, 'P', 72, NULL, "DIRECCION GENERAL"
-- );
# GENERA ERROR -> Explicacion: es porque estamos intentando agregar un dato que es una foreign key `num_ce`, un numero de centro que no existe en la tabla de centros
# La solucion CORRECTA es primero rellenar la tabla Centros para tener referencias validas a la hora de insertar los datos para departamentos.*/
# La solucion de FUERZA BRUTA y PELIGROSA es quitar los FOREIGN_KEY_CHECKS. -> SET FOREIGN_KEY_CHECKS = 0;

# INSERTAMOS DATOS PARA TABLA CENTROS
INSERT INTO centros VALUES
	(10, "SEDE CENTRAL", "C/ ATOCHA, 820, MADRID"),
    (20, "RELACION CON CLIENTES", "C/ ATOCHA, 405, MADRID");
# Revisamos tabla CENTROS
SELECT * FROM centros;

# INSERTAMOS DATOS PARA TABLA DEPARTAMENTOS (bulk)
INSERT INTO departamentos VALUES 
	(100,10,260,'P',72,NULL,"DIRECCION GENERAL"),
    (110,20,180,'P',90,100,"DIRECC.COMERCIAL"),
    (111,20,180,'F',66,110,"SECTOR INDUSTRIAL"),
    (112,20,270,'P',54,110,"SECTOR SERVICIOS"),
    (120,10,150,'F',18,100,"ORGANIZACION"),
    (121,10,150,'P',12,120,"PERSONAL"),
    (122,10,350,'P',36,120,"PROCESO DE DATOS"),
    (130,10,310,'P',12,100,"FINANZAS");
# Revisamos tabla departamentos
SELECT * FROM departamentos;

# INSERTAMOS DATOS PARA TABLA EMPLEADOS (bulk) CON EL FORMATO DE FECHAS CONVERTIDAS A YYYY-MM-DD para que lo soporte mySQL :)
INSERT INTO empleados VALUES
	(110,350,"1970-11-10","1985-02-15",1800,NULL,3,"CESAR",121),
	(120,840,"1968-06-09","1988-10-01",1900,110,1,"MARIO",112),
	(130,810,"1965-09-09","1981-02-01",1500,110,2,"LUCIANO",112),
	(150,340,"1972-08-10","1997-01-15",2600,NULL,0,"JULIO",121),
	(160,740,"1980-07-09","2005-11-11",1800,110,2,"AUREO",111),
	(180,508,"1974-10-18","1996-03-18",2800,50,2,"MARCOS",110),
	(190,350,"1972-05-12","1992-02-11",1750,NULL,4,"JULIANA",121),
	(210,200,"1970-09-28","1999-01-22",1910,NULL,2,"PILAR",100),
	(240,760,"1967-02-26","1989-02-24",1700,100,3,"LAVINIA",111),
	(250,250,"1976-10-27","1997-03-01",2700,NULL,0,"ADRIANA",100),
	(260,220,"1973-12-03","2001-07-12",720,NULL,6,"ANTONIO",100),
	(270,800,"1975-05-21","2003-09-10",1910,80,3,"OCTAVIO",112),
	(280,410,"1978-01-10","2010-10-08",1500,NULL,5,"DOROTEA",130),
	(285,620,"1979-10-25","2011-02-15",1910,NULL,0,"OTILIA",122),
	(290,910,"1967-11-30","1988-02-14",1790,NULL,3,"GLORIA",120),
	(310,480,"1976-11-21","2001-01-15",1950,NULL,0,"AUGUSTO",130),
	(320,620,"1977-12-25","2003-02-05",2400,NULL,2,"CORNELIO",122),
	(330,850,"1958-08-19","1980-03-01",1700,90,0,"AMELIA",112),
	(350,610,"1979-04-13","1999-09-10",2700,NULL,1,"AURELIO",122),
	(360,750,"1978-10-29","1998-10-10",1800,100,2,"DORINDA",111),
	(370,360,"1977-06-22","2000-01-20",1860,NULL,1,"FABIOLA",121),
	(380,880,"1978-03-30","1999-01-01",1100,NULL,0,"MICAELA",112),
	(390,500,"1976-02-19","2010-10-08",1290,NULL,1,"CARMEN",110),
	(400,780,"1979-08-18","2011-11-01",1150,NULL,0,"LUCRECIA",111),
	(410,660,"1968-07-14","1989-10-13",1010,NULL,0,"AZUCENA",122),
	(420,450,"1966-10-22","1988-11-19",2400,NULL,0,"CLAUDIA",130),
	(430,650,"1967-10-26","1988-11-19",1260,NULL,1,"VALERIANA",122),
	(440,760,"1966-09-26","1986-02-28",1260,100,0,"LIVIA",111),
	(450,880,"1966-10-21","1986-02-28",1260,100,0,"SABINA",112),
	(480,760,"1965-04-04","1986-02-28",1260,100,1,"DIANA",111),
	(490,880,"1964-06-06","1988-01-01",1090,100,0,"HORACIO",112),
	(500,750,"1965-10-08","1987-01-01",1200,100,0,"HONORIA",111),
	(510,550,"1966-05-04","1986-11-01",1200,NULL,1,"ROMULO",110),
	(550,780,"1970-01-10","1998-01-21",600,120,0,"SANCHO",111);
