--Parte 2: Creando el modelo en la base de datos---

--Se debe crear el modelo en la base de datos, en una base de datos llamada prueba, e insertar los siguientes registros
CREATE DATABASE prueba;

--\c prueba;

--TABLA FACTURAS
CREATE TABLE facturas(id SERIAL PRIMARY KEY, fecha_de_factura DATE, subtotal FLOAT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL);

--TABLA CLIENTES
CREATE TABLE clientes(id SERIAL PRIMARY KEY, nombre VARCHAR(100) UNIQUE,rut VARCHAR(15),direccion VARCHAR(150));

-- TABLA CATEGORIAS
CREATE TABLE categorias(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL UNIQUE, descripcion VARCHAR(150));

-- TABLA PRODUCTOS
CREATE TABLE productos(id SERIAL PRIMARY KEY, nombre VARCHAR(100),descripcion VARCHAR(150),valor_unitario FLOAT,categoria_id INT);

-- TABLA FACPRO

CREATE TABLE facpro(factura_id INT, producto_id INT, FOREIGN KEY(factura_id) REFERENCES facturas(id), FOREIGN KEY(producto_id) REFERENCES productos(id), cantidad INT);


-- CLIENTES_FACTURA
CREATE TABLE clientes_factura(cliente_id INT NOT NULL, factura_id INT NOT NULL, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(factura_id) REFERENCES facturas(id));

-- POBLAR DATA INTO TABLES

--5 clientes-

INSERT INTO clientes(nombre, rut, direccion) VALUES
('Jaimito Ahumada',12122345-4, 'Nonato coo 7772,la florida'),
('Viviana Castan', 14677543-9, 'Portugal 666, Santiago centro'),
('Alex Silva', 17365321-1, 'Las tertutlias 345, depto 24, Las condes'),
('Isa Humble', 22457123-8, 'Calle condamine 51, Balgowlah'),
('Rose Doherty', 24776872-2, 'Avenida sunshine coast 21, Australia');

--ver tabla SELECT * FROM clientes;

-- 8 producto nombrey 3 categorías(1=videojueos, 2=consolas, 3=peluches)

-- id, producto nombre : categoria_id
-- 1, Doom = 1 ---
-- 2, Gt5 = 1 ---
-- 3, Ps4 = 2 ---
-- 4, Xbox X = 2 ---
-- 5, Nintendo U = 2 ---
-- 6, Capitan america = 3 --
-- 7, Batman = 3 --
-- 8, Superman = 3 --


--facturas, facturas_id,    productos_id    prod_id
    --1,         1          1+2 = 3000      2
    --1,         2          3+4+5= 35000    3
    --2,         3          2+6= 3500       6
    --2,         4          8+7= 1000       8
    --2,         5          6+7+8= 1500     7
    --3,         6          5= 5000         5
    --4,         7          6+4= 20500      4
    --4,         8          3+4+5= 35000    3    
    --4,         9          1+2+7+8= 4000   1
    --4,         10         3= 10000        3


INSERT INTO productos(nombre, descripcion, valor_unitario,categoria_id) VALUES
('Doom','juego de accion primera persona', 1000, 1),
('Gran Turismo 5','simulacion de conduccion carreras', 2000, 1),
('Play station 4','consola videojuegos sony', 10000, 2),
(' Xbox X','consola videojuegos microsoft', 20000, 2),
('Nintendo U','consola videojuegos nintendo', 5000, 2),
('Capitan America','figura de accion', 500, 3),
('Batman','figura de accion', 500, 3),
('Superman','figura de accion', 500, 3);

INSERT INTO categorias(nombre, descripcion) VALUES
('videojuegos','juegos'),
('consolas', 'videojuegos entretencion'),
('peluches', ' figuras de accion');

--10 facturas--

--2 facturas para el cliente 1, con 2 y 3 productos--
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-06', 3000, 570, 3570);
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-06', 35000, 6650, 41650);

----3 facturas para el cliente 2, con 3, 2 y 3 productos--
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-05', 3500, 665, 4165);
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-05', 1000, 190, 1190);
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-04', 1500, 285, 1785);

--1 factura para el cliente 3, con 1 producto---
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-04', 5000, 950, 5950);


--4 facturas para el cliente 4, con 2, 3, 4 y 1 producto--
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-03', 20500, 3895, 24395);
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-03', 35000, 6650, 41650);
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-02', 4000, 760, 4760);
INSERT INTO facturas(fecha_de_factura, subtotal, iva, precio_total) VALUES('2020-09-01', 10000, 1900, 11900);

--ver tabla--
--SELECT * FROM facturas;



INSERT INTO clientes_factura(cliente_id, factura_id) VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(2,5),
(3,6),
(4,7),
(4,8),
(4,9),
(4,10); 


INSERT INTO facpro(factura_id, producto_id, cantidad) VALUES
(1,2,1),
(2,3,1),
(3,6,1),
(4,8,1),
(5,7,1),
(6,5,1),
(7,4,1),
(8,3,1),
(9,1,1),
(10,3,1);

--Parte 3: --
--ConsultasRealizar las siguientes consultas:

ALTER TABLE productos DROP COLUMN categoria_id;

--¿Que cliente realizó la compra más cara?

SELECT nombre FROM clientes JOIN clientes_factura ON clientes.id=clientes_factura.cliente_id JOIN facturas ON facturas.id=clientes_factura.factura_id ORDER BY(precio_total) DESC LIMIT(1);

--¿Que cliente pagó sobre 100 de monto?

SELECT nombre FROM clientes JOIN clientes_factura ON clientes.id=clientes_factura.cliente_id JOIN facturas ON facturas.id=clientes_factura.factura_id WHERE precio_total > 100 GROUP BY(nombre);


--¿Cuantos clientes han comprado el producto 6.
SELECT count(nombre) FROM clientes JOIN clientes_factura ON clientes.id=clientes_factura.cliente_id JOIN facturas ON facturas.id=clientes_factura.factura_id JOIN facpro ON facturas.id=facpro.factura_id WHERE producto_id=6;
