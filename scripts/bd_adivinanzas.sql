-- Drop database if exists and create a new one
DROP DATABASE IF EXISTS JuegoAdivinanzas;
CREATE DATABASE JuegoAdivinanzas;
USE JuegoAdivinanzas;
SET sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(60) NOT NULL
);

CREATE TABLE preguntas (
    id_pregunta INT PRIMARY KEY NOT NULL,
    pregunta TEXT NOT NULL,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_categoria 
        FOREIGN KEY (id_categoria) 
        REFERENCES categorias(id_categoria) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

CREATE TABLE respuestas (
    id_respuesta INT PRIMARY KEY NOT NULL,
    respuesta TEXT NOT NULL,
    id_pregunta INT NOT NULL,
    CONSTRAINT fk_pregunta 
        FOREIGN KEY (id_pregunta) 
        REFERENCES preguntas(id_pregunta) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

-- Science Category (id_categoria = 1)
INSERT INTO categorias (id_categoria, nombre) VALUES 
(1, 'Ciencia');

-- Technology Category (id_categoria = 2)
INSERT INTO categorias (id_categoria, nombre) VALUES 
(2, 'Tecnologia');

-- Questions for Science (id_categoria = 1)
INSERT INTO preguntas (id_pregunta, pregunta, id_categoria) VALUES 
(1, '¿Cuál es la estructura básica de un átomo?', 1),
(2, '¿Qué famoso científico formuló la teoría de la relatividad?', 1),
(3, '¿Cuál es el planeta más grande del sistema solar?', 1),
(4, '¿Cuál es la fórmula química del agua?', 1),
(5, '¿Cuál es la unidad fundamental de la herencia genética?', 1);

-- Answers for Science Questions
INSERT INTO respuestas (id_respuesta, respuesta, id_pregunta) VALUES
(1, 'Núcleo, electrones y protones', 1),
(2, 'Electrones, fotones y protones', 1),
(3, 'Átomos, moléculas y electrones', 1),
(4, 'Neutrones, protones y electrones', 1),

(5, 'Albert Einstein', 2),
(6, 'Isaac Newton', 2),
(7, 'Nikola Tesla', 2),
(8, 'Stephen Hawking', 2),

(9, 'Júpiter', 3),
(10, 'Saturno', 3),
(11, 'Marte', 3),
(12, 'Urano', 3),

(13, 'H2O', 4),
(14, 'CO2', 4),
(15, 'H2SO4', 4),
(16, 'NaCl', 4),

(17, 'Gen', 5),
(18, 'ADN', 5),
(19, 'Cromosoma', 5),
(20, 'Alelo', 5);

-- Questions for Technology (id_categoria = 2)
INSERT INTO preguntas (id_pregunta, pregunta, id_categoria) VALUES 
(6, '¿Quién inventó la World Wide Web (WWW)?', 2),
(7, '¿Qué significa "IP" en términos de redes de computadoras?', 2),
(8, '¿Cuál es la primera red social que se lanzó en Internet?', 2),
(9, '¿Qué empresa fabricó la primera computadora personal?', 2),
(10, '¿Qué siglas representan la unidad de medida "bit"?', 2);

-- Answers for Technology Questions
INSERT INTO respuestas (id_respuesta, respuesta, id_pregunta) VALUES
(21, 'Tim Berners-Lee', 6),
(22, 'Bill Gates', 6),
(23, 'Steve Jobs', 6),
(24, 'Mark Zuckerberg', 6),

(25, 'Protocolo de Internet', 7),
(26, 'Identificación de Protocolo', 7),
(27, 'Internet Provider', 7),
(28, 'Internet Protocol', 7),

(29, 'Six Degrees', 8),
(30, 'Facebook', 8),
(31, 'MySpace', 8),
(32, 'LinkedIn', 8),

(33, 'IBM', 9),
(34, 'Apple', 9),
(35, 'Microsoft', 9),
(36, 'HP', 9),

(37, 'Binary digit', 10),
(38, 'Bytes in Total', 10),
(39, 'Binary Technology', 10),
(40, 'Basic Internet Tool', 10);

/*Vista que regrese la pregunta con sus erspectivas respuestas de acuerdo a una categoria (Ciencia/Tecnologia)*/
create view pregunta_respuestas 
as select categorias.nombre as nombre, preguntas.id_pregunta as id, preguntas.pregunta, respuestas.respuesta from preguntas
inner join respuestas
on respuestas.id_pregunta = preguntas.id_pregunta
inner join categorias
on categorias.id_categoria = preguntas.id_categoria;

select * from pregunta_respuestas
where nombre = 'Ciencia';

