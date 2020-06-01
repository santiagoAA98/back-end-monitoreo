-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2020 a las 19:22:47
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
(456, 'javier', 'quintero', 38874, 'javier@gmail.com', 'javier123');

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
  `cedula_entrenador` int(20) NOT NULL,
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `atleta`
--

INSERT INTO `atleta` (`cedula_atleta`, `nombre`, `apellidos`, `edad`, `telefono`, `correo`, `estatura`, `peso`, `talla_camisa`, `tipo_sangre`, `alergias`, `operaciones`, `lesiones_graves`, `fracturas`, `sexo`, `cedula_entrenador`, `usuario`) VALUES
(123, 'santiago', 'toro', 20, 29999, 'santiago@gmail.com', 135, 20, 16, 'o', 'ninguna', 'ninguna', 'esguince', 'tobillo', 'hombre', 789, 'santi123'),
(1234, 'mateo', 'ortega garcia', 19, 4123555, 'mateoor@htomail.com', 169, 65, 16, 'o', 'polen', 'ninguna', 'ninguna', 'cadera', 'masculino', 789, 'mateoAT'),
(12345, 'jose', 'gonzales duque', 25, 2673457, 'joseGD@mail.com', 175, 80, 18, 'A', 'ninguna', 'ninguna', 'ninguna', 'ninguna', 'masculino', 9983, 'joseGD');

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
(1, 'carreras, saltos', 2020, '100 metros vallas, salto de altura', 123),
(3, 'pruebas combinadas', 2019, 'declatón 100m, declatón 200m', 12345),
(6, 'lanzamiento', 2016, 'lanzamiento de peso', 1234);

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
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entrenador`
--

INSERT INTO `entrenador` (`cedula_entrenador`, `nombre`, `apellidos`, `telefono`, `correo`, `usuario`) VALUES
(789, 'carlos', 'molina', 29999, 'carlos@hotmail.com', 'carlos123'),
(9983, 'eduardo', 'aguirre hernandez', 4781626, 'edua@hotmail.com', 'eduardoEN');

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
(1, 'atanasio girardot', '16:00', 'jueves, sabados', 789),
(3, 'Politécnico Jaime Isaza Cadavid', '18:00', 'lunes,miércoles,viernes', 9983);

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
(1, 'tulio ospina', 'material de entrenamiento', '2020-04-07', '13:00', 789),
(2, 'atanasio girardot', 'ninguno', '2020-02-13', '12:00', 789),
(3, 'atanasio girardot', 'ninguno', '2020-05-14', '17:00', 9983);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mejor_resultado`
--

CREATE TABLE `mejor_resultado` (
  `cedula_atleta` int(20) NOT NULL,
  `id_evento` int(20) NOT NULL,
  `marca` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mejor_resultado`
--

INSERT INTO `mejor_resultado` (`cedula_atleta`, `id_evento`, `marca`) VALUES
(123, 1, 9.58),
(1234, 1, 10.11),
(123, 2, 13.56),
(1234, 2, 17.23),
(12345, 3, 10.45);

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
('carlos123', '123', 'entrenador'),
('eduardoEN', '123', 'entrenador'),
('javier123', '123', 'administrador'),
('joseGD', '123', 'atleta'),
('mateoAT', '123', 'atleta'),
('santi123', '123', 'atleta');

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
  MODIFY `id_dato_deportivo` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  MODIFY `id_entrenamiento` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
