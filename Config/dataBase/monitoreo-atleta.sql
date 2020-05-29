-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2020 a las 02:41:40
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
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `atleta`
--

INSERT INTO `atleta` (`cedula_atleta`, `nombre`, `apellidos`, `edad`, `telefono`, `correo`, `estatura`, `peso`, `talla_camisa`, `tipo_sangre`, `alergias`, `operaciones`, `lesiones_graves`, `fracturas`, `sexo`, `usuario`) VALUES
(123, 'santiago', 'toro', 20, 29999, 'santiago@gmail.com', 135, 20, 16, 'o', 'ninguna', 'ninguna', 'esguince', 'tobillo', 'hombre', 'santi123');

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
(789, 'carlos', 'molina', 29999, 'carlos@hotmail.com', 'carlos123');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mejor_resultado`
--

CREATE TABLE `mejor_resultado` (
  `cedula_atleta` int(20) NOT NULL,
  `id_evento` int(20) NOT NULL,
  `marca` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('javier123', '123', 'administrador'),
('santi123', '123', 'atleta');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `atleta`
--
ALTER TABLE `atleta`
  ADD PRIMARY KEY (`cedula_atleta`),
  ADD KEY `usuario` (`usuario`);

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
  MODIFY `id_dato_deportivo` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  MODIFY `id_entrenamiento` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(20) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `atleta_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `sesion` (`usuario`);

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
