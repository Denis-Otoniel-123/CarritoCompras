-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2021 a las 06:03:55
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcarritocompras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` smallint(6) NOT NULL,
  `nombre_cargo` varchar(30) NOT NULL,
  `vigencia` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nombre_cargo`, `vigencia`) VALUES
(1, 'ADMINISTRADOR', b'1'),
(2, 'VENDEDOR', b'1'),
(3, 'SOPORTE TÉCNICO', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` smallint(6) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre_categoria`, `estado`) VALUES
(1, 'TV & HOGAR', b'1'),
(2, 'TELEFONÍA MÓVIL', b'1'),
(3, 'ACCESORIOS', b'1'),
(4, 'MACBOOKS', b'1'),
(5, 'IMAC', b'1'),
(6, 'AUDIO', b'1'),
(7, 'IPAD', b'1'),
(49, 'CARGADORES', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) UNSIGNED NOT NULL,
  `Numero_doc` varchar(11) DEFAULT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `tipo_identificacion_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Numero_doc`, `Nombres`, `Direccion`, `Email`, `Password`, `tipo_identificacion_id`) VALUES
(17, '78019778', 'ALEXANDER FUENTES MEDINA', 'CALLE SUCRE N.º 903 U.V \"CASIMIRO CHÚMAN\" - FERREÑAFE - FERREÑAFE - LAMBAYEQUE', 'ALEXANDERFUENTES199912@GMAIL.COM', 'ALEXFUME10', 1),
(21, '48472140', 'YULEISI LEONOR DEL MILAGRO FUENTES MEDINA', 'CALLE SUCRE N.º 903 U.V \"CASIMIRO CHÚMAN\" - FERREÑAFE - FERREÑAFE - LAMBAYEQUE', 'YULEISIFUENTES@LIVE.COM', 'TEAMOADRIAN', 1),
(22, '10223696588', 'MARK STEPHANO SANCHEZ MEDINA', 'CALLE GRAU N.º 403 - FERREÑAFE - FERREÑAFE - LAMBAYEQUE', 'STEPHANOSAME@OUTLOOK.COM', 'STEPHANOWOOKI', 2),
(23, '62563696', 'JORGE ANDRE', 'CALLE JOSE OLAYA N.º 103 - FERREÑAFE - FERREÑAFE - LAMBAYEQUE', 'JORGEANDRE@LIVE.COM', 'JORGIRO123', 1),
(24, '45896325', 'ANTONELLA FRANCHESCA CAJO BRAVO', 'CALLE BOLIVAR NRO. 123 - FERREÑAFE - FERREÑAFE - LAMBAYEQUE', 'ANTONELLA@LIVE.COM', 'ANTO123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompras` int(11) UNSIGNED NOT NULL,
  `idCliente` int(11) UNSIGNED NOT NULL,
  `idPago` int(11) UNSIGNED NOT NULL,
  `FechaCompras` date DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `Despachado` bit(1) NOT NULL,
  `Anular` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompras`, `idCliente`, `idPago`, `FechaCompras`, `Monto`, `Estado`, `Despachado`, `Anular`) VALUES
(7, 17, 16, '2021-06-08', 3500, 'R', b'1', b'0'),
(8, 21, 18, '2021-06-08', 6829, 'E', b'0', b'0'),
(9, 22, 19, '2021-06-03', 9197, 'E', b'0', b'1'),
(10, 17, 20, '2021-06-10', 13500, 'E', b'0', b'0'),
(11, 17, 21, '2021-06-10', 8000, 'E', b'0', b'0'),
(12, 17, 22, '2021-06-10', 2250, 'E', b'0', b'0'),
(13, 17, 23, '2021-06-10', 6000, 'E', b'0', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `idProducto` int(11) UNSIGNED NOT NULL,
  `idCompras` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioCompra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`idDetalle`, `idProducto`, `idCompras`, `Cantidad`, `PrecioCompra`) VALUES
(9, 20, 7, 5, 700),
(10, 38, 7, 1, 2199),
(11, 26, 7, 1, 4500),
(12, 31, 7, 2, 5600),
(13, 31, 8, 1, 5600),
(14, 32, 8, 2, 500),
(15, 45, 8, 1, 229),
(16, 37, 9, 2, 3499),
(17, 38, 9, 1, 2199),
(18, 26, 10, 3, 4500),
(19, 22, 11, 5, 1600),
(20, 30, 12, 5, 450),
(21, 24, 13, 2, 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` smallint(6) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` char(9) NOT NULL,
  `sexo` char(1) NOT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `tipo_identificacion_id` smallint(6) DEFAULT NULL,
  `numero_identicacion` char(11) DEFAULT NULL,
  `cargo_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombres`, `apellidos`, `email`, `telefono`, `sexo`, `vigencia`, `tipo_identificacion_id`, `numero_identicacion`, `cargo_id`) VALUES
(1, 'MARY LEONOR', 'MEDINA MEOÑO', 'MARYLEONORMM30@HOTMAIL.COM', '963458721', 'F', b'1', 1, '17432825', 1),
(17, 'ANTONELLA FRANCHESCA', 'CAJO BRAVO', 'ANTONELLA@GMAIL.COM', '917458632', 'F', b'1', 2, '10206356482', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` smallint(6) NOT NULL,
  `nombre_marca` varchar(50) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre_marca`, `estado`) VALUES
(1, 'APPLE', b'1'),
(2, 'HUAWEI', b'0'),
(3, 'SAMSUNG', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) UNSIGNED NOT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idPago`, `Monto`) VALUES
(16, 3500),
(18, 6829),
(19, 9197),
(20, 13500),
(21, 8000),
(22, 2250),
(23, 6000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) UNSIGNED NOT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int(11) UNSIGNED DEFAULT NULL,
  `categoria_id` smallint(6) DEFAULT NULL,
  `marca_id` smallint(6) NOT NULL,
  `proveedor_id` smallint(6) NOT NULL,
  `estado` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Nombres`, `Foto`, `Descripcion`, `Precio`, `Stock`, `categoria_id`, `marca_id`, `proveedor_id`, `estado`) VALUES
(20, 'IPHONE 6S', 'http://localhost:80/carrito/iphone 6s.png', 'iOS 11\nCapacidad 64GB\nChip A9 con arquitectura de 64 bits\nCoprocesador de movimiento M9 integrado\nCamara de 12 Mpx', 700, 80, 2, 1, 1, b'1'),
(21, 'IPHONE 8 PLUS', 'http://localhost:80/carrito/iphone 8.jpg', 'iOS 13 Capacidad 128GB \nChip A9 con arquitectura de 64 bits \nCoprocesador de movimiento M9 integrado Camara de 24 Mpx', 1500, 1000, 2, 1, 1, b'1'),
(22, 'IPHONE 11 PRO MAX', 'http://localhost:80/carrito/iphone 11.jpg', 'iOS 13 Capacidad 128GB Chip A9 con arquitectura de 64 bits Coprocesador de movimiento M9 integrado Camara Dual de 24 Mpx', 1600, 995, 2, 1, 1, b'1'),
(23, 'AIRPODS', 'http://localhost:80/carrito/airpods.jpg', 'Los AirPods ahora te ofrecen una duracion inigualable de 5 horas de audio y hasta 3 horas para hablar con una sola carga', 150, 100, 3, 1, 1, b'1'),
(24, 'IPAD PRO', 'http://localhost:80/carrito/Ipad.png', 'Las nuevas cÃ¡maras profesionales, Wide y Ultra Wide, combinadas con el nuevo LiDAR Scanner permiten experiencias completamente nuevas en la prÃ³xima generaciÃ³n de realidad aumentada (AR) aplicaciones.', 3000, 698, 7, 1, 2, b'1'),
(25, 'APPLE PENCIL', 'http://localhost:80/carrito/applepencil.png', 'El Apple Pencil reinventada la forma de dibujar, tomar notas y marcar documentos para hacerla mÃ¡s intuitiva, precisa y mÃ¡gica.', 200, 1000, 3, 1, 1, b'1'),
(26, 'MACBOOK AIR', 'http://localhost:80/carrito/macbookair.jpg', 'Pantalla de retina de alta resolucion 2560 x 1600 La MacBook Air ahora trae Touch ID Capacidad de 1TB SSD Memoria RAM de 16GB DDR4 Intel Core i7 de Septima generacion.', 4500, 996, 4, 1, 1, b'1'),
(28, 'MACBOOK PRO', 'http://localhost:80/carrito/macpro.jpg', 'Pantalla de retina de alta resolucion 2560 x 1600 La MacBook Pro ahora trae Touch ID Capacidad de 2TB SSD Memoria RAM de 32GB DDR4 Intel Core i9 de novena generacion.', 16200, 1000, 4, 1, 1, b'1'),
(29, 'APPLE TV', 'http://localhost:80/carrito/tv.jpg', 'Una forma de ver television como siempre sonaste: tus servicios de streaming favoritos todo en un solo lugar', 1500, 5000, 1, 1, 1, b'1'),
(30, 'APPLE WATCH SERIES 3', 'http://localhost:80/carrito/relok.png', 'Monitorea tu salud, Los calculos Pararse, Moverse y Ejercicio te muestran todos los movimientos que haces diariamente.', 450, 1195, 3, 1, 1, b'1'),
(31, 'IMAC PRO', 'http://localhost:80/carrito/imac.jpg', 'Procesador Xeon de\n8, 10, 14 o 18 nucleos\nTurbo Boost de hasta 4.5 GHz\nHasta 42 MB de cache. Gracias al GPU Radeon Pro Vega, la iMac Pro ofrece los graficos mÃ¡s espectaculares de todas las Mac', 5600, 97, 5, 1, 1, b'1'),
(32, 'HOME POD', 'http://localhost:80/carrito/home.jpg', 'Dimensiones:\n17,2 cm de alto\n14,2 cm de ancho\n\nPeso:\n2,5 kg\n\nColor:\nGris espacial\nBlanco\nWiFi 802.11ac con MIMO\nAcceso directo para invitados\nBluetooth 5.0\nAdmite altavoces en varias habitaciones con AirPlay ', 500, 198, 6, 1, 1, b'1'),
(37, 'IPAD PRO 11\"', 'http://localhost:80/carrito/iPadPro11.jpg', 'Mucho más que una tablet. El iPad Pro cuenta con el poderoso y revolucionario chip A12Z Bionic, que supera por mucho las capacidades de la mayoría de laptops y PCs del mercado..No te lo pierdas', 3499, 98, 7, 1, 1, b'1'),
(38, 'APPLE WATCH SERIES 6', 'http://localhost:80/carrito/appleWatchSerie6.jpg', 'Ya está disponible el Apple Watch Series 6 44mm 32GB GPS Space Gray compralo con nosotros en Ripley Perú', 2199, 498, 3, 1, 1, b'1'),
(39, 'MACBOOK AIR 13.3\"', 'http://localhost:80/carrito/macbookPro2021M1.jpg', 'Disfruta de toda la potencia y elegancia de la nueva Macbook Air, equipada con el poderoso Chip M1, el primero de una estirpe de procesadores diseñados específicamente para Apple', 4599, 250, 4, 1, 1, b'1'),
(45, 'CARGADOR MAGSAFE', 'http://localhost:80/carrito/magsafe.jpg', 'El cargador MagSafe se conecta a través de imanes perfectamente alineados. Para que la carga inalámbrica sea más rápida y de hasta 15 W, el cargador MagSafe se conecta a tu iPhone.', 229, 228, 3, 1, 1, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` smallint(6) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tipo_identificacion_id` smallint(6) DEFAULT NULL,
  `numero_doc` varchar(11) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `razon_social`, `direccion`, `telefono`, `email`, `tipo_identificacion_id`, `numero_doc`, `estado`) VALUES
(1, 'TECNOALEXANDER S.A.C', 'CALLE LOS OLIVOS N.º 321 - FRENTE AL COMPLEJO CHUPÓN DÁVILA', '917967145', 'HOLA@TECNOALEXANDER.COM', 2, '20363899787', b'1'),
(2, 'ISHOP S.A.C', 'CAL. CARLOS GONZALES N.º 203 AL COSTADO DEL METRO DE LA MARINA - SAN MIGUEL - LIMA', '915756325', 'ISHOP@ISHOP.COM.PE', 2, '20557198700', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_identificacion`
--

