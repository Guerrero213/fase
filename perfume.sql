-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 18-11-2024 a las 19:53:55
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
-- Base de datos: `perfume`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(15) NOT NULL,
  `producto` varchar(15) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `telefono` int(20) NOT NULL,
  `valor` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `proovedor` varchar(15) NOT NULL,
  `telefono` int(15) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `cantidad` int(15) NOT NULL,
  `valor` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locion`
--

CREATE TABLE `locion` (
  `id` int(20) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `direccion` varchar(15) NOT NULL,
  `telefono` int(15) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `valor` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `locion`
--

INSERT INTO `locion` (`id`, `nombre`, `direccion`, `telefono`, `producto`, `valor`) VALUES
(1, 'luis', 'barril', 31245045, '', 12000),
(2, 'claudia', 'brazil', 14501752, '', 15000),
(3, 'sarah', 'piñal', 5421781, '', 15000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `producto` (`producto`),
  ADD UNIQUE KEY `cantidad` (`cantidad`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD UNIQUE KEY `producto` (`producto`),
  ADD UNIQUE KEY `valor` (`valor`),
  ADD UNIQUE KEY `cantidad` (`cantidad`);

--
-- Indices de la tabla `locion`
--
ALTER TABLE `locion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `locion`
--
ALTER TABLE `locion`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id`) REFERENCES `locion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`producto`) REFERENCES `factura` (`producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `ingreso_ibfk_2` FOREIGN KEY (`cantidad`) REFERENCES `factura` (`cantidad`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
