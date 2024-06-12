-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS GYM;
USE GYM;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "-05:00";

-- Eliminar las tablas si ya existen
DROP TABLE IF EXISTS `log_entrenamientos`;
DROP TABLE IF EXISTS `entrenamientos`;
DROP TABLE IF EXISTS `pagos`;
DROP TABLE IF EXISTS `membresias`;
DROP TABLE IF EXISTS `horarios`;
DROP TABLE IF EXISTS `actividades`;
DROP TABLE IF EXISTS `entrenadores`;
DROP TABLE IF EXISTS `clientes`;

-- Eliminar las vistas si ya existen
DROP VIEW IF EXISTS `vista_resumen_entrenamientos`;
DROP VIEW IF EXISTS `vista_historial_pagos`;
DROP VIEW IF EXISTS `vista_disponibilidad_entrenadores`;
DROP VIEW IF EXISTS `vista_detalle_actividades`;

-- Crear las tablas
CREATE TABLE `clientes` (
  `con_id` int(11) NOT NULL COMMENT 'id del cliente',
  `con_nombre` varchar(50) NOT NULL COMMENT 'nombre del cliente',
  `con_genero` varchar(50) NOT NULL COMMENT 'genero del cliente',
  `con_edad` int(11) NOT NULL COMMENT 'edad del cliente',
  `con_altura` int(11) NOT NULL COMMENT 'altura del cliente',
  `con_peso` int(11) NOT NULL COMMENT 'peso del cliente',
  `con_estadoFisico` varchar(30) NOT NULL COMMENT 'estado fisico del cliente',
  `con_objetivoEntrenamiento` varchar(30) NOT NULL COMMENT 'objetivo del cliente',
  `con_disponibilidadEntrenar` varchar(30) NOT NULL COMMENT 'disponibilidad del cliente',
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`con_id`);


ALTER TABLE `clientes`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id del cliente', AUTO_INCREMENT=4;
COMMIT;

