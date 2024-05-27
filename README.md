# Sistema de Inventario para la Tienda de Oscar Ochoa

## Descripción del Proyecto

La tienda de Oscar Ochoa enfrenta varios desafíos en la gestión de su inventario. Actualmente, la tienda utiliza un sistema manual para registrar la entrada y salida de productos, lo que ocasiona múltiples problemas:

- **Errores Humanos**: El registro manual es propenso a errores como la duplicación de entradas, omisión de ventas y actualización incorrecta de cantidades.
- **Falta de Visibilidad del Stock**: No existe una manera eficiente de saber en tiempo real la cantidad de productos disponibles, lo que puede llevar a situaciones de sobrestock o desabastecimiento.
- **Dificultad para Realizar Ventas**: La falta de un sistema centralizado hace que el proceso de ventas sea lento y propenso a errores, afectando la experiencia del cliente.
- **Reportes Inexactos**: Generar reportes precisos del inventario y las ventas es un proceso complicado y consume mucho tiempo, lo que impide tomar decisiones informadas a tiempo.

## Propuesta de Solución

Para solucionar estos problemas, se ha desarrollado un **Sistema de Inventario Automatizado**. Este sistema tiene como objetivo mejorar la eficiencia y precisión en la gestión del inventario de la tienda de Oscar Ochoa. La solución propuesta incluye las siguientes funcionalidades:

1. **Gestión de Inventario**: Permite a los empleados agregar, actualizar y eliminar productos del inventario de manera sencilla y rápida.
2. **Registro de Ventas**: Facilita el registro de ventas, actualizando automáticamente el inventario y generando comprobantes de venta.
3. **Generación de Reportes**: Permite generar reportes en tiempo real del stock actual, ayudando en la toma de decisiones sobre reposición de productos y gestión de inventario.
4. **Control de Acceso**: Diferenciación de roles entre empleados y administradores, donde los administradores pueden gestionar permisos y configurar el sistema.

## Beneficios del Sistema Propuesto

Implementar este sistema en la tienda de Oscar Ochoa proporcionará varios beneficios:

- **Reducción de Errores**: Al automatizar el registro de inventario y ventas, se disminuyen significativamente los errores humanos.
- **Visibilidad en Tiempo Real**: Los empleados podrán ver el stock disponible en tiempo real, mejorando la eficiencia en la reposición de productos y evitando desabastecimientos.
- **Mejora en el Proceso de Ventas**: Con un sistema centralizado, el proceso de ventas será más rápido y preciso, mejorando la experiencia del cliente.
- **Reportes Precisos**: Los reportes automáticos y precisos permitirán a Oscar Ochoa tomar decisiones informadas sobre el inventario y las ventas, optimizando la gestión de su tienda.

## Estructura del Proyecto

El proyecto está estructurado en varios módulos, cada uno responsable de una funcionalidad específica:

- **Producto**: Gestión de productos en el inventario.
- **Venta**: Registro de ventas y actualización del inventario.
- **Empleado**: Gestión de usuarios del sistema.
- **Reporte**: Generación de reportes de stock.

## Modelo Relacional de la Base de Datos

La base de datos del sistema está diseñada con las siguientes tablas:

- **Producto**
  - id (PK)
  - nombre
  - descripcion
  - precio
  - cantidad

- **Venta**
  - id (PK)
  - fecha
  - total
  - id_empleado (FK)

- **Empleado**
  - id (PK)
  - nombre
  - rol

- **Reporte**
  - id (PK)
  - fecha

- **VentaProducto**
  - id_venta (PK, FK)
  - id_producto (PK, FK)
  - cantidad
  - subtotal

## Consultas SQL de Ejemplo

1. **Insertar producto()**
    ```sql
    INSERT INTO Producto (nombre, descripcion, precio, cantidad)
    VALUES ('Producto A', 'Descripción del Producto A', 10.99, 100);
    ```

2. **Actualizar el stock del producto()**
    ```sql
    UPDATE Producto
    SET cantidad = cantidad - 5
    WHERE id = 1;
    ```

3. **Registrar venta()**
    ```sql
    INSERT INTO Venta (fecha, total, id_empleado)
    VALUES (NOW(), 54.95, 1);

    INSERT INTO VentaProducto (id_venta, id_producto, cantidad, subtotal)
    VALUES (LAST_INSERT_ID(), 1, 5, 54.95);
    ```

4. **Generar reporte de stock()**
    ```sql
    SELECT id, nombre, cantidad
    FROM Producto;
    ```

5. **Consultar todas las ventas realizadas por un empleado()**
    ```sql
    SELECT V.id, V.fecha, V.total
    FROM Venta V
    JOIN Empleado E ON V.id_empleado = E.id
    WHERE E.id = 1;
    ```
