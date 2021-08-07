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

select uc.table_name, column_name from user_cons_columns ucc 
  join user_constraints uc 
  on ucc.constraint_name=uc.constraint_name 
  where uc.constraint_type='P' and 
  uc.table_name='PERSONAS';

select p.nombre, p.rut, ce.nombre as estado_civil, c.nombre as ciudad, r.nombre as rol from personas p  
inner join civil_estados ce on p.civil_estado_id = ce.id  
inner join ciudades c on p.ciudad_id = c.id  
inner join roles r on p.rol_id = r.id;

select p.nombre, p.rut, ce.nombre as estado_civil, c.nombre as ciudad, r.nombre as rol from personas p  
inner join civil_estados ce on p.civil_estado_id = ce.id  
inner join ciudades c on p.ciudad_id = c.id  
inner join roles r on p.rol_id = r.id 
order by p.nombre;

create view vista_personas as 
    select p.nombre, p.rut, ce.nombre as estado_civil, c.nombre as ciudad, r.nombre as rol from personas p  
    inner join civil_estados ce on p.civil_estado_id = ce.id  
    inner join ciudades c on p.ciudad_id = c.id  
    inner join roles r on p.rol_id = r.id 
    order by p.nombre;

select * from vista_personas;

select count(*) from vista_personas;

select count(*) as cantidad from vista_personas;

select * from user_catalog where table_type='VIEW';

select * from user_objects where object_type='VIEW';

select * from user_views where view_name like 'VISTA%';

create o replace view vista_personas as 
    select p.nombre, p.rut, r.nombre as rol from personas p 
    inner join roles r on p.rol_id = r.id 
    order by rol;

create or replace view vista_personas as 
    select p.nombre, p.rut, r.nombre as rol from personas p 
    inner join roles r on p.rol_id = r.id 
    order by rol;

select * from vista_personas;

create table empleados( 
  documento char(8), 
  nombre varchar2(20), 
  apellido varchar2(20), 
  sueldo number(6,2), 
  cantidadhijos number(2,0), 
  fechaingreso date, 
  primary key(documento) 
 );

describe empleados


insert into empleados values('22222222','Juan','Perez',200,2,'10/10/1980');

 insert into empleados values('22333333','Luis','Lopez',250,0,'01/02/1990');

 insert into empleados values('22444444','Marta','Perez',350,1,'02/05/1995');

 insert into empleados values('22555555','Susana','Garcia',400,2,'15/12/2000');

 insert into empleados values('22666666','Jose Maria','Morales',500,3,'25/08/2005');

insert into empleados values('22222222','Juan','Perez',200,2,date '10/10/1980');

 insert into empleados values('22333333','Luis','Lopez',250,0,date '01/02/1990');

 insert into empleados values('22444444','Marta','Perez',350,1,date '02/05/1995');

 insert into empleados values('22555555','Susana','Garcia',400,2,date '15/12/2000');

 insert into empleados values('22666666','Jose Maria','Morales',500,3,date '25/08/2005');

insert into empleados values('22222222','Juan','Perez',200,2,date '1980-10-10');

 insert into empleados values('22333333','Luis','Lopez',250,0,date '1990-01-01');

 insert into empleados values('22444444','Marta','Perez',350,1,date '1995-05-10');

 insert into empleados values('22555555','Susana','Garcia',400,2,date '15200-10-09');

 insert into empleados values('22666666','Jose Maria','Morales',500,3,date '2005-05-06');

select * from empleados;

create or replace procedure pa_aumentarsueldo 
 as 
 begin 
   update empleados set sueldo=sueldo+(sueldo*0.2) 
   where sueldo<(select avg(sueldo) from empleados); 
 end; 
/

 / 


select * from empleados;

exec pa_aumentarsueldo


select * from empleados;

create table empleados_antiguos( 
  documento char(8), 
  nombre varchar2(40) 
);

describe empleados_antiguos


create or replace procedure pa_empleados_antiguos 
 as 
 begin 
  insert into empleados_antiguos 
  select documento,nombre||' '||apellido 
   from empleados 
   where (extract(year from current_date)-extract(year from fechaingreso))>10; 
 end; 
/

 / 


 execute pa_empleados_antiguos


select "from empleados_antiguos;

select * from empleados_antiguos;

select *from user_objects where object_type='PROCEDURE' 
;

select *from user_procedures where object_name like 'PA_%';

 create or replace procedure pa_empleados_aumentarsueldo(ayear in number, aporcentaje in number) 
 as 
 begin 
  update empleados set sueldo=sueldo+(sueldo*aporcentaje/100) 
  where (extract(year from current_date)-extract(year from fechaingreso))>ayear; 
 end; 
/

 / 


execute pa_empleados_aumentarsueldo(5,20)


select * from empleados;

execute pa_empleados_aumentarsueldo(25,20)


select * from empleados;

create table libros( 
  titulo varchar2(40), 
  autor varchar2(30), 
  editorial varchar2(20), 
  precio number(5,2) 
 );

create table tabla1(  
   titulo varchar2(40), 
   precio number(6,2) 
  );

insert into libros values ('Uno','Richard Bach','Planeta',15);

 insert into libros values ('Ilusiones','Richard Bach','Planeta',12);

 insert into libros values ('El aleph','Borges','Emece',25);

 insert into libros values ('Aprenda PHP','Mario Molina','Nuevo siglo',50);

 insert into libros values ('Matematica estas ahi','Paenza','Nuevo siglo',18);

 insert into libros values ('Puente al infinito','Bach Richard','Sudamericana',14);

 insert into libros values ('Antología','J. L. Borges','Paidos',24);

 insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI',45);

 insert into libros values ('Cervantes y el quijote','Borges- Casares','Planeta',34);