CREATE TABLE `entrenadores` (
  `ent_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id del entrenador',
  `ent_nombre` varchar(50) NOT NULL COMMENT 'nombre del entrenador',
  `ent_genero` varchar(50) NOT NULL COMMENT 'genero del entrenador',
  `ent_especialidad` varchar(50) NOT NULL COMMENT 'especialidad del entrenador',
  PRIMARY KEY (`ent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `actividades` (
  `act_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la actividad',
  `act_nombre` varchar(50) NOT NULL COMMENT 'nombre de la actividad',
  `act_duracion` int(11) NOT NULL COMMENT 'duración de la actividad en minutos',
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `entrenamientos` (
  `entrenamiento_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id del entrenamiento',
  `cliente_id` int(11) NOT NULL COMMENT 'id del cliente',
  `entrenador_id` int(11) NOT NULL COMMENT 'id del entrenador',
  `actividad_id` int(11) NOT NULL COMMENT 'id de la actividad',
  `fecha` date NOT NULL COMMENT 'fecha del entrenamiento',
  PRIMARY KEY (`entrenamiento_id`),
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`con_id`),
  FOREIGN KEY (`entrenador_id`) REFERENCES `entrenadores`(`ent_id`),
  FOREIGN KEY (`actividad_id`) REFERENCES `actividades`(`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `membresias` (
  `mem_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la membresía',
  `mem_nombre` varchar(50) NOT NULL COMMENT 'nombre de la membresía',
  `mem_precio` decimal(10,2) NOT NULL COMMENT 'precio de la membresía',
  `mem_duracion` int(11) NOT NULL COMMENT 'duración de la membresía en días',
  PRIMARY KEY (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pagos` (
  `pago_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id del pago',
  `cliente_id` int(11) NOT NULL COMMENT 'id del cliente',
  `mem_id` int(11) NOT NULL COMMENT 'id de la membresía',
  `fecha_pago` date NOT NULL COMMENT 'fecha del pago',
  `monto` decimal(10,2) NOT NULL COMMENT 'monto del pago',
  PRIMARY KEY (`pago_id`),
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`con_id`),
  FOREIGN KEY (`mem_id`) REFERENCES `membresias`(`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `horarios` (
  `horario_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id del horario',
  `entrenador_id` int(11) NOT NULL COMMENT 'id del entrenador',
  `actividad_id` int(11) NOT NULL COMMENT 'id de la actividad',
  `dia_semana` varchar(10) NOT NULL COMMENT 'día de la semana',
  `hora_inicio` time NOT NULL COMMENT 'hora de inicio',
  `hora_fin` time NOT NULL COMMENT 'hora de fin',
  PRIMARY KEY (`horario_id`),
  FOREIGN KEY (`entrenador_id`) REFERENCES `entrenadores`(`ent_id`),
  FOREIGN KEY (`actividad_id`) REFERENCES `actividades`(`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `log_entrenamientos` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `entrenamiento_id` int(11) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `fecha_accion` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  FOREIGN KEY (`entrenamiento_id`) REFERENCES `entrenamientos`(`entrenamiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Procedimiento almacenado para llenar entrenamientos
DELIMITER $$
CREATE PROCEDURE `agregar_entrenamiento` (
    IN p_cliente_id INT,
    IN p_entrenador_id INT,
    IN p_actividad_id INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO `entrenamientos` (`cliente_id`, `entrenador_id`, `actividad_id`, `fecha`)
    VALUES (p_cliente_id, p_entrenador_id, p_actividad_id, p_fecha);
END $$
DELIMITER ;

-- Vista para los entrenamientos
CREATE VIEW `vista_resumen_entrenamientos` AS
SELECT 
    e.entrenamiento_id,
    c.con_nombre AS cliente,
    t.ent_nombre AS entrenador,
    a.act_nombre AS actividad,
    e.fecha
FROM 
    entrenamientos e
JOIN 
    clientes c ON e.cliente_id = c.con_id
JOIN 
    entrenadores t ON e.entrenador_id = t.ent_id
JOIN 
    actividades a ON e.actividad_id = a.act_id;

-- Vista del historial de pagos por cliente
CREATE VIEW `vista_historial_pagos` AS
SELECT 
    p.pago_id,
    c.con_nombre AS cliente,
    m.mem_nombre AS membresia,
    p.fecha_pago,
    p.monto
FROM 
    pagos p
JOIN 
    clientes c ON p.cliente_id = c.con_id
JOIN 
    membresias m ON p.mem_id = m.mem_id;

-- Vista de disponibilidad de entrenadores
CREATE VIEW `vista_disponibilidad_entrenadores` AS
SELECT 
    h.horario_id,
    t.ent_nombre AS entrenador,
    a.act_nombre AS actividad,
    h.dia_semana,
    h.hora_inicio,
    h.hora_fin
FROM 
    horarios h
JOIN 
    entrenadores t ON h.entrenador_id = t.ent_id
JOIN 
    actividades a ON h.actividad_id = a.act_id;

-- Vista del detalle de actividades con entrenadores
CREATE VIEW `vista_detalle_actividades` AS
SELECT 
    a.act_id,
    a.act_nombre,
    a.act_duracion,
    e.ent_nombre AS entrenador
FROM 
    actividades a
JOIN 
    entrenadores e ON a.act_id = e.ent_id;

-- Trigger para mantener el log de entrenamientos
DELIMITER $$
CREATE TRIGGER `after_insert_entrenamiento`
AFTER INSERT ON `entrenamientos`
FOR EACH ROW
BEGIN
    INSERT INTO `log_entrenamientos` (`entrenamiento_id`, `accion`, `fecha_accion`)
    VALUES (NEW.entrenamiento_id, 'INSERT', NOW());
END $$
DELIMITER ;

COMMIT;

-- Procedimiento almacenado para reportes de pagos de clientes
DELIMITER $$
CREATE PROCEDURE `reporte_historial_pagos` (IN p_cliente_id INT)
BEGIN
    SELECT 
        p.pago_id,
        c.con_nombre AS cliente,
        m.mem_nombre AS membresia,
        p.fecha_pago,
        p.monto
    FROM 
        pagos p
    JOIN 
        clientes c ON p.cliente_id = c.con_id
    JOIN 
        membresias m ON p.mem_id = m.mem_id
    WHERE 
        c.con_id = p_cliente_id;
END $$
DELIMITER ;

-- Insertar datos en las tablas

-- Insertar datos en la tabla 'clientes'
INSERT INTO `clientes` (`con_id`, `con_nombre`, `con_genero`, `con_edad`, `con_altura`, `con_peso`, `con_estadoFisico`, `con_objetivoEntrenamiento`, `con_disponibilidadEntrenar`) VALUES
(1, 'Yaxel Morales', 'male', 19, 170, 68, 'sedentary', 'lose_weight', 'morning'),
(2, 'Heidy', 'female', 28, 169, 74, 'sedentary', 'lose_weight', 'all_day'),
(3, 'Camilo', 'male', 22, 173, 91, 'sedentary', 'lose_weight', 'night');

-- Insertar datos en la tabla 'entrenadores'
INSERT INTO `entrenadores` (`ent_id`, `ent_nombre`, `ent_genero`, `ent_especialidad`) VALUES
(1, 'Carlos Gómez', 'male', 'Cardio'),
(2, 'Ana López', 'female', 'Strength'),
(3, 'Juan Pérez', 'male', 'Flexibility');

-- Insertar datos en la tabla 'actividades'
INSERT INTO `actividades` (`act_id`, `act_nombre`, `act_duracion`) VALUES
(1, 'Spinning', 60),
(2, 'Yoga', 45),
(3, 'HIIT', 30);

-- Insertar datos en la tabla 'entrenamientos'
CALL agregar_entrenamiento(1, 1, 1, '2024-05-01');
CALL agregar_entrenamiento(2, 2, 2, '2024-05-02');
CALL agregar_entrenamiento(3, 3, 3, '2024-05-03');
CALL agregar_entrenamiento(1, 2, 1, '2024-05-04');
CALL agregar_entrenamiento(2, 1, 3, '2024-05-05');
CALL agregar_entrenamiento(3, 2, 2, '2024-05-06');
CALL agregar_entrenamiento(1, 3, 3, '2024-05-07');

-- Insertar datos en la tabla 'membresias'
INSERT INTO `membresias` (`mem_id`, `mem_nombre`, `mem_precio`, `mem_duracion`) VALUES
(1, 'Mensual', 90000.00, 30),
(2, 'Trimestral', 250000.00, 90),
(3, 'Anual', 780000.00, 365);

-- Insertar datos en la tabla 'pagos'
INSERT INTO `pagos` (`pago_id`, `cliente_id`, `mem_id`, `fecha_pago`, `monto`) VALUES
(1, 1, 1, '2024-01-01', 90000.00),
(2, 2, 2, '2024-02-01', 250000.00),
(3, 3, 3, '2024-03-01', 780000.00);

-- Insertar datos en la tabla 'horarios'
INSERT INTO `horarios` (`horario_id`, `entrenador_id`, `actividad_id`, `dia_semana`, `hora_inicio`, `hora_fin`) VALUES
(1, 1, 1, 'Lunes', '08:00:00', '09:00:00'),
(2, 2, 2, 'Martes', '10:00:00', '10:45:00'),
(3, 3, 3, 'Miércoles', '18:00:00', '18:30:00');

-- Insertar datos en la tabla 'log_entrenamientos'
INSERT INTO `log_entrenamientos` (`entrenamiento_id`, `accion`, `fecha_accion`) VALUES
(1, 'INSERT', '2024-05-01 10:00:00'),
(2, 'INSERT', '2024-05-02 11:00:00'),
(3, 'INSERT', '2024-05-03 12:00:00'),
(4, 'INSERT', '2024-05-04 13:00:00'),
(5, 'INSERT', '2024-05-05 14:00:00'),
(6, 'INSERT', '2024-05-06 15:00:00'),
(7, 'INSERT', '2024-05-07 16:00:00');








