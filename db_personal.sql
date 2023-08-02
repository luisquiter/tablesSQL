-- creamos la base de datos
create database db_personal;

-- seleccionamos la base de datos creada
use db_personal;

show tables;

-- creamos un tabla

create table tbl_experiencia(
	id int(11) not null primary key auto_increment,
	fecha_inicio date not null,
	fecha_fin date null,
	descripcion text null,
	empresa varchar(255) not null,
	empresa_ubicacion varchar(255) not null
);

-- actualizamos datos
insert into tbl_experiencia(fecha_inicio,fecha_fin,empresa,empresa_ubicacion)
values
('2020-01-01','2021-01-01','SOUTHER PERU','MOQUEGUA'),
('2021-02-01','2023-02-01','HIDRANDINA','CAJAMARCA'),
('2023-03-01',null,'YANACOCHA', 'CAJAMARCA');

-- actualizamos datos

update tbl_experiencia
set descripcion = 'PROGRAMADOR JUNIO EN PYTHON DESARROLLANDO APLICACIONES CON FLASK Y FIREBASE'
where id = 1;

update tbl_experiencia 
set descripcion = 'PROGRAMAR SEMISENIOR EN PYTHON DESARROLLANDO API REST CON FLASK Y DJANGO'
where id = 2;

update tbl_experiencia 
set descripcion = 'SCRUM MASTER PARA PROYECTOS DE DESARROLLO'
where id = 3;

update tbl_experiencia
set empresa_ubicacion = 'LIMA',empresa = 'GRUPO ROMERO SAC'
where id = 2

-- modificamos la tabla para agregar un campo actual que registro si el trabajo es el actual o no
-- si es 0 no es su trabajo actual y si es 1 si es si trabajo actual, por defecto todos son 0
alter table tbl_experiencia
add column actual tinyint(1) default 0;

-- actualizamos la tabla para seleccionar el registro que tiene el trabajo actual , filtrando por la fecha de fin,
-- si la fecha de fin es nulo entonces ese es el trabajo actual

update tbl_experiencia
set actual = 1
where fecha_fin is null;

-- para eliminar un registro
delete from tbl_experiencia
where id = 3;

-- agregamos un campo ara el borrado logico
alter table tbl_experiencia
add column activo tinyint(1) default 1;

-- borrado logico
update tbl_experiencia set activo = 0
where id = 2;

-- mostrando datos que esten solo activos
select * from tbl_experiencia where activo = 1;

-- mostramos los datos de la tabla
select * from tbl_experiencia;


-- db_personal.tbl_experiencia definition

CREATE TABLE `tbl_experiencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` text,
  `empresa` varchar(255) NOT NULL,
  `empresa_ubicacion` varchar(255) NOT NULL,
  `actual` tinyint(1) DEFAULT '0',
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


