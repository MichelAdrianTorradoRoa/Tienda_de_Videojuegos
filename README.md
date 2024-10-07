# Tienda-de-Videojuegos

## Información General 📒

Este proyecto de base de datos está diseñado para gestionar la información de una tienda de videojuegos que se especializa en la venta de videojuegos, consolas y accesorios. La base de datos almacena información relacionada con los productos, clientes, empleados, proveedores, ventas y más. A continuación, se describen las principales entidades y su propósito dentro del sistema.

## Tabla de Contenidos 🔗

1. [Esquema Entidad-Relacional](#esquema-entidad-relacional)
    1. [Entidades Princiaples](#entidades-principales)
    2. [Tablas Intermedias](#tablas-intermedias)
2. [Estructura del Proyecto](#estructura-del-proyecto)
    1. [Ingenieria Inversa](#ingenieria-inversa)
3. [Consultas](#consultas)
4. [Tecnologias](#tecnologías-🤖)
5. [Instalación](#instalación-📦)
6. [Autores](#autores-🐦‍🔥)

## Esquema Entidad-Relacional

El esquema entidad-relacional (ER) de la base de datos de la tienda de videojuegos está compuesto por varias entidades y sus relaciones.

![EsquemaE-R](<videojuegos.jpg>)

## Entidades Principales

Las entidades principales son las siguientes:

### 1. **Productos**

 - **Descripción**: Almacena información sobre los productos que están disponibles para la venta, ya sean videojuegos, consolas o accesorios.
 
| PK | FK | Campo        | Tipo         |
|----|----|--------------|--------------|
| PK |    | idProducto   | INTEGER      |
|    | FK | idCategoria  | INTEGER      |
|    |    | nombre       | VARCHAR(255) |
|    |    | descripcion  | TEXT         |
|    |    | precio       | FLOAT        |
|    |    | stock        | INTEGER      |


   - **Atributos**:
     - `idProducto`: Identificador único del producto.
     - `nombre`: Nombre del producto.
     - `descripcion`: Descripción detallada del producto.
     - `precio`: Precio de venta del producto.
     - `stock`: Cantidad disponible en el inventario.
     - `idCategoria`: Relación con la categoría del producto.


### 2. **Videojuego**
 - **Descripción**: Representa los videojuegos disponibles en la tienda.

| PK | FK | Campo           | Tipo         |
|----|----|-----------------|--------------|
| PK |    | idVideojuego    | INTEGER      |
|    | FK | idProducto      | INTEGER      |
|    | FK | idClasificacion | INTEGER      |
|    |    | peso            | INTEGER      |
|    |    | fechaLanzamiento| DATE         |

   - **Atributos**:
     - `idVideojuego`: Identificador único del videojuego.
     - `idProducto`: Relación con la tabla de productos.
     - `idClasificacion`: Clasificación por edad del videojuego (por ejemplo, PEGI o ESRB).
     - `peso`: Tamaño del videojuego en GB.
     - `fechaLanzamiento`: Fecha de lanzamiento del videojuego.

### 3. **Accesorio**
- **Descripción**: Almacena los datos de los accesorios para consolas y videojuegos.

| PK | FK | Campo          | Tipo         |
|----|----|----------------|--------------|
| PK |    | idAccesorio    | INTEGER      |
|    | FK | idProducto     | INTEGER      |
|    | FK | idTipoAccesorio| INTEGER      |
|    | FK | idMarca        | INTEGER      |
|    |    | color          | VARCHAR(50)  |

   - **Atributos**:
     - `idAccesorio`: Identificador único del accesorio.
     - `idProducto`: Relación con la tabla de productos.
     - `idTipoAccesorio`: Relación con el tipo de accesorio (por ejemplo, mando, auriculares).
     - `idMarca`: Marca del accesorio.
     - `color`: Color del accesorio.

### 4. **Consola**
 **Descripción**: Contiene la información sobre las consolas disponibles.

| PK | FK | Campo           | Tipo         |
|----|----|-----------------|--------------|
| PK |    | idConsola       | INTEGER      |
|    | FK | idProducto      | INTEGER      |
|    |    | almacenamiento  | INTEGER      |
|    |    | fechaLanzamiento| DATE         |
|    |    | procesador      | VARCHAR(100) |

   - **Atributos**:
     - `idConsola`: Identificador único de la consola.
     - `idProducto`: Relación con la tabla de productos.
     - `almacenamiento`: Capacidad de almacenamiento de la consola.
     - `fechaLanzamiento`: Fecha en la que fue lanzada al mercado.
     - `procesador`: Procesador que utiliza la consola.


### 5. **Empleado**
 - **Descripción**: Representa a los empleados que trabajan en la tienda.

| PK | FK | Campo            | Tipo         |
|----|----|------------------|--------------|
| PK |    | idEmpleado       | INTEGER      |
|    | FK | idPuesto         | INTEGER      |
|    |    | nombre           | VARCHAR(255) |
|    |    | fechaContratacion| DATE         |

   - **Atributos**:
     - `idEmpleado`: Identificador único del empleado.
     - `idPuesto`: Relación con el puesto del empleado dentro de la tienda.
     - `nombre`: Nombre del empleado.
     - `fechaContratacion`: Fecha en la que fue contratado.

### 6. **Venta**
 - **Descripción**: Almacena la información relacionada con las ventas realizadas en la tienda.

| PK | FK | Campo       | Tipo         |
|----|----|-------------|--------------|
| PK |    | idVenta     | INTEGER      |
|    | FK | idCliente   | INTEGER      |
|    | FK | idEmpleado  | INTEGER      |
|    |    | fecha       | DATETIME     |

   - **Atributos**:
     - `idVenta`: Identificador único de la venta.
     - `idCliente`: Relación con el cliente que realizó la compra.
     - `idEmpleado`: Relación con el empleado que atendió la venta.
     - `fecha`: Fecha y hora en la que se realizó la venta.


### 7. **Cliente**
 - **Descripción**: Almacena la información de los clientes que realizan compras en la tienda.

| PK | FK | Campo      | Tipo         |
|----|----|------------|--------------|
| PK |    | idCliente  | INTEGER      |
|    | FK | idDireccion| INTEGER      |
|    |    | nombre     | VARCHAR(255) |
|    |    | email      | VARCHAR(100) |
|    |    | telefono   | CHAR(10)     |

   - **Atributos**:
     - `idCliente`: Identificador único del cliente.
     - `nombre`: Nombre completo del cliente.
     - `email`: Dirección de correo electrónico del cliente.
     - `telefono`: Número de teléfono de contacto.
     - `idDireccion`: Relación con la dirección del cliente.

### 8. **Proveedor**
- **Descripción**: Almacena la información de los proveedores que suministran los productos a la tienda.


| PK | FK | Campo       | Tipo         |
|----|----|-------------|--------------|
| PK |    | idProveedor | INTEGER      |
|    |    | empresa     | VARCHAR(255) |
|    |    | telefono    | CHAR(10)     |
|    | FK | idDireccion | INTEGER      |

   - **Atributos**:
     - `idProveedor`: Identificador único del proveedor.
     - `empresa`: Nombre de la empresa proveedora.
     - `telefono`: Número de contacto del proveedor.
     - `idDireccion`: Relación con la dirección del proveedor.

### 9. **Compatibilidad**
   - **Descripción**: Relaciona los accesorios y consolas para determinar su compatibilidad.

| PK | FK | Campo              | Tipo         |
|----|----|--------------------|--------------|
| PK |    | idCompatibilidad    | INTEGER      |
|    | FK | idAccesorio        | INTEGER      |
|    | FK | idConsola          | INTEGER      |

   - **Atributos**:
     - `idCompatibilidad`: Identificador único de la compatibilidad.
     - `idAccesorio`: Relación con la tabla de accesorios.
     - `idConsola`: Relación con la tabla de consolas.

### 10. **Categoría**
   - **Descripción**: Almacena las categorías a las que pertenecen los productos (por ejemplo, videojuegos, consolas, accesorios).

| PK | FK | Campo        | Tipo         |
|----|----|--------------|--------------|
| PK |    | idCategoria  | INTEGER      |
|    |    | nombre       | VARCHAR(255) |

   - **Atributos**:
     - `idCategoria`: Identificador único de la categoría.
     - `nombre`: Nombre de la categoría.

### 11. **Clasificación**
   - **Descripción**: Contiene las clasificaciones por edad de los videojuegos.

| PK | FK | Campo          | Tipo         |
|----|----|----------------|--------------|
| PK |    | idClasificacion| INTEGER      |
|    |    | nombre         | VARCHAR(255) |

   - **Atributos**:
     - `idClasificacion`: Identificador único de la clasificación.
     - `nombre`: Nombre de la clasificación (por ejemplo, PEGI 18, ESRB Mature).

### 12. **Género**
   - **Descripción**: Almacena los diferentes géneros de videojuegos (por ejemplo, acción, aventura, RPG).

| PK | FK | Campo      | Tipo         |
|----|----|------------|--------------|
| PK |    | idGenero   | INTEGER      |
|    |    | nombre     | VARCHAR(255) |

   - **Atributos**:
     - `idGenero`: Identificador único del género.
     - `nombre`: Nombre del género.

### 13. **Orden**
   - **Descripción**: Representa las órdenes de compra que la tienda realiza a los proveedores para abastecerse de productos.

| PK | FK | Campo     | Tipo         |
|----|----|-----------|--------------|
| PK |    | idOrden   | INTEGER      |
|    | FK | idProveedor| INTEGER      |
|    |    | fecha     | DATE         |

   - **Atributos**:
     - `idOrden`: Identificador único de la orden.
     - `idProveedor`: Relación con el proveedor.
     - `fecha`: Fecha en la que se realizó la orden.

## Tablas Intermedias

### 1. PlataformaxVideojuego

| Campo                      | Tipo                 | Descripción                                   |
|----------------------------|----------------------|-----------------------------------------------|
| idPlataformaxVideojuego    | INT (PK)            | Identificador único para la relación.         |
| idVideojuego               | INT (FK)            | Identificador del videojuego (relacionado con `Videojuego`). |
| idPlataforma               | INT (FK)            | Identificador de la plataforma (relacionado con `Plataforma`). |

### 2. GeneroxVideojuego

| Campo                      | Tipo                 | Descripción                                   |
|----------------------------|----------------------|-----------------------------------------------|
| idGeneroxVideojuego        | INT (PK)            | Identificador único para la relación.         |
| idVideojuego               | INT (FK)            | Identificador del videojuego (relacionado con `Videojuego`). |
| idGenero                   | INT (FK)            | Identificador del género (relacionado con `Genero`). |

### 3. Compatibilidad

| Campo                      | Tipo                 | Descripción                                   |
|----------------------------|----------------------|-----------------------------------------------|
| idCompatibilidad            | INT (PK)            | Identificador único para la relación.         |
| idAccesorio                | INT (FK)            | Identificador del accesorio (relacionado con `Accesorio`). |
| idConsola                  | INT (FK)            | Identificador de la consola (relacionado con `Consola`). |

### 4. ProductoxVenta

| Campo                      | Tipo                 | Descripción                                   |
|----------------------------|----------------------|-----------------------------------------------|
| idProductoxVenta           | INT (PK)            | Identificador único para la relación.         |
| idProducto                 | INT (FK)            | Identificador del producto (relacionado con `Producto`). |
| idVenta                    | INT (FK)            | Identificador de la venta (relacionado con `Venta`). |

### 5. ProductoxOrden

| Campo                      | Tipo                 | Descripción                                   |
|----------------------------|----------------------|-----------------------------------------------|
| idProductoxOrden           | INT (PK)            | Identificador único para la relación.         |
| idProducto                 | INT (FK)            | Identificador del producto (relacionado con `Producto`). |
| idOrden                    | INT (FK)            | Identificador de la orden (relacionado con `Orden`). |

## Estructura del Proyecto

### Ingenieria Inversa

La estructura del proyecto fue diseñada utilizando la ingeniería inversa en MySQL Workbench, lo que permitió obtener un esquema visual y detallado de las tablas y sus relaciones. A continuación, se presenta una descripción de las tablas principales y sus interconexiones.

![Ingenieria Inversa](<Ingenieria.png>)

## Consultas

Este proyecto contiene 10 consultas SQL que interactúan con la base de datos de Tienda de Videojuegos. A continuación se presentan las consultas en una funcion o prodecimiento junto con una breve descripción y una captura de pantalla con los resultados de la ejecución de cada consulta.

## Consultas y Resultados

### 1. Listar todos los videojuegos de una plataforma específica (por ejemplo, "PlayStation").

Descripción: 

```sql

```
### 2. Obtener todos los productos en una categoría (videojuegos, consolas o accesorios) cuyo stock sea inferior a un valor dado.

Descripción: 

```sql

```

### 3. Mostrar todas las ventas realizadas por un cliente específico en un rango de fechas.

Descripción: 

```sql

```

### 4. Calcular el total de ventas de un empleado en un mes dado.

Descripción: 
```sql

```

### 5. Listar los productos más vendidos en un período determinado.

Descripción: 

```sql

```

### 6. Consultar el stock disponible de un producto por su nombre.

Descripción: 

```sql

```

### 7. Mostrar las órdenes de compra realizadas a un proveedor específico en el último año.

Descripción: 

```sql

```

### 8. Listar los empleados que han trabajado más de un año en la tienda.

Descripción: 

```sql

```

### 9. Obtener la cantidad total de productos vendidos en un día específico.

Descripción: 

```sql

```

### 10. Consultar las ventas de un producto específico (por nombre o ID) y cuántas unidades se vendieron.

Descripción: 

```sql

```

## Tecnologías 🤖
Tecnologías usadas en este proyecto:
MySQL

## Instalación 📦
Descargar el código: Clona el repositorio desde el enlace proporcionado en GitHub usando el comando git clone <https://github.com/MichelAdrianTorradoRoa/Tienda_de_Videojuegos.git>.

Abrir en un cliente MySQL: Abre el archivo SQL del esquema y ejecútalo en un cliente MySQL como phpMyAdmin o MySQL Workbench para crear la base de datos y las tablas.

Cargar datos: Utiliza los scripts de inserciones para cargar datos iniciales en las tablas.

Ejecutar consultas: Utiliza las consultas proporcionadas para interactuar con la base de datos y extraer información útil.

## Autores 🐦‍🔥

Hecho por [@JoanSebastianRuiz](https://github.com/JoanSebastianRuiz),[@JuanJTorresB](https://github.com/JuanJTorresB) y [@MichelAdrianTorradoRoa](https://github.com/MichelAdrianTorradoRoa).