-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2024 a las 01:54:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ambusos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambulancias`
--

CREATE TABLE `ambulancias` (
  `id` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `disponibilidad` enum('Disponible','En servicio','En mantenimiento') NOT NULL DEFAULT 'Disponible',
  `conductor_id` int(11) DEFAULT NULL,
  `equipo_trabajo` int(11) DEFAULT NULL,
  `plan` enum('Básico 1','Básico 2','Básico 3','Avanzado 1','Avanzado 2','Avanzado 3','Especializado 1','Especializado 2','Especializado 3') DEFAULT NULL,
  `categoria_ambu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ambulancias`
--

INSERT INTO `ambulancias` (`id`, `placa`, `disponibilidad`, `conductor_id`, `equipo_trabajo`, `plan`, `categoria_ambu`) VALUES
(1, 'B533c', 'En mantenimiento', NULL, NULL, NULL, 3),
(2, 'DEF-111', 'En servicio', 25, 1, 'Especializado 1', 3),
(3, 'GHI-222', 'Disponible', 3, 17, 'Básico 2', 1),
(4, 'JKL-333', 'En servicio', 4, 7, 'Básico 3', 2),
(5, 'MNO-444', 'En servicio', 15, 6, 'Avanzado 3', 2),
(6, 'PQR-555', 'En servicio', 19, 5, 'Especializado 1', 1),
(7, 'STU-666', 'En servicio', 21, 4, 'Especializado 1', 3),
(8, 'VWX-777', 'En servicio', 8, 2, 'Especializado 1', 3),
(9, 'YZA-888', 'Disponible', 22, 2, 'Especializado 2', 4),
(10, 'BCD-999', 'En servicio', 10, 8, 'Avanzado 3', 1),
(11, 'EFG-000', 'Disponible', 11, 20, 'Avanzado 1', 2),
(12, 'HIJ-111', 'En servicio', 12, 19, 'Avanzado 2', 3),
(13, 'KLM-222', 'Disponible', 13, 12, 'Especializado 3', 2),
(14, 'NOP-333', 'En servicio', 14, 3, 'Especializado 3', 1),
(15, 'QRS-444', 'Disponible', 15, 20, 'Avanzado 3', 2),
(16, 'TUV-555', 'En servicio', 16, 6, 'Avanzado 1', 3),
(17, 'WXY-666', 'En mantenimiento', NULL, NULL, NULL, 2),
(18, 'ZAB-777', 'En servicio', 18, 7, 'Avanzado 3', 1),
(19, 'CDE-888', 'En mantenimiento', NULL, NULL, NULL, 2),
(20, 'FGH-999', 'En mantenimiento', NULL, NULL, NULL, NULL),
(26, 'ABC-1556', 'En mantenimiento', NULL, NULL, NULL, 2),
(27, 'ABC-1236', 'En mantenimiento', NULL, NULL, NULL, 4),
(29, 'B53388', 'En servicio', 23, 15, 'Especializado 2', 2),
(30, 'ABC-1898', 'En mantenimiento', NULL, NULL, NULL, 2),
(31, 'B535p', 'En mantenimiento', NULL, NULL, NULL, 1),
(32, '123ABC', 'En mantenimiento', NULL, NULL, NULL, 4),
(34, '123ABk', 'En mantenimiento', NULL, NULL, NULL, 3),
(36, '123App', 'En mantenimiento', 1, 19, '', 1),
(37, '666BBB', 'En mantenimiento', NULL, NULL, NULL, 3),
(38, '666B88', 'En mantenimiento', NULL, NULL, NULL, 3),
(39, '666B99', 'En mantenimiento', NULL, NULL, NULL, 4),
(40, 'ABC-1666', 'En servicio', 5, 2, 'Básico 3', 2),
(42, 'B6655j', 'En mantenimiento', NULL, NULL, NULL, NULL),
(43, 'ABC-888', 'En mantenimiento', NULL, NULL, NULL, 4),
(44, 'aei-452', 'En mantenimiento', NULL, NULL, NULL, 4),
(45, 'ABC-999', 'En mantenimiento', NULL, NULL, NULL, NULL),
(46, 'xdd 777', 'En servicio', 17, 5, 'Avanzado 1', 1),
(47, 'B777o', 'En servicio', 5, 3, 'Básico 3', 3),
(48, 'B66pp', 'En mantenimiento', NULL, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_ambulancia`
--

