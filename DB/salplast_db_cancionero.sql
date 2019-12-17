-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2019 a las 22:32:05
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `salplast_db_cancionero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

CREATE TABLE `artistas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fechanac` date NOT NULL,
  `ranking` int(11) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`id`, `nombre`, `apellido`, `fechanac`, `ranking`, `imagen`) VALUES
(3, 'Alejandro', 'Lerner', '1951-11-10', 10, 'img/artista/5de01e8c20834.jpg'),
(7, 'Juan Luis', 'Guerra', '1957-06-07', 5, ''),
(9, 'Shakira', 'Barranquilla', '1978-01-20', 10, 'img/artista/5de01e5fa9a1a.jpg'),
(11, 'Ricky', 'Martin', '1972-10-10', 8, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE `canciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `duracion` int(11) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `album` varchar(50) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `ranking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`id`, `nombre`, `duracion`, `genero`, `album`, `id_artista`, `ranking`) VALUES
(17, 'Todo a Pulmon', 10, 'Rock', 'Album20', 3, 20),
(27, 'Bachata Rosa', 50, 'Bachata', 'Bachata Rosa', 7, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `mensaje` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `valoracion` int(11) NOT NULL,
  `fk_id_cancion` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `mensaje`, `valoracion`, `fk_id_cancion`, `fk_id_usuario`) VALUES
(1, 'Mensaje de prueba sobre la canción Todo a Pulmon', 9, 17, 1),
(2, 'Este es otro mensaje de prueba dobre la misma cancion', 2, 17, 1),
(3, 'Nuevo comentario', 5, 17, 1),
(4, 'Nuevo comentario', 5, 17, 1),
(5, 'La cancion es un exito. Recomedadisima', 10, 17, 1),
(6, 'Se recomienda altamente', 9, 17, 1),
(58, 'Nuevo comentario', 5, 27, 1),
(59, 'Nuevo comentario', 5, 27, 1),
(60, 'Nuevo comentario', 6, 27, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `administrador` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `password`, `administrador`) VALUES
(1, 'admin@admin', '$2y$10$8Z.IS12eYF9Vti8gSgQ4T.t7R9qbEzikIe8IGkXSZRBNcfO1JGrz6', 1),
(12, 'ines@ejemplo', '$2y$10$iTZJ0UxaAeNzjHc5tgENQ.MPeF8VR19sAeX3YYcJfUgzrEpm5d7Sa', 1),
(14, 'javier@ejemplo', '$2y$10$5k3/NArTLVT7ioxnetqRm.rQ3EBLIvDgCHMHYaS1fovegSk77bIIK', 0),
(15, 'silvia@ejemplo', '$2y$10$Kcr/CijEC6LAv5pvrepJdu69jXpjkp9BLei1s0Y8lJYWfmvPZSiE6', 0),
(16, 'cristina@ejemplo', '$2y$10$xNY7Seui5k9cDZksgz22t.mkG.965juxjM8.LXQc9LM.SdCEGHDW2', 0),
(17, 'nicolas@ejemplo', '$2y$10$XIz3RUkTcDprR8b.LE07quFmnWgWo3.SMOm/OPEN9G.rJhDR55ybe', 0),
(18, 'ignacio@ejemplo', '$2y$10$X/Mrptvlf6eppsm9IkUkD.lSwrt5IXQpBIyDHN6A67nA2PXuhnZ/S', 0),
(19, 'carolina@ejemplo', '$2y$10$0dkn.iGqKrJiyeAutbKIxuta6bs/iDAJtzTa7MFiawQLOmybg3byO', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_cancion` (`fk_id_cancion`),
  ADD KEY `fk_id_usuario` (`fk_id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `canciones`
--
ALTER TABLE `canciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_id_cancion` FOREIGN KEY (`fk_id_cancion`) REFERENCES `canciones` (`id`),
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
