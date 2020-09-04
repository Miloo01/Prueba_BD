--Parte 2: Creando el modelo en la base de datos---

--Se debe crear el modelo en la base de datos, en una base de datos llamada prueba, e insertar los siguientes registros
CREATE DATABASE prueba;

--\c prueba;

--TABLA FACTURAS
CREATE TABLE facturas(id SERIAL INT PRIMARY KEY, fecha_de_factura DATE, subtotal FLOAT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL);

--TABLA CLIENTES
CREATE TABLE clientes(id SERIAL PRIMARY KEY, nombre VARCHAR(100) UNIQUE,rut VARCHAR(15),direccion VARCHAR(150));

-- TABLA CATEGORIAS
CREATE TABLE categorias(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL UNIQUE, descripcion VARCHAR(150));

-- TABLA PRODUCTOS
CREATE TABLE productos(id SERIAL PRIMARY KEY, nombre VARCHAR(100),descripcion VARCHAR(150),valor_unitario FLOAT,categoria_id INT);







--5 clientes-

--8 productos--


--3 categorias--


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

