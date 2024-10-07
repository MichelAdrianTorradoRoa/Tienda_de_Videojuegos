CREATE schema GamesDataBase;

USE GamesDataBase;

CREATE TABLE Categoria(
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL -- videojuegos o consolas o accesorios
);

CREATE TABLE Clasificacion(
    idClasificacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(8) NOT NULL -- PEGI 12 o PEGI 16 o etc...
);

CREATE TABLE Genero(
    idGenero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL -- Aventura, Acción, Deportes, etc...
);

CREATE TABLE TipoAccsesorio(
    idTipoAccsesorio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL -- Auriculares, Controles, etc...
);

CREATE TABLE Plataforma(
    idPlataforma INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL -- PlayStation, Xbox, Pc, etc...
);

CREATE TABLE Puesto(
    idPuesto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL -- Gerente de Ventas, Personal de Ventas, etc...
);

CREATE TABLE Pais(
    idPais INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL -- Colombia, Argentina, etc...
);

CREATE TABLE Ciudad(
    idCiudad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL, -- Barranquilla, Bucaramanga, Buenos Aires etc...
    idPais INT NOT NULL,
    FOREIGN KEY (idPais) REFERENCES Pais(idPais)
);

CREATE TABLE Marca(
    idMarca INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL -- Sony, Nintendo, etc...
);

CREATE TABLE Empleado(
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    idPuesto INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    fechaContratacion DATE NOT NULL,
    FOREIGN KEY (idPuesto) REFERENCES Puesto(idPuesto)
);

CREATE TABLE Producto (
	idProducto INT PRIMARY KEY AUTO_INCREMENT,
    idCategoria INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    precio FLOAT NOT NULL,
    stock INTEGER CHECK (stock > 0) NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

CREATE TABLE Videojuego(
	idVideojuego INT PRIMARY KEY AUTO_INCREMENT,
    peso varchar(10) NOT NULL, -- 10G, 8G etc...
    fechaLanzamiento varchar(10) NOT NULL,
    idProducto INT NOT NULL UNIQUE,
    idClasificacion INT NOT NULL,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    FOREIGN KEY (idClasificacion) REFERENCES Clasificacion(idClasificacion)
);

CREATE TABLE PlataformaxVideojuego(
	idPlataformaxVideojuego INT PRIMARY KEY AUTO_INCREMENT,
    idVideojuego INT NOT NULL,
    idPlataforma INT NOT NULL,
    FOREIGN KEY (idVideojuego) REFERENCES Videojuego(idVideojuego),
    FOREIGN KEY (idPlataforma) REFERENCES Plataforma(idPlataforma)
);

CREATE TABLE GeneroxVideojuego(
	idGeneroxVideojuego INT PRIMARY KEY AUTO_INCREMENT,
    idVideojuego INT NOT NULL,
    idGenero INT NOT NULL,
    FOREIGN KEY (idVideojuego) REFERENCES Videojuego(idVideojuego),
    FOREIGN KEY (idGenero) REFERENCES Genero(idGenero)
);

CREATE TABLE Accesorio(
	idAccesorio INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT NOT NULL UNIQUE,
    idTipoAccsesorio INT NOT NULL,
    idMarca INT NOT NULL,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    FOREIGN KEY (idTipoAccsesorio) REFERENCES TipoAccsesorio(idTipoAccsesorio),
    FOREIGN KEY (idMarca) REFERENCES Marca(idMarca)
);

CREATE TABLE Consola(
	idConsola INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT NOT NULL UNIQUE,
    almacenamiento VARCHAR(10),
    fechaLanzamiento DATE NOT NULL,
    procesador VARCHAR(100) NOT NULL,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Compatibilidad(
	idCompatibilidad INT PRIMARY KEY AUTO_INCREMENT,
    idAccesorio INT NOT NULL,
    idConsola INT NOT NULL,
    FOREIGN KEY (idAccesorio) REFERENCES Accesorio(idAccesorio),
    FOREIGN KEY (idConsola) REFERENCES Consola(idConsola)
);

CREATE TABLE Direccion(
    idDireccion INT PRIMARY KEY AUTO_INCREMENT,
    localizacion VARCHAR(255) NOT NULL, -- calle 12 barrio La Plata, ejemplo
    idCiudad INT NOT NULL,
    FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad)
);

CREATE TABLE Cliente(
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono CHAR(10) UNIQUE NOT NULL, -- 3204728466, ejemplo
    idDireccion INT NOT NULL,
    FOREIGN KEY (idDireccion) REFERENCES Direccion(idDireccion)
);

CREATE TABLE Venta(
	idVenta INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    idCliente INT NOT NULL,
    idEmpleado INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);

CREATE TABLE ProductoxVenta(
	idProductoxVenta INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT NOT NULL,
    idVenta INT NOT NULL,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    FOREIGN KEY (idVenta) REFERENCES Venta(idVenta)
);

CREATE TABLE Proveedor(
	idProveedor INT PRIMARY KEY AUTO_INCREMENT,
    idDireccion INT NOT NULL UNIQUE,
    empresa INT NOT NULL UNIQUE,
    nombre INT NOT NULL,
    telefono INT NOT NULL UNIQUE,
    FOREIGN KEY (idDireccion) REFERENCES Direccion(idDireccion)
);

CREATE TABLE Orden(
	idOrden INT PRIMARY KEY AUTO_INCREMENT,
    idProveedor INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE ProductoxOrden(
	idProductoxOrden INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT NOT NULL,
    idOrden INT NOT NULL,
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
    FOREIGN KEY (idOrden) REFERENCES Orden(idOrden)
);
