-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2020 a las 18:25:08
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `monitoreo-atleta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `cedula` int(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` int(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`cedula`, `nombre`, `apellidos`, `telefono`, `correo`, `usuario`) VALUES
(123, 'alejandro', 'naranjo', 4123555, 'alejoNa@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atleta`
--

CREATE TABLE `atleta` (
  `cedula_atleta` int(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `edad` int(10) NOT NULL,
  `telefono` int(15) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `estatura` int(20) NOT NULL,
  `peso` int(20) NOT NULL,
  `talla_camisa` int(20) NOT NULL,
  `tipo_sangre` varchar(10) NOT NULL,
  `alergias` varchar(500) NOT NULL,
  `operaciones` varchar(500) NOT NULL,
  `lesiones_graves` varchar(500) NOT NULL,
  `fracturas` varchar(500) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `estado` varchar(12) NOT NULL,
  `cedula_entrenador` int(20) DEFAULT NULL,
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `atleta`
--

INSERT INTO `atleta` (`cedula_atleta`, `nombre`, `apellidos`, `edad`, `telefono`, `correo`, `estatura`, `peso`, `talla_camisa`, `tipo_sangre`, `alergias`, `operaciones`, `lesiones_graves`, `fracturas`, `sexo`, `estado`, `cedula_entrenador`, `usuario`) VALUES
(1092363442, 'carolina', 'torres quintero', 27, 4558912, 'caro55@gmail.com', 174, 62, 14, 'A-', 'ninguna', 'muñeca', 'brazo', 'muñeca', 'femenino', 'activo', 1095857553, 'caro55AT'),
(1093757552, 'estefania', 'valencia arenas', 24, 2037544, 'stefany11@hotmail.com', 167, 58, 12, 'O+', 'ninguna', 'ninguna', 'ninguna', 'ninguna', 'femenino', 'activo', 1130057882, 'estefany11'),
(1125771003, 'mario', 'bravo bustamante', 23, 2075322, 'marrioBB@gmail.com', 179, 76, 16, 'A+', 'frutos secos, trigo', 'brazo', 'ninguna', 'muñeca', 'masculino', 'activo', 1034456012, 'marioBBAT'),
(1153848575, 'angie', 'ruiz romero', 25, 2084532, 'angierrro@yahoo.com', 168, 55, 12, 'B+', 'antibióticos basados en la penicilina', 'ninguna', 'esguince', 'ninguna', 'femenino', 'activo', 1095857553, 'angi66AT'),
(1200675593, 'mariana', 'giraldo osorio', 19, 2096412, 'mariana122@hotmail.com', 174, 60, 14, 'O+', 'ninguna', 'ninguna', 'ninguna', 'pie', 'femenino', 'activo', 1034456012, 'mariana122'),
(1203384558, 'sebastian', 'moreno valencia', 20, 4038023, 'sabs23@gmail.com', 172, 65, 16, 'B+', 'ninguna', 'esguince de tobillo', 'ninguna', 'tobillo', 'masculino', 'activo', 1083744122, 'sebstiAT'),
(1206754422, 'veronica', 'castillo medina', 21, 2097234, 'vero122@gmail.com', 175, 60, 14, 'B+', 'ninguna', 'ninguna', 'ninguna', 'ninguna', 'femenino', 'activo', 1083744122, 'vero122AT'),
(1209586652, 'alejandro', 'rojas rojas', 18, 4624408, 'alejorr@htomail.com', 169, 65, 14, 'O-', 'ninguna', 'ninguna', 'ninguna', 'pie', 'masculino', 'activo', 1095857553, 'alejoAT22'),
(1233494733, 'santiago', 'castro ortiz', 23, 2074311, 'santiago123@gmail.com', 175, 70, 16, 'A+', 'ninguna', 'tobillo', 'ninguna', 'pie', 'masculino', 'activo', 1095857553, 'santi123AT'),
(1244496762, 'fabian', 'herrera restrepo', 18, 2094533, 'fabi88@gmail.com', 185, 79, 18, 'A+', 'picaduras de insectos', 'pie', 'esguince', 'ninguna', 'masculino', 'activo', 1130057882, 'fabi82133AT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dato_deportivo`
--

CREATE TABLE `dato_deportivo` (
  `id_dato_deportivo` int(20) NOT NULL,
  `especialidades` varchar(500) NOT NULL,
  `año_activo` int(10) NOT NULL,
  `pruebas` varchar(500) NOT NULL,
  `cedula_atleta` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dato_deportivo`
--

INSERT INTO `dato_deportivo` (`id_dato_deportivo`, `especialidades`, `año_activo`, `pruebas`, `cedula_atleta`) VALUES
(16, 'lanzamiento', 2014, 'peso, disco', 1092363442),
(17, 'velocidad, vallas', 2017, '100m, 400m vallas', 1093757552),
(18, 'lanzamiento, combinatorio', 2017, 'peso, jabalina, martillo, pentatlón', 1125771003),
(19, 'saltos', 2016, 'salto con altura, salto de longitud', 1153848575),
(20, 'velocidad', 2019, '400 metros', 1200675593),
(21, 'velocidad, fondo', 2018, '200m, 800m', 1203384558),
(22, 'velocidad, relevos', 2019, '400m, relevos 4x100m', 1206754422),
(23, 'fondo', 2020, '5000m, maratón', 1209586652),
(24, 'velocidad, combinatoria', 2017, '400m, decatlón', 1233494733),
(25, 'fondo', 2018, '10000m', 1244496762);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--

CREATE TABLE `entrenador` (
  `cedula_entrenador` int(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` int(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `estado` varchar(12) NOT NULL,
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entrenador`
--

INSERT INTO `entrenador` (`cedula_entrenador`, `nombre`, `apellidos`, `telefono`, `correo`, `estado`, `usuario`) VALUES
(1034456012, 'carlos', 'sánchez hernández', 4663081, 'carlossh189@gmail.com', 'activo', 'carlos200pp'),
(1083744122, 'alejandra', 'martínez muñoz', 4678890, 'alejamm@gmail.com', 'activo', 'alejaMM56'),
(1095857553, 'ronal', 'rodríguez lópez', 2035513, 'ronalrll@gmail.com', 'activo', 'ronalET'),
(1130057882, 'susana', 'martínez ramírez', 4128344, 'susan22@hotmail.com', 'activo', 'susana88eET');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamiento`
--

CREATE TABLE `entrenamiento` (
  `id_entrenamiento` int(20) NOT NULL,
  `lugar` varchar(50) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `dias` varchar(100) NOT NULL,
  `cedula_entrenador` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entrenamiento`
--

INSERT INTO `entrenamiento` (`id_entrenamiento`, `lugar`, `hora`, `dias`, `cedula_entrenador`) VALUES
(24, 'politécnico', '10:00', 'viernes, sábado, domingo', 1095857553),
(25, 'politécnico', '12:00', 'sábado, domingo', 1130057882),
(26, 'atanasio girardot', '14:00', 'sábado, domingo', 1034456012),
(29, 'politécnico', '15:00', 'viernes, sábado, domingo', 1083744122);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(20) NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `requisitos` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(20) NOT NULL,
  `cedula_entrenador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id_evento`, `lugar`, `requisitos`, `fecha`, `hora`, `cedula_entrenador`) VALUES
(32, 'politecnico', 'ninguno', '2020-02-12', '18:00', 1095857553),
(33, 'atanasio girardot', 'ninguno', '2020-02-27', '20:00', 1095857553),
(34, 'politecnico', 'ropa deportiva', '2020-02-08', '20:00', 1130057882),
(35, 'politecnico', 'ninguno', '2020-02-25', '21:00', 1130057882),
(36, 'armenia', 'ropa deportiva', '2020-02-17', '14:00', 1034456012),
(37, 'tulio ospina', 'calzado correcto', '2020-02-29', '16:00', 1034456012),
(38, 'cali', 'ropa deportiva, mayor de edad', '2020-02-12', '14:00', 1083744122),
(39, 'armenia', 'calzado correcto', '2020-02-26', '10:00', 1083744122),
(40, 'ibague', 'ropa deportiva', '2020-01-08', '10:00', 1095857553),
(41, 'tulio ospina', 'ninguno', '2020-01-21', '18:00', 1095857553),
(42, 'armenia', 'ropa deportiva', '2020-01-09', '15:00', 1130057882),
(43, 'bogota', 'ropa deportiva, mayor de edad', '2020-01-29', '12:00', 1130057882),
(44, 'cali', 'ropa deportiva, mayor de edad', '2020-01-04', '14:00', 1034456012),
(45, 'politecnico', 'ninguno', '2020-01-17', '16:00', 1034456012),
(46, 'manizales', 'correcto calzado', '2020-01-17', '11:00', 1083744122),
(47, 'politecnico', 'ninguno', '2020-01-31', '18:00', 1083744122),
(48, 'politecnico', 'ninguno', '2020-03-03', '18:00', 1095857553),
(49, 'atanasio girardot', 'correcto calzado', '2020-03-13', '15:00', 1095857553),
(50, 'cali', 'mayor de edad', '2020-03-14', '12:00', 1130057882),
(51, 'politecnico', 'ninguno', '2020-03-23', '13:00', 1130057882),
(52, 'tulio ospina', 'ninguno', '2020-03-01', '14:00', 1034456012),
(53, 'tulio ospina', 'ninguno', '2020-03-19', '11:00', 1034456012),
(54, 'manizales', 'ropa deportiva, mayor de edad', '2020-03-20', '12:00', 1083744122),
(55, 'cali', 'implementos deportivos, mayor de edad', '2020-03-31', '12:00', 1083744122),
(56, 'armenia', 'ropa deportiva', '2020-04-07', '11:00', 1095857553),
(57, 'bogota', 'implementos deportivos propios, mayor de edad', '2020-04-24', '14:00', 1095857553),
(58, 'politecnico', 'ninguno', '2020-04-16', '18:00', 1130057882),
(59, 'tulio ospina', 'ninguno', '2020-04-29', '13:00', 1130057882),
(60, 'politecnico', 'ninguno', '2020-04-10', '14:00', 1034456012),
(61, 'politecnico', 'ninguno', '2020-04-22', '16:00', 1034456012),
(62, 'atanasio girardto', 'ropa deportiva', '2020-04-01', '15:00', 1083744122),
(63, 'armenia', 'ropa deportiva', '2020-04-20', '13:00', 1083744122),
(64, 'politecnico', 'ninguno', '2020-06-01', '13:00', 1095857553),
(65, 'atanasio girardot', 'ninguno', '2020-06-10', '20:00', 1095857553),
(66, 'tulio ospina', 'ninguno', '2020-06-11', '19:00', 1130057882),
(67, 'bogota', 'implementos deportivos, mayor de edad', '2020-06-24', '15:00', 1130057882),
(68, 'armenia', 'ropa deportiva', '2020-06-05', '10:00', 1034456012),
(69, 'atanasio girardot', 'ninguno', '2020-06-21', '16:00', 1034456012),
(70, 'cali', 'implementos deportivos', '2020-06-02', '13:00', 1083744122),
(71, 'politecnico', 'ninguno', '2020-06-24', '12:00', 1083744122);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mejor_resultado`
--

CREATE TABLE `mejor_resultado` (
  `cedula_atleta` int(20) NOT NULL,
  `id_evento` int(20) NOT NULL,
  `marca` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mejor_resultado`
--

INSERT INTO `mejor_resultado` (`cedula_atleta`, `id_evento`, `marca`) VALUES
(1092363442, 32, 8.31),
(1092363442, 33, 10.59),
(1092363442, 40, 5.67),
(1092363442, 41, 5.22),
(1092363442, 48, 6.78),
(1092363442, 49, 12.45),
(1092363442, 56, 11.5),
(1092363442, 57, 9.08),
(1153848575, 32, 7.47),
(1153848575, 33, 10.51),
(1153848575, 40, 12.22),
(1153848575, 41, 10.12),
(1153848575, 48, 19.33),
(1153848575, 49, 12.1),
(1153848575, 56, 9.45),
(1153848575, 57, 9.12),
(1209586652, 32, 10.56),
(1209586652, 33, 11.2),
(1209586652, 40, 8.4),
(1209586652, 41, 10.14),
(1209586652, 48, 11.45),
(1209586652, 49, 9.56),
(1209586652, 56, 10.11),
(1209586652, 57, 12.11),
(1233494733, 32, 8.46),
(1233494733, 33, 9.44),
(1233494733, 40, 10.12),
(1233494733, 41, 11.13),
(1233494733, 48, 8.51),
(1233494733, 49, 7.3),
(1233494733, 56, 8.3),
(1233494733, 57, 7.08),
(1092363442, 64, NULL),
(1092363442, 65, NULL),
(1153848575, 64, NULL),
(1153848575, 65, NULL),
(1209586652, 64, NULL),
(1209586652, 65, NULL),
(1233494733, 64, NULL),
(1233494733, 65, NULL),
(1093757552, 34, 8.59),
(1093757552, 35, 10.12),
(1093757552, 42, 7.31),
(1093757552, 43, 8.04),
(1093757552, 50, 10.15),
(1093757552, 51, 11.32),
(1093757552, 58, 10.1),
(1093757552, 59, 9.45),
(1244496762, 34, 10.2),
(1244496762, 35, 8.23),
(1244496762, 42, 7.58),
(1244496762, 43, 12.11),
(1244496762, 50, 9.3),
(1244496762, 51, 8.24),
(1244496762, 58, 8.45),
(1244496762, 59, 9.12),
(1125771003, 36, 10.23),
(1125771003, 37, 11.04),
(1125771003, 44, 8.45),
(1125771003, 45, 8.32),
(1125771003, 52, 9.12),
(1125771003, 53, 10.14),
(1125771003, 60, 10.15),
(1125771003, 61, 9.58),
(1200675593, 36, 9.53),
(1200675593, 37, 9.22),
(1200675593, 44, 8.59),
(1200675593, 45, 9.14),
(1200675593, 52, 12.14),
(1200675593, 53, 11.32),
(1200675593, 60, 9.45),
(1200675593, 61, 9.11),
(1125771003, 68, NULL),
(1125771003, 69, NULL),
(1200675593, 68, NULL),
(1200675593, 69, NULL),
(1203384558, 38, 9.52),
(1203384558, 39, 10.14),
(1203384558, 46, 7.31),
(1203384558, 47, 8.32),
(1203384558, 54, 10.12),
(1203384558, 55, 10.14),
(1203384558, 62, 10.45),
(1203384558, 63, 9.32),
(1206754422, 38, 10.23),
(1206754422, 39, 11.45),
(1206754422, 46, 8.29),
(1206754422, 47, 9.14),
(1206754422, 54, 10.11),
(1206754422, 55, 11.32),
(1206754422, 62, 8.3),
(1206754422, 63, 8.25),
(1203384558, 70, NULL),
(1203384558, 71, NULL),
(1206754422, 70, NULL),
(1206754422, 71, NULL),
(1093757552, 66, NULL),
(1093757552, 67, NULL),
(1244496762, 66, NULL),
(1244496762, 67, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sesion`
--

INSERT INTO `sesion` (`usuario`, `clave`, `rol`) VALUES
('admin', '123', 'administrador'),
('alejaMM56', '123', 'entrenador'),
('alejoAT22', '123', 'atleta'),
('angi66AT', '123', 'atleta'),
('carlos200pp', '123', 'entrenador'),
('caro55AT', '123', 'atleta'),
('estefany11', '123', 'atleta'),
('fabi82133AT', '123', 'atleta'),
('mariana122', '123', 'atleta'),
('marioBBAT', '123', 'atleta'),
('ronalET', '123', 'entrenador'),
('santi123AT', '123', 'atleta'),
('sebstiAT', '123', 'atleta'),
('susana88eET', '123', 'entrenador'),
('vero122AT', '123', 'atleta');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `atleta`
--
ALTER TABLE `atleta`
  ADD PRIMARY KEY (`cedula_atleta`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `cedula_entrenador` (`cedula_entrenador`);

--
-- Indices de la tabla `dato_deportivo`
--
ALTER TABLE `dato_deportivo`
  ADD PRIMARY KEY (`id_dato_deportivo`),
  ADD UNIQUE KEY `cedula_atleta` (`cedula_atleta`);

--
-- Indices de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`cedula_entrenador`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD PRIMARY KEY (`id_entrenamiento`),
  ADD UNIQUE KEY `cedula_entrenador` (`cedula_entrenador`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `cedula_entrenador` (`cedula_entrenador`);

--
-- Indices de la tabla `mejor_resultado`
--
ALTER TABLE `mejor_resultado`
  ADD KEY `cedula_atleta` (`cedula_atleta`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dato_deportivo`
--
ALTER TABLE `dato_deportivo`
  MODIFY `id_dato_deportivo` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  MODIFY `id_entrenamiento` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `sesion` (`usuario`);

--
-- Filtros para la tabla `atleta`
--
ALTER TABLE `atleta`
  ADD CONSTRAINT `atleta_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `sesion` (`usuario`),
  ADD CONSTRAINT `atleta_ibfk_2` FOREIGN KEY (`cedula_entrenador`) REFERENCES `entrenador` (`cedula_entrenador`);

--
-- Filtros para la tabla `dato_deportivo`
--
ALTER TABLE `dato_deportivo`
  ADD CONSTRAINT `dato_deportivo_ibfk_1` FOREIGN KEY (`cedula_atleta`) REFERENCES `atleta` (`cedula_atleta`);

--
-- Filtros para la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD CONSTRAINT `entrenador_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `sesion` (`usuario`);

--
-- Filtros para la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD CONSTRAINT `entrenamiento_ibfk_1` FOREIGN KEY (`cedula_entrenador`) REFERENCES `entrenador` (`cedula_entrenador`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`cedula_entrenador`) REFERENCES `entrenador` (`cedula_entrenador`);

--
-- Filtros para la tabla `mejor_resultado`
--
ALTER TABLE `mejor_resultado`
  ADD CONSTRAINT `mejor_resultado_ibfk_1` FOREIGN KEY (`cedula_atleta`) REFERENCES `atleta` (`cedula_atleta`),
  ADD CONSTRAINT `mejor_resultado_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
