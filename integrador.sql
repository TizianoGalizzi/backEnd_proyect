CREATE SCHEMA Integrador;
use integrador;
-- Fin creacion base de datos

CREATE TABLE usuarios (
id INT auto_increment PRIMARY KEY,
email varchar(255),
nickname varchar(50),
password varchar(500),
rol varchar(50)
);
CREATE TABLE alumnos (
id INT auto_increment PRIMARY KEY,
nombre varchar(255),
apellido varchar(255),
dni varchar(10),
id_usuario INT,
FOREIGN KEY (id_usuario) references usuarios(id)
);
CREATE TABLE cursos (
id INT auto_increment PRIMARY KEY,
nombre varchar(255),
descripcion varchar(1000),
imagen varchar(1000),
año INT,
activo BOOLEAN
);
CREATE TABLE alumno_curso(
id_alumno INT,
id_curso INT,
FOREIGN KEY (id_alumno)references alumnos(id),
FOREIGN KEY (id_curso)references cursos(id)
);
-- Fin creacion de tablas

INSERT INTO usuarios (email,nickname,password,rol) VALUES 
('admin@admin.com','admin','admin','admin'),
('docente@docente.com','docente','docente','docente');
INSERT INTO alumnos (nombre,apellido,dni,id_usuario)VALUES
('alumno1','alumnoApellido','46241068','1');
INSERT INTO cursos (nombre,descripcion,imagen,año,activo)VALUES
('Javascript','descripciondelcursoJAVASCRIPT','url','2023','1');
INSERT INTO alumno_curso (id_alumno,id_curso)VALUES
('1','1');

SELECT * FROM usuarios;
SELECT * FROM alumnos;
SELECT * FROM cursos;
SELECT * FROM alumno_curso;

-- Alumnos - getAll (nombre de alumno, dni y curso al que esta inscripto):
SELECT a.id AS id_alumno, concat_ws(' ',a.nombre, a.apellido) AS alumno, a.dni, c.nombre AS curso FROM alumno_curso AS a_c 
INNER JOIN alumnos AS a ON a_c.id_alumno = a.id 
INNER JOIN cursos AS c ON a_c.id_curso = c.id
ORDER BY a.nombre ASC;
-- Alumnos - delete:
