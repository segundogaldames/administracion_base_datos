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

