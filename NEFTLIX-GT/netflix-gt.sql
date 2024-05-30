-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2024 a las 01:20:32
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `netflix-gt`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_netflix`
--

CREATE TABLE `cuenta_netflix` (
  `ID_USUARIO` int(11) NOT NULL,
  `CORREO` varchar(35) NOT NULL,
  `ID_PAGO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepelicula`
--

CREATE TABLE `detallepelicula` (
  `INFORMACION_GENERAL` varchar(50) NOT NULL,
  `DURACION` varchar(30) NOT NULL,
  `PUBLICACION` int(11) NOT NULL,
  `DIRECTOR` varchar(75) NOT NULL,
  `REPARTO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encpelicula`
--

CREATE TABLE `encpelicula` (
  `NOMBRE_PELICULA` int(11) NOT NULL,
  `INFORMACION_GENERAL` varchar(50) NOT NULL,
  `NOMBRE_DE_PERFIL` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_de_pago`
--

CREATE TABLE `metodo_de_pago` (
  `ID_PAGO` int(11) NOT NULL,
  `PLAN` varchar(15) NOT NULL,
  `TIPO_DE_PLAN` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `NOMBRE_DE_PERFIL` varchar(25) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuenta_netflix`
--
ALTER TABLE `cuenta_netflix`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `metodo_de_pago_cuenta_netflix_fk` (`ID_PAGO`);

--
-- Indices de la tabla `detallepelicula`
--
ALTER TABLE `detallepelicula`
  ADD PRIMARY KEY (`INFORMACION_GENERAL`);

--
-- Indices de la tabla `encpelicula`
--
ALTER TABLE `encpelicula`
  ADD PRIMARY KEY (`NOMBRE_PELICULA`),
  ADD KEY `detallepelicula_encpelicula_fk` (`INFORMACION_GENERAL`),
  ADD KEY `usuario_encpelicula_fk` (`NOMBRE_DE_PERFIL`);

--
-- Indices de la tabla `metodo_de_pago`
--
ALTER TABLE `metodo_de_pago`
  ADD PRIMARY KEY (`ID_PAGO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`NOMBRE_DE_PERFIL`),
  ADD KEY `cuenta_netflix_usuario_fk` (`ID_USUARIO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuenta_netflix`
--
ALTER TABLE `cuenta_netflix`
  ADD CONSTRAINT `metodo_de_pago_cuenta_netflix_fk` FOREIGN KEY (`ID_PAGO`) REFERENCES `metodo_de_pago` (`ID_PAGO`);

--
-- Filtros para la tabla `encpelicula`
--
ALTER TABLE `encpelicula`
  ADD CONSTRAINT `detallepelicula_encpelicula_fk` FOREIGN KEY (`INFORMACION_GENERAL`) REFERENCES `detallepelicula` (`INFORMACION_GENERAL`),
  ADD CONSTRAINT `usuario_encpelicula_fk` FOREIGN KEY (`NOMBRE_DE_PERFIL`) REFERENCES `usuario` (`NOMBRE_DE_PERFIL`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `cuenta_netflix_usuario_fk` FOREIGN KEY (`ID_USUARIO`) REFERENCES `cuenta_netflix` (`ID_USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