CREATE TABLE `categorias_ambulancia` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias_ambulancia`
--

INSERT INTO `categorias_ambulancia` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Soporte vital básico'),
(2, 'Soporte vital avanzado'),
(3, 'Transporte asistencial'),
(4, 'Ambulancia especializada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_trabajo`
--

CREATE TABLE `equipo_trabajo` (
  `id_equipo` int(11) NOT NULL,
  `equipo_de_trabajo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipo_trabajo`
--

INSERT INTO `equipo_trabajo` (`id_equipo`, `equipo_de_trabajo`) VALUES
(1, 'Equipo_basico_1'),
(2, 'Equipo_basico_2'),
(3, 'Equipo_basico_3'),
(4, 'Equipo_basico_4'),
(5, 'Equipo_basico_5'),
(6, 'Equipo_avanzado_1'),
(7, 'Equipo_avanzado_2'),
(8, 'Equipo_avanzado_3'),
(9, 'Equipo_avanzado_4'),
(10, 'Equipo_avanzado_5'),
(11, 'Equipo_especializado_1'),
(12, 'Equipo_especializado_2'),
(13, 'Equipo_especializado_3'),
(14, 'Equipo_especializado_4'),
(15, 'Equipo_especializado_5'),
(16, 'Equipo_asistencial_1'),
(17, 'Equipo_asistencial_2'),
(18, 'Equipo_asistencial_3'),
(19, 'Equipo_asistencial_4'),
(20, 'Equipo_asistencial_5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario_ambulancias`
--

CREATE TABLE `formulario_ambulancias` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `ambulancia_id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `personal_responsable_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formulario_ambulancias`
--

INSERT INTO `formulario_ambulancias` (`id`, `fecha`, `ambulancia_id`, `paciente_id`, `hospital_id`, `personal_responsable_id`) VALUES
(1, '2024-01-01 00:00:00', 1, 1, 1, 1),
(2, '2024-01-02 00:00:00', 2, 2, 2, 2),
(3, '2024-01-03 00:00:00', 3, 3, 3, 3),
(4, '2024-01-04 00:00:00', 4, 4, 4, 4),
(5, '2024-01-05 00:00:00', 5, 5, 5, 5),
(6, '2024-01-06 00:00:00', 6, 6, 6, 6),
(7, '2024-01-07 00:00:00', 7, 7, 7, 7),
(8, '2024-01-08 00:00:00', 8, 8, 8, 8),
(9, '2024-01-09 00:00:00', 9, 9, 9, 9),
(10, '2024-01-10 00:00:00', 10, 10, 10, 10),
(11, '2024-01-11 00:00:00', 1, 11, 11, 11),
(12, '2024-01-12 00:00:00', 2, 12, 12, 12),
(13, '2024-01-13 00:00:00', 3, 13, 13, 13),
(14, '2024-01-14 00:00:00', 4, 14, 14, 14),
(15, '2024-01-15 00:00:00', 5, 15, 15, 15),
(16, '2024-01-16 00:00:00', 6, 16, 16, 16),
(17, '2024-01-17 00:00:00', 7, 17, 17, 17),
(18, '2024-01-18 00:00:00', 8, 18, 18, 18),
(19, '2024-01-19 00:00:00', 9, 19, 19, 19),
(20, '2024-01-20 00:00:00', 10, 20, 20, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_ambulancia`
--

CREATE TABLE `historial_ambulancia` (
  `id_historial` int(11) NOT NULL,
  `ambulancia_asignada` int(11) NOT NULL,
  `tiempo` time NOT NULL,
  `nombre_ubicacion` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `punto_i` varchar(30) NOT NULL,
  `punto_f` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_ambulancia`
--

INSERT INTO `historial_ambulancia` (`id_historial`, `ambulancia_asignada`, `tiempo`, `nombre_ubicacion`, `direccion`, `punto_i`, `punto_f`) VALUES
(21, 1, '08:30:00', 'Chapinero', 'Cra 13 # 58-70', 'Calle 45 # 6-30', 'Carrera 15 # 63-40'),
(22, 2, '09:00:00', 'Usaquén', 'Cra 7 # 113-50', 'Calle 119 # 7-10', 'Calle 114 # 7-25'),
(23, 3, '10:15:00', 'La Candelaria', 'Cra 8 # 10-17', 'Carrera 7 # 12-23', 'Carrera 6 # 14-39'),
(24, 4, '11:00:00', 'Suba', 'Av. Suba # 112-23', 'Calle 98 # 50-35', 'Calle 100 # 56-20'),
(25, 5, '12:30:00', 'Engativá', 'Calle 80 # 72-50', 'Calle 72 # 80-50', 'Carrera 76 # 70-90'),
(26, 6, '13:45:00', 'Barrios Unidos', 'Calle 63 # 23-24', 'Calle 64 # 19-45', 'Calle 60 # 20-25'),
(27, 7, '14:15:00', 'Tunjuelito', 'Av. Villavicencio # 41-75', 'Calle 42 # 75-90', 'Carrera 47 # 73-25'),
(28, 8, '15:00:00', 'Bosa', 'Calle 59 # 61-90', 'Carrera 80 # 60-70', 'Calle 50 # 62-35'),
(29, 9, '16:30:00', 'Kennedy', 'Av. Ciudad de Cali # 40-32', 'Calle 43 # 34-23', 'Carrera 67 # 41-55'),
(30, 10, '17:00:00', 'Santafé', 'Calle 25 # 4-40', 'Carrera 3 # 5-15', 'Calle 22 # 6-20'),
(31, 11, '08:45:00', 'La Macarena', 'Cra 6 # 27-50', 'Carrera 7 # 25-10', 'Calle 28 # 8-15'),
(32, 12, '09:30:00', 'Rosales', 'Cra 9 # 75-85', 'Calle 75 # 9-20', 'Carrera 7 # 73-50'),
(33, 13, '10:00:00', 'Niza Norte', 'Calle 127 # 20-50', 'Calle 126 # 21-40', 'Carrera 19 # 127-65'),
(34, 14, '11:15:00', 'Chapinero Alto', 'Cra 7 # 60-90', 'Calle 63 # 6-10', 'Calle 59 # 8-30'),
(35, 15, '12:00:00', 'Monaco', 'Calle 147 # 71-60', 'Carrera 9 # 150-25', 'Calle 148 # 70-35'),
(36, 16, '13:30:00', 'San Cristóbal', 'Calle 15 # 13-10', 'Carrera 14 # 15-25', 'Calle 18 # 12-30'),
(37, 17, '14:45:00', 'Teusaquillo', 'Calle 26 # 22-30', 'Carrera 20 # 25-50', 'Calle 24 # 22-35'),
(38, 18, '15:30:00', 'Los Mártires', 'Calle 12 # 15-20', 'Carrera 10 # 12-35', 'Calle 11 # 13-45'),
(39, 19, '16:00:00', 'La Raza', 'Av. Caracas # 45-67', 'Calle 51 # 44-35', 'Carrera 43 # 46-20'),
(40, 20, '17:15:00', 'San Fernando', 'Calle 7 # 9-40', 'Carrera 10 # 7-25', 'Calle 9 # 10-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospitales`
--

CREATE TABLE `hospitales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `capacidad_atencion` int(11) DEFAULT NULL,
  `categoria` enum('Hospital General Básico','Hospital Regional','Hospital Universitario','Hospital de Investigación Avanzada','Centro de Trauma y Emergencias') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hospitales`
--

INSERT INTO `hospitales` (`id`, `nombre`, `direccion`, `capacidad_atencion`, `categoria`) VALUES
(1, 'Hospital Central', 'Av. Principal 123', 200, 'Hospital Regional'),
(2, 'Hospital del Norte', 'Calle Secundaria 456', 150, 'Hospital General Básico'),
(3, 'Hospital Sur', 'Avenida de la Salud 789', 100, 'Hospital General Básico'),
(4, 'Hospital Este', 'Calle de la Esperanza 101', 250, 'Hospital Universitario'),
(5, 'Hospital Oeste', 'Calle del Progreso 202', 180, 'Hospital General Básico'),
(6, 'Hospital de la Costa', 'Avenida del Mar 678', 90, 'Hospital de Investigación Avanzada'),
(7, 'Centro de Salud del Norte', 'Calle Norte 901', 85, 'Hospital General Básico'),
(8, 'Hospital del Futuro', 'Avenida Innovación 234', 60, 'Hospital de Investigación Avanzada'),
(9, 'Clínica San Miguel', 'Calle de la Salud 567', 30, 'Hospital General Básico'),
(10, 'Hospital Central', 'Av. Central 890', 110, 'Hospital General Básico'),
(11, 'Clínica del Sur', 'Calle del Sur 123', 70, 'Centro de Trauma y Emergencias'),
(12, 'Centro Médico del Este', 'Avenida Este 456', 95, 'Hospital General Básico'),
(13, 'Hospital de la Ciudad', 'Calle de la Ciudad 789', 80, 'Hospital General Básico'),
(14, 'Clínica Nueva Esperanza', 'Avenida Esperanza 012', 50, 'Centro de Trauma y Emergencias'),
(15, 'Hospital San Juan', 'Calle de San Juan 345', 115, 'Hospital General Básico'),
(16, 'Clínica San Pedro', 'Avenida San Pedro 678', 45, 'Hospital General Básico'),
(17, 'Centro de Atención Médica', 'Calle Médica 901', 100, 'Centro de Trauma y Emergencias'),
(18, 'Hospital del Centro', 'Av. del Centro 234', 130, 'Hospital General Básico'),
(19, 'Clínica de la Familia', 'Calle Familiar 567', 55, 'Hospital General Básico'),
(20, 'Hospital Nacional', 'Calle Nacional 890', 105, 'Centro de Trauma y Emergencias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `ambulancia_id` int(11) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo',
  `genero` enum('Masculino','Femenino','Otro') NOT NULL,
  `seguro_medico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellido`, `numero_documento`, `hospital_id`, `ambulancia_id`, `estado`, `genero`, `seguro_medico`) VALUES
(1, 'María', 'García', '67890123', 1, 1, 'Activo', 'Femenino', 'Seguro A'),
(2, 'Luis', 'Fernández', '78901234', 2, NULL, 'Activo', 'Masculino', 'Seguro B'),
(3, 'Claudia', 'Ramírez', '89012345', 3, NULL, 'Activo', 'Femenino', 'Seguro C'),
(4, 'Andrés', 'Cruz', '90123456', 4, NULL, 'Inactivo', 'Masculino', 'Seguro D'),
(5, 'Gabriela', 'Sánchez', '01234567', 5, NULL, 'Activo', 'Femenino', 'Seguro E'),
(6, 'Jorge', 'García', '67550123', 6, 6, 'Activo', 'Femenino', 'EPS Salud'),
(7, 'Sofía', 'Cano', '78661234', 7, 7, 'Activo', 'Masculino', 'Famisanar'),
(8, 'Pedro', 'Álvarez', '89014445', 8, 8, 'Activo', 'Otro', 'Medimás'),
(9, 'Valeria', 'Torres', '90223456', 9, 9, 'Activo', 'Otro', 'Savia Salud'),
(10, 'Andrés', 'Suárez', '03334567', 10, 10, 'Activo', 'Masculino', 'Saludcoop'),
(11, 'Gabriela', 'Mora', '11223344', 11, 11, 'Activo', 'Femenino', 'Nueva EPS'),
(12, 'Felipe', 'Muñoz', '22334455', 12, 12, 'Activo', 'Femenino', 'Sanitas'),
(13, 'Isabel', 'Córdoba', '33445566', 13, 13, 'Activo', 'Otro', 'EPS Sanitas'),
(14, 'Santiago', 'Vargas', '44556677', 14, 14, 'Activo', 'Femenino', 'Salud Total'),
(15, 'Catalina', 'Ospina', '55667788', 15, 15, 'Activo', 'Masculino', 'Coomeva'),
(16, 'Felipe', 'Rodríguez', '66778899', 16, 16, 'Activo', 'Masculino', 'Sura'),
(17, 'Alejandra', 'Castro', '77889900', 17, 17, 'Activo', 'Femenino', 'Compensar'),
(18, 'Sebastián', 'Paredes', '88990011', 18, 18, 'Activo', 'Femenino', 'EPS Salud'),
(19, 'Diana', 'Jiménez', '99001122', 19, 19, 'Activo', 'Femenino', 'Famisanar'),
(20, 'Daniel', 'Morales', '00112233', 20, 20, 'Activo', 'Femenino', 'Medimás');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `equipo_trabajo` int(11) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `nombre`, `apellido`, `numero_documento`, `id_rol`, `equipo_trabajo`, `estado`) VALUES
(1, 'Juan', 'Pérez', '12345678', 1, 20, 'Activo'),
(2, 'Ana', 'Gómez', '23456789', 2, 13, 'Activo'),
(3, 'Carlos', 'López', '34567890', 3, 13, 'Activo'),
(4, 'Laura', 'Martínez', '45678901', 4, 12, 'Activo'),
(5, 'Pedro', 'Rodríguez', '56789012', 1, 1, 'Activo'),
(6, 'Sofía', 'Morales', '67890123', 2, 7, 'Activo'),
(7, 'Diego', 'Jiménez', '78901234', 3, 9, 'Activo'),
(8, 'Valeria', 'Hernández', '89012345', 4, 4, 'Activo'),
(9, 'Miguel', 'Santos', '90123456', 1, 6, 'Activo'),
(10, 'Lucía', 'Castro', '01234567', 2, 5, 'Activo'),
(11, 'Andrés', 'Ortiz', '12345679', 3, 14, 'Activo'),
(12, 'Camila', 'Reyes', '23456780', 4, 14, 'Activo'),
(13, 'Tomás', 'García', '34567891', 1, 20, 'Activo'),
(14, 'Natalia', 'Ruiz', '45678902', 2, 6, 'Activo'),
(15, 'Felipe', 'Moreno', '56789023', 3, 4, 'Activo'),
(16, 'María', 'Álvarez', '67890134', 4, 9, 'Activo'),
(17, 'Mateo', 'Vega', '78901245', 1, 14, 'Activo'),
(18, 'Isabella', 'García', '89012356', 2, 14, 'Activo'),
(19, 'Juan Pablo', 'Martínez', '90123467', 3, 17, 'Activo'),
(20, 'Marta', 'Gómez', '01234578', 4, 14, 'Activo'),
(21, 'Diego', 'Guerra', '1053245627', 1, 19, 'Activo'),
(22, 'Manolo', 'Hernandez', '2134657235', 1, 13, 'Activo'),
(23, 'Steve', 'Jobs', '5324567892', 1, 5, 'Activo'),
(24, 'Sergio', 'Rueda', '4532168234', 1, 4, 'Activo'),
(25, 'Artyom', 'Alekseyevich', '1234567852', 1, 6, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Conductor'),
(2, 'Enfermera'),
(3, 'Paramédico'),
(4, 'Médico'),
(5, 'Auxiliar'),
(6, 'Usuario'),
(7, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `contraseña` varbinary(255) NOT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `correo_electronico`, `contraseña`, `id_rol`) VALUES
(1, 'juanperez', 'juanperez@gmail.com', 0x67fba514477af4d09812573118a2bc3e, 7),
(2, 'mariagonzalez', 'mariagonzalez@gmail.com', 0x39100a3ad143c2ec6c2b72a479b880a6, 7),
(3, 'pedrolopez', 'pedrolopez@gmail.com', 0x333c11a70d36fa1ff0245c1498de9a8f, 6),
(4, 'luisfernandez', 'luisfernandez@gmail.com', 0x0ab1cc5e421e572209d179d44a810c03, 6),
(5, 'andreaazul', 'andreaazul@gmail.com', 0x9d77af53001b3fc4071d7d0c0452ce6e, 6),
(6, 'carlaortiz', 'carlaortiz@gmail.com', 0x23297abf88e764f9f6a553eb51e81248, 6),
(7, 'javierromero', 'javierromero@gmail.com', 0xc03bdda1708ab17cc09567dbbf1f9e96, 6),
(8, 'luciasanchez', 'luciasanchez@gmail.com', 0xdd2798692da122e827b564a168d1ba3b, 6),
(9, 'sergiogarcia', 'sergiogarcia@gmail.com', 0x33bc3e81994272ab60ce4e641e2af93c, 6),
(10, 'elenaortega', 'elenaortega@gmail.com', 0x35e14aee59ea8c167e7bdb1d58081e93, 6),
(11, 'martinmolina', 'martinmolina@gmail.com', 0x0ec5994166de89899ed67f8fa1bc89b1, 6),
(12, 'veronicamora', 'veronicamora@gmail.com', 0xf3812d37e0d882a65b02b2e3a29b8e39, 6),
(13, 'diegoalvarez', 'diegoalvarez@gmail.com', 0xc2d7ccbf4f5585b5ba11e7e51a6e0fc6, 6),
(14, 'silviaescalante', 'silviaescalante@gmail.com', 0x41f9547bfd99687598289bb3ae5d2e80, 6),
(15, 'robertohernandez', 'robertohernandez@gmail.com', 0xa04c3b2d359f1983d383a38acd84300a, 6),
(16, 'patriciagonzalez', 'patriciagonzalez@gmail.com', 0x29492a9df6a43279756c1efff5e8198f, 6),
(17, 'arturogomez', 'arturogomez@gmail.com', 0xd58bf2630d7940b112dc241b9858a244, 6),
(18, 'nataliarodriguez', 'nataliarodriguez@gmail.com', 0x0eff667fbae3bd65eae1fcf418c8a3e2, 6),
(19, 'oscarjimenez', 'oscarjimenez@gmail.com', 0x3c242c8567df4530e739cf0084327efd, 6),
(20, 'veronicamartinez', 'veronicamartinez@gmail.com', 0x25d58d513225ed8e5f68e6b5b57416bc, 6),
(21, 'andresmoreno', 'andresmoreno@gmail.com', 0xf3d5622b01cb973df3ea4fa7b761b2c2, 6),
(22, 'mariarosario', 'mariarosario@gmail.com', 0x7274be80083df006492abff69d2b4f67, 6),
(23, 'jorgecastro', 'jorgecastro@gmail.com', 0xb7d24c7c1efb4c2c35c9608eea5a4022, 6),
(25, 'Dagg113', 'elpajas646@gmail.com', 0xe861ca697ba164613e3218cddcf82f5c, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambulancias`
--
ALTER TABLE `ambulancias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `conductor_id` (`conductor_id`),
  ADD KEY `fk_equipo_trabajo` (`equipo_trabajo`),
  ADD KEY `fk_categoria` (`categoria_ambu`);

--
-- Indices de la tabla `categorias_ambulancia`
--
ALTER TABLE `categorias_ambulancia`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `equipo_trabajo`
--
ALTER TABLE `equipo_trabajo`
  ADD PRIMARY KEY (`id_equipo`);

--
-- Indices de la tabla `formulario_ambulancias`
--
ALTER TABLE `formulario_ambulancias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ambulancia_id` (`ambulancia_id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `personal_responsable_id` (`personal_responsable_id`);

--
-- Indices de la tabla `historial_ambulancia`
--
ALTER TABLE `historial_ambulancia`
  ADD PRIMARY KEY (`id_historial`);

--
-- Indices de la tabla `hospitales`
--
ALTER TABLE `hospitales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_documento` (`numero_documento`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `ambulancia_id` (`ambulancia_id`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_documento` (`numero_documento`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `equipo_trabajo` (`equipo_trabajo`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambulancias`
--
ALTER TABLE `ambulancias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `categorias_ambulancia`
--
ALTER TABLE `categorias_ambulancia`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `equipo_trabajo`
--
ALTER TABLE `equipo_trabajo`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `formulario_ambulancias`
--
ALTER TABLE `formulario_ambulancias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `historial_ambulancia`
--
ALTER TABLE `historial_ambulancia`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `hospitales`
--
ALTER TABLE `hospitales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ambulancias`
--
ALTER TABLE `ambulancias`
  ADD CONSTRAINT `ambulancias_ibfk_1` FOREIGN KEY (`conductor_id`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria_ambu`) REFERENCES `categorias_ambulancia` (`id_categoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipo_trabajo` FOREIGN KEY (`equipo_trabajo`) REFERENCES `equipo_trabajo` (`id_equipo`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `formulario_ambulancias`
--
ALTER TABLE `formulario_ambulancias`
  ADD CONSTRAINT `formulario_ambulancias_ibfk_1` FOREIGN KEY (`ambulancia_id`) REFERENCES `ambulancias` (`id`),
  ADD CONSTRAINT `formulario_ambulancias_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `formulario_ambulancias_ibfk_3` FOREIGN KEY (`hospital_id`) REFERENCES `hospitales` (`id`),
  ADD CONSTRAINT `formulario_ambulancias_ibfk_4` FOREIGN KEY (`personal_responsable_id`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitales` (`id`),
  ADD CONSTRAINT `pacientes_ibfk_2` FOREIGN KEY (`ambulancia_id`) REFERENCES `ambulancias` (`id`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `equipo_trabajo` FOREIGN KEY (`equipo_trabajo`) REFERENCES `equipo_trabajo` (`id_equipo`),
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
