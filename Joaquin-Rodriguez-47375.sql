DROP DATABASE IF EXISTS DBrealstate;

CREATE DATABASE DBrealstate;
USE DBrealstate; 

-- DROP TABLE IF EXISTS tenant;
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

-- DROP TABLE IF EXISTS owner;
CREATE TABLE IF NOT EXISTS owner(
id_owner INT AUTO_INCREMENT COMMENT "id owner",
first_name varchar(25) NOT NULL  COMMENT "name owner",
last_name VARCHAR (25) NOT NULL COMMENT "last name owner",
email VARCHAR(100) COMMENT "email owner",
phone INT NOT NULL COMMENT "phone owner",
age INT NOT NULL COMMENT "age owner",
quantity_properties INT NOT NULL COMMENT "quantity properties",
id_seller INT COMMENT "id seller",
id_property INT COMMENT "id property",
CONSTRAINT `PK_owner` PRIMARY KEY (id_owner) COMMENT "Primary key"
)COMMENT "table owner";

-- DROP TABLE IF EXISTS seller;
CREATE TABLE IF NOT EXISTS seller(
id_seller INT AUTO_INCREMENT COMMENT "id seller",
first_name varchar(25) NOT NULL  COMMENT "name seller",
last_name VARCHAR (25) NOT NULL COMMENT "last name seller",
email VARCHAR(100) COMMENT "email seller",
phone INT NOT NULL COMMENT "phone seller",
sales INT NOT NULL COMMENT "total sales seller",
rating FLOAT NOT NULL COMMENT "rating sales",
id_saleDetail INT COMMENT "id sale detail",
id_rentalDetail INT COMMENT "id rental detail",
CONSTRAINT `PK_seller` PRIMARY KEY (id_seller) COMMENT "Primary key"
)COMMENT "table seller";

-- DROP TABLE IF EXISTS property;
CREATE TABLE IF NOT EXISTS property(
id_property INT AUTO_INCREMENT COMMENT "id property",
sale BOOLEAN NOT NULL COMMENT "¿property sale?",
retal BOOLEAN NOT NULL COMMENT "¿property rental?",
environments INT NOT NULL COMMENT "quantity environments",
bathrooms INT NOT NULL COMMENT "quantity bathrooms",
kitchens INT NOT NULL COMMENT "quantity kitchens",
garden BOOLEAN NOT NULL COMMENT "property garden",
bedrooms INT NOT NULL COMMENT "quantity bedrooms",
id_rentalDetail INT COMMENT"id rental detail",
id_saleDetail INT COMMENT"id sale detail",
id_localDetail INT COMMENT "id local detail",
CONSTRAINT `PK_property` PRIMARY KEY (id_property) COMMENT "Primary key"
)COMMENT "table property";

-- DROP TABLE IF EXISTS sale_detail;
CREATE TABLE IF NOT EXISTS sale_detail(
id_sale_detail INT AUTO_INCREMENT COMMENT "id sale_detail",
sale BOOLEAN NOT NULL COMMENT "¿property sale?",
value FLOAT COMMENT "value sale",
CONSTRAINT `PK_sale_detail` PRIMARY KEY (id_sale_detail) COMMENT "Primary key"
)COMMENT "table detail sale";

-- DROP TABLE IF EXISTS rental_detail;
CREATE TABLE IF NOT EXISTS rental_detail(
id_rental_detail INT AUTO_INCREMENT COMMENT "id rental_detail",
rental BOOLEAN NOT NULL COMMENT "¿property rental?",
value FLOAT COMMENT "value rental",
value_inscription FLOAT COMMENT "value inscription",
guarantor BOOLEAN NOT NULL COMMENT"guarantor property",
CONSTRAINT `PK_rental_detail` PRIMARY KEY (id_rental_detail) COMMENT "Primary key"
)COMMENT "table detail rental";

-- DROP TABLE IF EXISTS local_detail;
CREATE TABLE IF NOT EXISTS local_detail(
id_local_detail INT AUTO_INCREMENT COMMENT "id local_detail",
address VARCHAR(25) NOT NULL COMMENT "address of property",
number_property INT NOT NULL COMMENT "number property",
CONSTRAINT `PK_local_detail` PRIMARY KEY (id_local_detail) COMMENT "Primary key"
)COMMENT "table detail local";

-- DROP TABLE IF EXISTS location;
CREATE TABLE IF NOT EXISTS location(
id_location INT AUTO_INCREMENT COMMENT "id location",
province VARCHAR(25) NOT NULL COMMENT "province of property",
country VARCHAR(25) NOT NULL COMMENT "country of property",
departmanet VARCHAR(25) NOT NULL COMMENT "departament of property",
id_localDetail INT COMMENT "id local_detail",
CONSTRAINT `PK_location` PRIMARY KEY (id_location) COMMENT "Primary key"
)COMMENT "table location";


-- Referencia FK a la tabla tenant
ALTER TABLE tenant
ADD CONSTRAINT FK_tenant_seller FOREIGN KEY (id_seller)
REFERENCES seller(id_seller);

-- Referencias FK a la tabla owner
ALTER TABLE owner
ADD CONSTRAINT FK_owner_seller FOREIGN KEY (id_seller)
REFERENCES seller(id_seller);

ALTER TABLE owner
ADD CONSTRAINT FK_owner_property FOREIGN KEY (id_property)
REFERENCES property(id_property);

-- referencias FK a la tabla property
ALTER TABLE property
ADD CONSTRAINT FK_property_sale FOREIGN KEY (id_saleDetail)
REFERENCES sale_detail(id_sale_detail);

ALTER TABLE property
ADD CONSTRAINT FK_property_rental FOREIGN KEY (id_rentalDetail)
REFERENCES rental_detail(id_rental_detail);

ALTER TABLE property
ADD CONSTRAINT FK_property_local FOREIGN KEY (id_localDetail)
REFERENCES local_detail(id_local_detail);

-- Referencia FK a la tabla seller
ALTER TABLE seller
ADD CONSTRAINT FK_seller_sale FOREIGN KEY (id_saleDetail)
REFERENCES sale_detail(id_sale_detail);

ALTER TABLE seller
ADD CONSTRAINT FK_seller_rental FOREIGN KEY (id_rentalDetail)
REFERENCES rental_detail(id_rental_detail);

-- Referencia FK a la tabla local_detail
ALTER TABLE location
ADD CONSTRAINT FK_location_local FOREIGN KEY (id_localDetail)
REFERENCES local_detail(id_local_detail);