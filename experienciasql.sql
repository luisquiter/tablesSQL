create database if not exists colaborador;

use colaborador;

create table experiencia(
		email varchar(100),
		empresa varchar(100),
		cargo varchar(100),
		fecha varchar(100),
		descripcion varchar(255)
);

describe experiencia;

alter table experiencia
add column id int(11) not null primary key auto_increment first;

alter table experiencia
add unique(email);

alter table experiencia
modify empresa varchar(255) not null;

-- colaborador.experiencia definition

CREATE TABLE `experiencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `empresa` varchar(255) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `fecha` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

