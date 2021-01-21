USE reto;

DROP TABLE IF EXISTS vehiculos;
DROP TABLE IF EXISTS tipo_linea;
DROP TABLE IF EXISTS tipo_marca;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_linea`
--

CREATE TABLE `tipo_linea` (
  `id_linea` int(11) NOT NULL,
  `desc_linea` varchar(255) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `activo` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_marca`
--

CREATE TABLE `tipo_marca` (
  `id_marca` int(11) NOT NULL,
  `desc_marca` varchar(255) NOT NULL,
  `activo` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `nro_placa` varchar(6) CHARACTER SET utf8 NOT NULL,
  `id_linea` int(11) NOT NULL,
  `modelo` int(4) DEFAULT NULL,
  `fecha_ven_seguro` date DEFAULT NULL,
  `fecha_ven_tecnomecanica` date DEFAULT NULL,
  `fecha_ven_contratodo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tipo_linea`
--
ALTER TABLE `tipo_linea`
  ADD PRIMARY KEY (`id_linea`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `tipo_marca`
--
ALTER TABLE `tipo_marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`nro_placa`),
  ADD KEY `id_linea` (`id_linea`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tipo_linea`
--
ALTER TABLE `tipo_linea`
  ADD CONSTRAINT `tipo_linea_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `tipo_marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`id_linea`) REFERENCES `tipo_linea` (`id_linea`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
