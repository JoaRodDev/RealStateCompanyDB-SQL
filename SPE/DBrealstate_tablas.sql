# Creación de las views de mi base de datos

# Primero creo la base de datos y la cargo de datos

DROP DATABASE IF EXISTS DBrealstate;

CREATE DATABASE DBrealstate;
USE DBrealstate; 

DROP TABLE IF EXISTS tenant;
CREATE TABLE IF NOT EXISTS tenant(
id_tenant INT AUTO_INCREMENT COMMENT "id tenant",
first_name varchar(25) NOT NULL  COMMENT "name tenant",
last_name VARCHAR (25) NOT NULL COMMENT "last name tenant",
email VARCHAR(100) COMMENT "email tenant",
phone INT NOT NULL COMMENT "phone tenant",
age INT NOT NULL COMMENT "age tenant",
civil_status VARCHAR(25) NOT NULL COMMENT "civil status",
childrens BOOLEAN NOT NULL COMMENT "childrens",
id_seller INT COMMENT "id seller",
CONSTRAINT `PK_tenant` PRIMARY KEY (id_tenant) COMMENT "Primary key"
)COMMENT "table tenant";

DROP TABLE IF EXISTS owner;
CREATE TABLE IF NOT EXISTS owner(
id_owner INT AUTO_INCREMENT COMMENT "id owner",
first_name varchar(25) NOT NULL  COMMENT "name owner",
last_name VARCHAR (25) NOT NULL COMMENT "last name owner",
email VARCHAR(100) COMMENT "email owner",
phone INT NOT NULL COMMENT "phone owner",
age INT NOT NULL COMMENT "age owner",
quantity_properties INT NOT NULL COMMENT "quantity properties",
id_seller INT COMMENT "id seller",
CONSTRAINT `PK_owner` PRIMARY KEY (id_owner) COMMENT "Primary key"
)COMMENT "table owner";

DROP TABLE IF EXISTS seller;
CREATE TABLE IF NOT EXISTS seller(
id_seller INT AUTO_INCREMENT COMMENT "id seller",
first_name varchar(25) NOT NULL  COMMENT "name seller",
last_name VARCHAR (25) NOT NULL COMMENT "last name seller",
email VARCHAR(100) COMMENT "email seller",
phone INT NOT NULL COMMENT "phone seller",
sales INT NOT NULL COMMENT "total sales seller",
rating FLOAT NOT NULL COMMENT "rating sales",
CONSTRAINT `PK_seller` PRIMARY KEY (id_seller) COMMENT "Primary key"
)COMMENT "table seller";

DROP TABLE IF EXISTS property;
CREATE TABLE IF NOT EXISTS property(
id_property INT AUTO_INCREMENT COMMENT "id property",
sale BOOLEAN NOT NULL COMMENT "¿property sale?",
retal BOOLEAN NOT NULL COMMENT "¿property rental?",
environments INT NOT NULL COMMENT "quantity environments",
bathrooms INT NOT NULL COMMENT "quantity bathrooms",
kitchens INT NOT NULL COMMENT "quantity kitchens",
garden BOOLEAN NOT NULL COMMENT "property garden",
bedrooms INT NOT NULL COMMENT "quantity bedrooms",
id_operation_detail INT COMMENT"id sale detail",
id_location INT COMMENT "id location property",
id_owner INT NOT NULL COMMENT "id owner property",
CONSTRAINT `PK_property` PRIMARY KEY (id_property) COMMENT "Primary key"
)COMMENT "table property";

DROP TABLE IF EXISTS operation_detail;
CREATE TABLE IF NOT EXISTS operation_detail(
id_operation_detail INT AUTO_INCREMENT COMMENT "id operation",
is_sale BOOLEAN NOT NULL COMMENT "property sale: yes or not",
is_rent BOOLEAN NOT NULL COMMENT "property rental: yes or not",
value_rent FLOAT COMMENT "value rental",
value_sale FLOAT COMMENT "value sale",
rent_start DATE COMMENT "date start rental property",
rent_end DATE COMMENT "date end rental property",
sale_date DATE COMMENT "date sale property",
value_inscription FLOAT COMMENT "value inscription",
id_guarantor INT COMMENT"id guarantor operation",
id_seller INT NOT NULL COMMENT "id seller reference",
CONSTRAINT `PK_operation_detail` PRIMARY KEY (id_operation_detail) COMMENT "Primary key"
)COMMENT "table operation_detail";

DROP TABLE IF EXISTS location;
CREATE TABLE IF NOT EXISTS location(
id_location INT AUTO_INCREMENT COMMENT "id location",
province VARCHAR(25) NOT NULL COMMENT "province of property",
country VARCHAR(25) NOT NULL COMMENT "country of property",
department VARCHAR(25) NOT NULL COMMENT "departament of property",
CONSTRAINT `PK_location` PRIMARY KEY (id_location) COMMENT "Primary key"
)COMMENT "table location";

DROP TABLE IF EXISTS guarantor;
CREATE TABLE IF NOT EXISTS guarantor(
id_guarantor INT AUTO_INCREMENT COMMENT "id guarantor",
first_name VARCHAR(25) NOT NULL COMMENT "first name guarantor",
last_name VARCHAR(25) NOT NULL COMMENT "last name guarantor",
id_tenant INT NOT NULL COMMENT "guarantor of tenant",
id_property INT NOT NULL COMMENT "guarantor of property",
CONSTRAINT `PK_location` PRIMARY KEY (id_guarantor) COMMENT "Primary key"
)COMMENT "table guarantor";