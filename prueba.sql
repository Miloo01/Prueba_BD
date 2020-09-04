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

--8 productos y 3 categorías(1=videojueos, 2=consolas, 3=peluches, 4=tecladosycomputacion)

INSERT INTO productos(nombre, descripcion, valor_unitario,categoria_id) VALUES
('Doom','juego de accion primera persona', 1000, 1),
('Gran Turismo 5','simulacion de conduccion carreras', 2000, 1),
('Play station 4','consola videojuegos sony', 10000, 2),
(' Xbox X','consola videojuegos microsoft', 20000, 2),
('Nintendo U','consola videojuegos nintendo', 5000, 2),
('Capitan America','figura de accion', 500, 3),
('Batman','figura de accion', 500, 3),
('Teclado gamer','teclado ergonomico para videojuegos', 2000, 4);

--10 facturas--


--2 para el cliente 1, con 2 y 3 productos--

--3 para el cliente 2, con 3, 2 y 3 productos--

--1 para el cliente 3, con 1 producto--


--4 para el cliente 4, con 2, 3, 4 y 1 producto--





--Parte 3: --
--ConsultasRealizar las siguientes consultas:

--¿Que cliente realizó la compra más cara?


--¿Que cliente pagó sobre 100 de monto?


--¿Cuantos clientes han comprado el producto 6.