select * from libros;

create or replace procedure pa_autorlibro(atitulo in varchar2) 
 as 
   vautor varchar2(20); 
 begin 
  select autor into vautor from libros where titulo=atitulo; 
  insert into tabla1 
   select titulo,precio 
   from libros 
   where autor=vautor; 
 end; 
/

 /


select * from libros;

exec pa_autorlibro('Uno')


select * from tabla1;

select * from libros;

create or replace function f_incremento10 (avalor number) 
  return number 
 is 
 begin  
   return avalor+(avalor*0.1); 
 end; 
/

 /


select titulo,precio,f_incremento10(precio) from libros;

create or replace function f_incremento (avalor number, aincremento number) 
  return number 
 is 
  begin  
   return avalor+(avalor*aincremento/100); 
  end; 
/

  /


select titulo,precio,f_incremento(precio,20) from libros;

select titulo,precio,f_incremento(precio,25) from libros;

create or replace function f_costoso (avalor number) 
  return varchar 
 is 
  valorretornado varchar(20); 
 begin 
   valorretornado:=''; 
   if avalor<=20 then 
    valorretornado:='economico'; 
   else valorretornado:='costoso'; 
   end if; 
   return valorretornado; 
 end; 
/

 /


select titulo,precio,f_costoso(precio) from libros;

select f_costoso (10) from dual;

select f_costoso (25) from dual;

create or replace function f_promedio (avalor1 number, avalor2 number) 
 return number 
 is 
 begin  
   return (avalor1+avalor2)/2; 
 end; 
/

 /


select f_promedio (10,20) from dual;

select f_promedio (50,20) from dual;

set serveroutput on


declare 
  resultado number; 
  multiplicador number:=0; 
begin 
  loop 
    resultado:=3*multiplicador; 
    dbms_output.put_line('3x'||to_char(multiplicador)||'='||to_char(resultado)); 
    multiplicador:=multiplicador+1; 
    exit when multiplicador>5; 
  end loop; 
end; 
/

set serveroutput on


 execute dbms_output.enable (20000)


declare 
 numero number:=0; 
 resultado number; 
begin 
  while numero<=5 loop 
   resultado:=3*numero; 
   dbms_output.put_line('3*'||to_char(numero)||'='||to_char(resultado)); 
   numero:=numero+1; 
  end loop; 
end; 
/

describe libros


 drop table libros


 create table libros( 
  codigo number(6), 
  titulo varchar2(40), 
  autor varchar2(30), 
  editorial varchar2(20), 
  precio number(6,2) 
 );

create table ofertas( 
  titulo varchar2(40), 
  autor varchar2(30), 
  precio number(6,2) 
 );

 create table control( 
  usuario varchar2(30), 
  fecha date 
 );

alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';

create or replace trigger tr_ingresar_ofertas 
  before insert 
  on ofertas 
 begin 
  insert into Control values(user,sysdate); 
 end tr_ingresar_ofertas; 
/

 /


select *from user_triggers where trigger_name ='TR_INGRESAR_OFERTAS';

 insert into libros values(100,'Uno','Richard Bach','Planeta',25);

 insert into libros values(102,'Matematica estas ahi','Paenza','Nuevo siglo',12);

 insert into libros values(105,'El aleph','Borges','Emece',32);

 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);

 insert into ofertas select titulo,autor,precio from libros where precio<30;

select * from ofertas;

select * from control;

insert into ofertas select titulo,autor,precio from libros where precio<30;

select * from control;

select * from ofertas;

create or replace trigger tr_ingresar_ofertas 
  before insert 
  on ofertas 
  for each row 
 begin 
  insert into Control values(user,sysdate); 
 end tr_ingresar_ofertas; 
/

 /


truncate ofertas


truncate table ofertas


select * from ofertas;

insert into ofertas select titulo,autor,precio from libros where precio<30;

select * from control;

drop table empleados


 drop table control


create table empleados( 
  documento char(8), 
  apellido varchar2(20), 
  nombre varchar2(20), 
  seccion varchar2(30), 
  sueldo number(8,2) 
 );

 create table control( 
  usuario varchar2(30), 
  fecha date, 
  evento varchar2(10) 
 );

 insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);

 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);

 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);

 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);

 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);

 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);

create or replace trigger tr_borrar_empleados 
  before delete 
  on empleados 
  for each row 
 begin 
  insert into control values(user,sysdate,'insert'); 
 end tr_borrar_empleados; 
/

 /


select *from user_triggers where trigger_name ='TR_BORRAR_EMPLEADOS';

delete from empleados where sueldo>800;

select * from control;

update control set evento = 'delete';

select * from control;

create or replace trigger tr_borrar_empleados 
  before delete 
  on empleados 
  for each row 
 begin 
  insert into control values(user,sysdate,'delete'); 
 end tr_borrar_empleados; 
/

 /


truncate table control


delete from empleados where sueldo>800;

select * from empleados;

select * from control;

insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);

 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);

 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);

delete from empleados where sueldo>800;

select * from control;

create or replace trigger tr_insertar_empleados 
  before insert 
  on empleados 
  for each row 
 begin 
  insert into Control values(user,sysdate,'insert'); 
 end tr_insertar_empleados; 
/

 /


 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);

 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);

 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);

select * from control;

