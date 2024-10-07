-- Insertar categorías
INSERT INTO Categoria (nombre) VALUES
('Videojuegos'),
('Consolas'),
('Accesorios');

-- Insertar clasificaciones
INSERT INTO Clasificacion (nombre) VALUES
('PEGI 3'),
('PEGI 7'),
('PEGI 12'),
('PEGI 16'),
('PEGI 18');

-- Insertar géneros
INSERT INTO Genero (nombre) VALUES
('Aventura'),
('Acción'),
('Deportes'),
('Simulación'),
('Estrategia'),
('RPG'),
('Shooter'),
('Carreras'),
('Puzzle'),
('Terror');

-- Insertar tipos de accesorios
INSERT INTO TipoAccsesorio (nombre) VALUES
('Auriculares'),
('Controles'),
('Cargadores'),
('Volantes'),
('Teclados');

-- Insertar plataformas
INSERT INTO Plataforma (nombre) VALUES
('PlayStation'),
('Xbox'),
('Nintendo Switch'),
('PC'),
('Steam Deck');

-- Insertar puestos
INSERT INTO Puesto (nombre) VALUES
('Gerente de Ventas'),
('Personal de Ventas'),
('Encargado de Inventario'),
('Soporte Técnico'),
('Gerente de Compras');

-- Insertar países
INSERT INTO Pais (nombre) VALUES
('Colombia'),
('Argentina'),
('México'),
('España'),
('Estados Unidos');

-- Insertar ciudades
INSERT INTO Ciudad (nombre, idPais) VALUES
('Bogotá', 1),
('Medellín', 1),
('Buenos Aires', 2),
('Ciudad de México', 3),
('Madrid', 4),
('Miami', 5);

-- Insertar marcas
INSERT INTO Marca (nombre) VALUES
('Sony'),
('Microsoft'),
('Nintendo'),
('Logitech'),
('Razer');

-- Insertar empleados
INSERT INTO Empleado (idPuesto, nombre, fechaContratacion) VALUES
(1, 'Carlos Pérez', '2021-01-15'),
(2, 'Ana Gómez', '2020-06-10'),
(3, 'Luis Martínez', '2019-09-23'),
(4, 'Laura Rodríguez', '2022-02-18'),
(5, 'Pedro Fernández', '2018-12-11');

-- Insertar productos
INSERT INTO Producto (idCategoria, nombre, descripcion, precio, stock) VALUES
(1, 'The Last of Us Part II', 'Videojuego de aventura y acción', 59.99, 100),
(2, 'PlayStation 5', 'Consola de nueva generación', 499.99, 50),
(3, 'Auriculares Inalámbricos', 'Auriculares con cancelación de ruido', 79.99, 200);

-- Insertar videojuegos
INSERT INTO Videojuego (peso, fechaLanzamiento, idProducto, idClasificacion) VALUES
('50GB', '2020-06-19', 1, 5);

-- Insertar plataformas para videojuegos
INSERT INTO PlataformaxVideojuego (idVideojuego, idPlataforma) VALUES
(1, 1), -- PlayStation
(1, 2); -- Xbox

-- Insertar géneros para videojuegos
INSERT INTO GeneroxVideojuego (idVideojuego, idGenero) VALUES
(1, 1), -- Aventura
(1, 2); -- Acción

-- Insertar accesorios
INSERT INTO Accesorio (idProducto, idTipoAccsesorio, idMarca) VALUES
(3, 1, 4); -- Auriculares Logitech

-- Insertar consolas
INSERT INTO Consola (idProducto, almacenamiento, fechaLanzamiento, procesador) VALUES
(2, '825GB', '2020-11-12', 'AMD Ryzen Zen 2');

-- Insertar compatibilidad de accesorios con consolas
INSERT INTO Compatibilidad (idAccesorio, idConsola) VALUES
(1, 1);

-- Insertar direcciones
INSERT INTO Direccion (localizacion, idCiudad) VALUES
('Calle 123 #45-67, Bogotá', 1),
('Avenida Siempre Viva 742, Ciudad de México', 4);

-- Insertar clientes
INSERT INTO Cliente (nombre, email, telefono, idDireccion) VALUES
('Juan López', 'juan.lopez@email.com', '3201234567', 1),
('María García', 'maria.garcia@email.com', '3107654321', 2);

-- Insertar ventas
INSERT INTO Venta (fecha, idCliente, idEmpleado) VALUES
('2023-01-15 10:30:00', 1, 2),
('2023-02-20 14:45:00', 2, 3);

-- Insertar productos en ventas
INSERT INTO ProductoxVenta (idProducto, idVenta) VALUES
(1, 1),
(3, 2);

-- Insertar proveedores
INSERT INTO Proveedor (idDireccion, empresa, nombre, telefono) VALUES
(1, 'Sony Corporation', 'John Doe', '3209876543');

-- Insertar órdenes
INSERT INTO Orden (idProveedor, fecha) VALUES
(1, '2023-05-10');

-- Insertar productos en órdenes
INSERT INTO ProductoxOrden (idProducto, idOrden) VALUES
(2, 1);
