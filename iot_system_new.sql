-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2024 a las 20:08:45
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iot_system_new`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas`
--

CREATE TABLE `alertas` (
  `id` int(11) NOT NULL,
  `dispositivo_id` int(11) NOT NULL,
  `tipo_alerta` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` enum('activa','resuelta') DEFAULT 'activa',
  `fecha_alerta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alertas`
--

INSERT INTO `alertas` (`id`, `dispositivo_id`, `tipo_alerta`, `descripcion`, `estado`, `fecha_alerta`) VALUES
(1, 1, 'Movimiento Brusco', 'Movimiento excesivo detectado', 'activa', '2024-12-12 17:18:19'),
(2, 2, 'Temperatura Alta', 'La temperatura ha superado el límite', 'activa', '2024-12-12 17:18:19'),
(3, 3, 'Pulso Cardíaco Alto', 'El ritmo cardíaco es más alto de lo normal', 'activa', '2024-12-12 17:18:19'),
(4, 3, 'movimiento', 'Movimiento Detectado', 'activa', '2024-12-12 17:28:23'),
(5, 3, 'temperatura', 'Temperatura Alta Detectada', 'activa', '2024-12-12 17:28:24'),
(6, 2, 'movimiento', 'Movimiento Detectado', 'activa', '2024-12-12 17:28:28'),
(7, 3, 'alerta_violencia', 'Alerta de Violencia Detectada', 'activa', '2024-12-12 17:28:34'),
(8, 3, 'pulso_cardiaco', 'Pulso Elevado Detectado', 'activa', '2024-12-12 17:28:36'),
(9, 3, 'temperatura', 'Temperatura Alta Detectada', 'activa', '2024-12-12 17:28:36'),
(10, 1, 'movimiento', 'Movimiento Detectado', 'activa', '2024-12-12 17:28:37'),
(11, 3, 'temperatura', 'Temperatura Alta Detectada', 'activa', '2024-12-12 17:33:02'),
(12, 3, 'movimiento', 'Movimiento Detectado', 'activa', '2024-12-12 17:33:02'),
(13, 1, 'pulso_cardiaco', 'Pulso Elevado Detectado', 'activa', '2024-12-12 17:33:03'),
(14, 3, 'movimiento', 'Movimiento Detectado', 'activa', '2024-12-12 17:37:22'),
(15, 3, 'temperatura', 'Temperatura Alta Detectada', 'activa', '2024-12-12 17:37:23'),
(16, 3, 'pulso_cardiaco', 'Pulso Elevado Detectado', 'activa', '2024-12-12 17:37:23'),
(17, 2, 'movimiento', 'Movimiento Detectado', 'activa', '2024-12-12 17:48:21'),
(18, 3, 'temperatura', 'Temperatura Alta Detectada', 'activa', '2024-12-12 17:48:21'),
(19, 1, 'movimiento', 'Movimiento Detectado', 'activa', '2024-12-12 17:48:52'),
(20, 3, 'temperatura', 'Temperatura Alta Detectada', 'activa', '2024-12-12 17:48:52'),
(21, 2, 'pulso_cardiaco', 'Pulso Elevado Detectado', 'activa', '2024-12-12 17:48:52'),
(22, 2, 'movimiento', 'Movimiento Detectado', 'activa', '2024-12-12 17:49:02'),
(23, 1, 'temperatura', 'Temperatura Alta Detectada', 'activa', '2024-12-12 17:49:03'),
(24, 3, 'pulso_cardiaco', 'Pulso Elevado Detectado', 'activa', '2024-12-12 17:49:04'),
(25, 1, 'movimiento', 'Movimiento Detectado', 'activa', '2024-12-12 17:54:01'),
(26, 1, 'temperatura', 'Temperatura Alta Detectada', 'activa', '2024-12-12 17:54:01'),
(27, 2, 'pulso_cardiaco', 'Pulso Elevado Detectado', 'activa', '2024-12-12 17:54:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas_resueltas`
--

CREATE TABLE `alertas_resueltas` (
  `id` int(11) NOT NULL,
  `alerta_id` int(11) NOT NULL,
  `fecha_resolucion` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_resuelve` int(11) NOT NULL,
  `comentario_resolucion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_alertas`
--

CREATE TABLE `configuracion_alertas` (
  `id` int(11) NOT NULL,
  `dispositivo_id` int(11) NOT NULL,
  `tipo_alerta` varchar(100) NOT NULL,
  `umbral` float NOT NULL,
  `estado` enum('activada','desactivada') DEFAULT 'activada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuracion_alertas`
--

INSERT INTO `configuracion_alertas` (`id`, `dispositivo_id`, `tipo_alerta`, `umbral`, `estado`) VALUES
(1, 1, 'Movimiento Brusco', 10, 'activada'),
(2, 2, 'Temperatura Alta', 30, 'activada'),
(3, 3, 'Pulso Cardíaco Alto', 100, 'activada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_notificaciones`
--

CREATE TABLE `configuracion_notificaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo_notificacion` varchar(100) NOT NULL,
  `estado` enum('activada','desactivada') DEFAULT 'activada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

CREATE TABLE `dispositivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `fecha_instalacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dispositivos`
--

INSERT INTO `dispositivos` (`id`, `nombre`, `tipo`, `estado`, `fecha_instalacion`) VALUES
(1, 'Giroscopio', 'Movimiento', 'activo', '2024-12-12 17:18:19'),
(2, 'Sensor de Temperatura', 'Temperatura', 'activo', '2024-12-12 17:18:19'),
(3, 'Sensor de Pulso', 'Ritmo Cardíaco', 'activo', '2024-12-12 17:18:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos_asignados`
--

CREATE TABLE `dispositivos_asignados` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `dispositivo_id` int(11) NOT NULL,
  `fecha_asignacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `dispositivo_id` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `evento_detectado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id`, `dispositivo_id`, `fecha_hora`, `evento_detectado`) VALUES
(1, 1, '2024-12-12 17:18:19', 'Movimiento brusco detectado'),
(2, 2, '2024-12-12 17:18:19', 'Temperatura alta detectada'),
(3, 3, '2024-12-12 17:18:19', 'Ritmo cardíaco elevado detectado'),
(4, 3, '2024-12-12 17:37:22', 'Movimiento Detectado'),
(5, 3, '2024-12-12 17:37:23', 'Temperatura Alta Detectada'),
(6, 3, '2024-12-12 17:37:23', 'Pulso Elevado Detectado'),
(7, 2, '2024-12-12 17:48:21', 'Movimiento Detectado'),
(8, 3, '2024-12-12 17:48:21', 'Temperatura Alta Detectada'),
(9, 1, '2024-12-12 17:48:52', 'Movimiento Detectado'),
(10, 3, '2024-12-12 17:48:52', 'Temperatura Alta Detectada'),
(11, 2, '2024-12-12 17:48:52', 'Pulso Elevado Detectado'),
(12, 2, '2024-12-12 17:49:02', 'Movimiento Detectado'),
(13, 1, '2024-12-12 17:49:03', 'Temperatura Alta Detectada'),
(14, 3, '2024-12-12 17:49:04', 'Pulso Elevado Detectado'),
(15, 1, '2024-12-12 17:54:01', 'Movimiento Detectado'),
(16, 1, '2024-12-12 17:54:01', 'Temperatura Alta Detectada'),
(17, 2, '2024-12-12 17:54:01', 'Pulso Elevado Detectado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accesos`
--

CREATE TABLE `historial_accesos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `fecha_acceso` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_eventos`
--

CREATE TABLE `historial_eventos` (
  `id` int(11) NOT NULL,
  `dispositivo_id` int(11) NOT NULL,
  `evento` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historial_eventos`
--

INSERT INTO `historial_eventos` (`id`, `dispositivo_id`, `evento`, `fecha`) VALUES
(1, 1, 'Evento de movimiento detectado', '2024-12-12 17:18:19'),
(2, 2, 'Alerta de temperatura alta', '2024-12-12 17:18:19'),
(3, 3, 'Ritmo cardíaco elevado registrado', '2024-12-12 17:18:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_sistema`
--

CREATE TABLE `logs_sistema` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento_dispositivos`
--

CREATE TABLE `mantenimiento_dispositivos` (
  `id` int(11) NOT NULL,
  `dispositivo_id` int(11) NOT NULL,
  `fecha_mantenimiento` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_mantenimiento` varchar(100) NOT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('leida','no_leida') DEFAULT 'no_leida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` enum('1','0') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `nombre`, `estado`) VALUES
(1, 'movimiento', ''),
(2, 'temperatura', ''),
(3, 'pulso_cardiaco', '1'),
(4, 'alerta_violencia', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','user','supervisor','exposicion','privado') NOT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `email`, `role`, `estado`, `fecha_registro`) VALUES
(1, 'admin', 'password', 'admin@example.com', 'admin', 'activo', '2024-12-12 17:18:19'),
(2, 'usuario1', 'password', 'user1@example.com', 'user', 'activo', '2024-12-12 17:18:19'),
(3, 'supervisor1', 'password', 'supervisor1@example.com', 'supervisor', 'activo', '2024-12-12 17:18:19'),
(4, 'exposicion_user', 'password', 'exposicion@example.com', 'exposicion', 'activo', '2024-12-12 17:18:19'),
(5, 'privado_user', 'password', 'privado@example.com', 'privado', 'activo', '2024-12-12 17:18:19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispositivo_id` (`dispositivo_id`);

--
-- Indices de la tabla `alertas_resueltas`
--
ALTER TABLE `alertas_resueltas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alerta_id` (`alerta_id`),
  ADD KEY `usuario_resuelve` (`usuario_resuelve`);

--
-- Indices de la tabla `configuracion_alertas`
--
ALTER TABLE `configuracion_alertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispositivo_id` (`dispositivo_id`);

--
-- Indices de la tabla `configuracion_notificaciones`
--
ALTER TABLE `configuracion_notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dispositivos_asignados`
--
ALTER TABLE `dispositivos_asignados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `dispositivo_id` (`dispositivo_id`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispositivo_id` (`dispositivo_id`);

--
-- Indices de la tabla `historial_accesos`
--
ALTER TABLE `historial_accesos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `historial_eventos`
--
ALTER TABLE `historial_eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispositivo_id` (`dispositivo_id`);

--
-- Indices de la tabla `logs_sistema`
--
ALTER TABLE `logs_sistema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `mantenimiento_dispositivos`
--
ALTER TABLE `mantenimiento_dispositivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispositivo_id` (`dispositivo_id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alertas`
--
ALTER TABLE `alertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `alertas_resueltas`
--
ALTER TABLE `alertas_resueltas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracion_alertas`
--
ALTER TABLE `configuracion_alertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuracion_notificaciones`
--
ALTER TABLE `configuracion_notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `dispositivos_asignados`
--
ALTER TABLE `dispositivos_asignados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `historial_accesos`
--
ALTER TABLE `historial_accesos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_eventos`
--
ALTER TABLE `historial_eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `logs_sistema`
--
ALTER TABLE `logs_sistema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mantenimiento_dispositivos`
--
ALTER TABLE `mantenimiento_dispositivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alertas`
--
ALTER TABLE `alertas`
  ADD CONSTRAINT `alertas_ibfk_1` FOREIGN KEY (`dispositivo_id`) REFERENCES `dispositivos` (`id`);

--
-- Filtros para la tabla `configuracion_alertas`
--
ALTER TABLE `configuracion_alertas`
  ADD CONSTRAINT `configuracion_alertas_ibfk_1` FOREIGN KEY (`dispositivo_id`) REFERENCES `dispositivos` (`id`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`dispositivo_id`) REFERENCES `dispositivos` (`id`);

--
-- Filtros para la tabla `historial_eventos`
--
ALTER TABLE `historial_eventos`
  ADD CONSTRAINT `historial_eventos_ibfk_1` FOREIGN KEY (`dispositivo_id`) REFERENCES `dispositivos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