CREATE TABLE `tipo_identificacion` (
  `id_tipo_identificacion` smallint(6) NOT NULL,
  `nombre_tipo_identifacion` char(20) DEFAULT NULL,
  `vigencia` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_identificacion`
--

INSERT INTO `tipo_identificacion` (`id_tipo_identificacion`, `nombre_tipo_identifacion`, `vigencia`) VALUES
(1, 'DNI', b'1'),
(2, 'RUC', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` smallint(6) NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `clave` varchar(15) NOT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `empleado_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `clave`, `vigencia`, `empleado_id`) VALUES
(1, 'E17432825M', 'admin123', b'1', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `cliente_tipo_identificacion_id` (`tipo_identificacion_id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `Compras_FKIndex1` (`idPago`),
  ADD KEY `Compras_FKIndex2` (`idCliente`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`,`idProducto`,`idCompras`),
  ADD KEY `Producto_has_Compras_FKIndex1` (`idProducto`),
  ADD KEY `Producto_has_Compras_FKIndex2` (`idCompras`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_empleado_cargo` (`cargo_id`),
  ADD KEY `fk_empleado_tipo_identificacion` (`tipo_identificacion_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_producto_categoria` (`categoria_id`),
  ADD KEY `fk_producto_marca` (`marca_id`),
  ADD KEY `fk_producto_proveedor` (`proveedor_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_identificacion`
--
ALTER TABLE `tipo_identificacion`
  ADD PRIMARY KEY (`id_tipo_identificacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_empleado` (`empleado_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_identificacion`
--
ALTER TABLE `tipo_identificacion`
  MODIFY `id_tipo_identificacion` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_tipo_identificacion_id` FOREIGN KEY (`tipo_identificacion_id`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_cargo` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id_cargo`),
  ADD CONSTRAINT `fk_empleado_tipo_identificacion` FOREIGN KEY (`tipo_identificacion_id`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `fk_producto_marca` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
