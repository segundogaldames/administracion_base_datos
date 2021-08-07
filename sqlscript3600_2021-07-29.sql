REM   Script: Seccion 3600
REM   Jueves 29 de julio

create roles( 
    id number not null, 
    nombre varchar2(100) not null 
);

create table roles( 
    id number not null primary key, 
    nombre varchar2(100) not null 
);

describe roles


create table civil_estados( 
    id number not null primary key, 
    nombre varchar2(20) not null 
);

alter table civil_estados add constraint PK_civil_estados primary key(id);

create table paises( 
    id number not null, 
    nombre varchar2(50) not null, 
    primary key(id) 
);

create table ciudades( 
    id number not null, 
    nombre varchar2(50) not null, 
    pais_id number not null, 
    primary key(id), 
    constraint FK_paises foreign key(pais_id) references paises(id) 
);

create table personas( 
    id number not null, 
    rut varchar2(20) not null, 
    nombre varchar2(100) not null, 
    email varchar2(100) not null, 
    fecha_nac date not null, 
    sexo integer not null, 
    direccion varchar2(100) not null, 
    civil_estado_id number not null, 
    ciudad_id number not null, 
    rol_id number not null, 
    constraint PK_persona primary key(id), 
    constraint FK_estado_civil foreign key(civil_estado_id) references civil_estados(id), 
    constraint FK_ciudad foreign key(ciudad_id) references ciudades(id), 
    constraint FK_rol foreign key(rol_id) references roles(id) 
);

INSERT INTO roles(id,nombre) VALUES(1.'Administrador');

INSERT INTO roles(id,nombre) VALUES(2.'Cliente');

INSERT INTO roles(id,nombre) VALUES(3.'Vendedor');

INSERT INTO roles(id,nombre) VALUES(4.'Supervisor');

INSERT INTO roles(id,nombre) VALUES(1,'Administrador');

INSERT INTO roles(id,nombre) VALUES(2,'Cliente');

INSERT INTO roles(id,nombre) VALUES(3,'Vendedor');

INSERT INTO roles(id,nombre) VALUES(4,'Supervisor');

select * from roles;

show tables 


describe civil_estados


INSERT INTO civil_estados(id,nombre) VALUES(1,'Casado-a');

INSERT INTO civil_estados(id,nombre) VALUES(2,'Divorciado-a');

INSERT INTO civil_estados(id,nombre) VALUES(3,'Viudo-a');

INSERT INTO civil_estados(id,nombre) VALUES(4,'Soltero-a');

INSERT INTO civil_estados(id,nombre) VALUES(5,'Separado-a');

select * from civil_estados;

INSERT INTO paises(id,nombre) VALUES(1,'Chile');

INSERT INTO paises(id,nombre) VALUES(2,'Argentina');

INSERT INTO paises(id,nombre) VALUES(3,'Estados Unidos');

INSERT INTO paises(id,nombre) VALUES(4,'España');

INSERT INTO ciudades(id,nombre,pais_id) VALUES(1,'Santiago',1);

INSERT INTO ciudades(id,nombre,pais_id) VALUES(2,'Temuco',1);

INSERT INTO ciudades(id,nombre,pais_id) VALUES(3,'Arica',1);

INSERT INTO ciudades(id,nombre,pais_id) VALUES(4,'Calama',1);

INSERT INTO ciudades(id,nombre,pais_id) VALUES(5,'Valparaiso',1);

INSERT INTO ciudades(id,nombre,pais_id) VALUES(6,'Buenos Aires',2);

INSERT INTO ciudades(id,nombre,pais_id) VALUES(7,'New York',3);

select c.nombre as ciudad, p.nombre as pais from ciudades c inner join paises p on c.pais_id = p.id order by ciudad;

describe personas


INSERT INTO personas(ID,RUT,NOMBRE,EMAIL,FECHA_NAC,SEXO,DIRECCION,CIVIL_ESTADO_ID,CIUDAD_ID,ROL_ID) VALUES(1,'10689756-4','Pedro Perez','pperez@gmail.com',DATE '1965-05-22',2,'Manuel Montt 320',1,3,1);

INSERT INTO personas(ID,RUT,NOMBRE,EMAIL,FECHA_NAC,SEXO,DIRECCION,CIVIL_ESTADO_ID,CIUDAD_ID,ROL_ID) VALUES(2,'18978320-k','Leticia Gonzalez','lgonzalez@gmail.com',DATE '1982-10-14',1,'Lautaro 200',4,2,2);

INSERT INTO personas(ID,RUT,NOMBRE,EMAIL,FECHA_NAC,SEXO,DIRECCION,CIVIL_ESTADO_ID,CIUDAD_ID,ROL_ID) VALUES(3,'22897410-0','Javiera Tapia','jtapia@hotmail.com',DATE '2001-05-31',1,'Las Acacias SN',4,5,4);

INSERT INTO personas(ID,RUT,NOMBRE,EMAIL,FECHA_NAC,SEXO,DIRECCION,CIVIL_ESTADO_ID,CIUDAD_ID,ROL_ID) VALUES(4,'20123897-2','Omar Caceres','ocaceres@yahoo.com',DATE '2003-01-10',2,'San Martin 1289',4,1,2);

select * from personas;

