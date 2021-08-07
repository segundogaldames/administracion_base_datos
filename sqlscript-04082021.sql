create table libros( 
  titulo varchar2(40), 
  autor varchar2(30), 
  editorial varchar2(20), 
  precio number(5,2) 
 );

describe libros


insert into libros values('Uno','Richard Bach','Planeta',15);

 insert into libros values('Ilusiones','Richard Bach','Planeta',18);

 insert into libros values('El aleph','Borges','Emece',25);

 insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45);

 insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',12);

 insert into libros values('Java en 10 minutos','Mario Molina','Paidos',35);

select * from libros;

create or replace procedure pa_libros_aumentar10 
  as 
  begin 
   update libros set precio=precio+(precio*0.1); 
  end; 
/

  /


execute procedure pa_libros_aumentar10


execute pa_libros_aumentar10


select * from libros;

drop procedure pa_libros_aumentar10


execute pa_libros_aumentar10


create or replace procedure pa_libros_aumentar10(aeditorial in varchar2) 
 as 
 begin 
  update libros set precio = precio + (precio * 0.1) 
  where editorial = aeditorial; 
 end; 
/

 / 


select * from libros;

execute pa_libros_aumentar10('Nuevo siglo')


select * from libros;

create or replace procedure pa_libros_aumentar(aeditorial in varchar2, aporcentaje in number default 10) 
 as 
 begin 
  update libros set precio = precio + (precio * aporcentaje/100) 
  where editorial = aeditorial; 
 end; 
/

 /


execute pa_libros_aumentar('Planeta',30)


select * from libros;

execute pa_libros_aumentar('Planeta')


select * from libros;

create or replace procedure pa_libros_insertar 
  (atitulo in varchar2 default null, aautor in varchar2 default 'desconocido', 
   aeditorial in varchar2 default 'sin especificar', aprecio in number default 0) 
 as 
 begin 
  insert into libros values (atitulo,aautor,aeditorial,aprecio); 
 end; 
/

 /


execute pa_libros_insertar()


select * from libros;

execute pa_libros_insertar('Uno',100)


select * from libros;

execute pa_libros_insertar(null,'Uno',100)


select * from libros;

execute pa_libros_insertar(null,'','Uno',100)


select * from libros;

create table tabla1(  
   titulo varchar2(40), 
   precio number(6,2) 
  );

describe tabla1


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


select * from libros;

exec pa_autorlibro('El aleph')


select * from libros;

select * from tabla1;

select * from libros;

select *from user_objects where object_type='PROCEDURE';

select *from user_procedures where object_name like 'PA_%';

select *from user_procedures where object_name like '%_LIBROS_%';

create or replace function f_incremento10 (avalor number) 
  return number 
 is 
 begin  
   return avalor+(avalor*0.1); 
 end; 
/

 / 


select titulo,precio,f_incremento10(precio) from libros;

select titulo,precio from libros;

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

