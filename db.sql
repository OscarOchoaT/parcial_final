CREATE TABLE Empleado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    rol VARCHAR(20)
);

CREATE TABLE Producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    cantidad INT
);

CREATE TABLE Venta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME,
    total DECIMAL(10, 2),
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id)
);

CREATE TABLE Reporte (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATETIME
);

CREATE TABLE VentaProducto (
    id_venta INT,
    id_producto INT,
    cantidad INT,
    subtotal DECIMAL(10, 2),
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES Venta(id),
    FOREIGN KEY (id_producto) REFERENCES Producto(id)
);
