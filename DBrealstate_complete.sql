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

-- Mensaje que retorna error que pasemos por parametro
DROP FUNCTION IF EXISTS FN_ERROR;
DELIMITER $$
CREATE FUNCTION FN_ERROR(
	P_message VARCHAR(250)
)
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
    DECLARE message_error VARCHAR(250);

    SET message_error = P_message;
    
    RETURN message_error;
END$$
DELIMITER ;

-- Tabla log auditoría de insert de datos de una tabla
DROP TABLE IF EXISTS LOG_audit_create;
CREATE TABLE IF NOT EXISTS LOG_audit_create(
	id_log INT AUTO_INCREMENT ,
	name_action VARCHAR(10) ,
	name_table VARCHAR(50) ,
	user VARCHAR(100) ,
	date_action DATE ,
    time_action TIME,
    PRIMARY KEY (id_log)
) ;

-- Tabla log auditoría de actualización o eliminación dentro de una tabla
DROP TABLE IF EXISTS LOG_audit_action;
CREATE TABLE IF NOT EXISTS LOG_audit_action(
	id_log INT AUTO_INCREMENT,
	name_field VARCHAR(50) DEFAULT NULL,
	id_table  INT NOT NULL,
	new_field_old_field VARCHAR(100),
	name_action VARCHAR(10),
	name_table VARCHAR(50),
	user VARCHAR(100),
	date_action DATE,
    time_action TIME,
	PRIMARY KEY (ID_LOG)
) ;

# Triggers
USE DBrealstate;

-- TRIGGER INSERT: trigger para auditar insert de datos de la tabla seller
DROP TRIGGER IF EXISTS TRG_LOG_SELLER;
DELIMITER $$
CREATE TRIGGER TRG_LOG_SELLER AFTER INSERT ON DBrealstate.seller
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'seller' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

-- TRIGGER INSERT: trigger para auditar insert de datos de la tabla guarantor
DROP TRIGGER IF EXISTS TRG_LOG_GUARANTOR;
DELIMITER $$
CREATE TRIGGER TRG_LOG_GUARANTOR AFTER INSERT ON DBrealstate.guarantor
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'guarantor' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

-- TRIGGER INSERT: trigger para auditar insert de datos de la tabla location
DROP TRIGGER IF EXISTS TRG_LOG_LOCATION;
DELIMITER $$
CREATE TRIGGER TRG_LOG_LOCATION AFTER INSERT ON DBrealstate.location
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'location' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

-- TRIGGER INSERT: trigger para auditar insert de datos de la tabla operation_detail
DROP TRIGGER IF EXISTS TRG_LOG_OPERATION_DETAIL;
DELIMITER $$
CREATE TRIGGER TRG_LOG_OPERATION_DETAIL AFTER INSERT ON DBrealstate.operation_detail
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'operation_detail' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

-- TRIGGER INSERT: trigger para auditar insert de datos de la tabla owner
DROP TRIGGER IF EXISTS TRG_LOG_OWNER;
DELIMITER $$
CREATE TRIGGER TRG_LOG_OWNER AFTER INSERT ON DBrealstate.owner
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'owner' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

-- TRIGGER INSERT: trigger para auditar insert de datos de la tabla property
DROP TRIGGER IF EXISTS TRG_LOG_PROPERTY;
DELIMITER $$
CREATE TRIGGER TRG_LOG_PROPERTY AFTER INSERT ON DBrealstate.property
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'property' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

-- TRIGGER INSERT: trigger para auditar insert de datos de la tabla tenant
DROP TRIGGER IF EXISTS TRG_LOG_TENANT;
DELIMITER $$
CREATE TRIGGER TRG_LOG_TENANT AFTER INSERT ON DBrealstate.tenant
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'tenant' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

-- TRIGGER UPDATE: trigger para auditar update de datos en la tabla seller
DROP TRIGGER IF EXISTS TRG_LOG_SELLER_ACTION;
DELIMITER $$
CREATE TRIGGER TRG_LOG_SELLER_ACTION BEFORE UPDATE ON DBrealstate.seller
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field , id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.first_name, " NEW FIELD: ", NEW.first_name),
			OLD.id_seller,
            'UPDATE' ,
            'SELLER' ,
            CURRENT_USER(),
            CURDATE(), 
            CURTIME() ) ;
END$$
DELIMITER ;

-- TRIGGER UPDATE: trigger para auditar update de datos en la tabla guarantor
DROP TRIGGER IF EXISTS TRG_LOG_GUARANTOR_ACTION;
DELIMITER $$
CREATE TRIGGER TRG_LOG_GUARANTOR_ACTION BEFORE UPDATE ON DBrealstate.guarantor
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field , id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.first_name, " NEW FIELD: ", NEW.first_name),
			OLD.id_guarantor,
            'UPDATE' ,
            'GUARANTOR' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER UPDATE: trigger para auditar update de datos en la tabla property
DROP TRIGGER IF EXISTS TRG_LOG_PROPERTY_ACTION;
DELIMITER $$
CREATE TRIGGER TRG_LOG_PROPERTY_ACTION BEFORE UPDATE ON DBrealstate.property
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.sale, " NEW FIELD: ", NEW.sale),
			OLD.id_property,
            'UPDATE' ,
            'PROPERTY' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER UPDATE: trigger para auditar update de datos en la tabla location
DROP TRIGGER IF EXISTS TRG_LOG_LOCATION_ACTION;
DELIMITER $$
CREATE TRIGGER TRG_LOG_LOCATION_ACTION BEFORE UPDATE ON DBrealstate.location
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field , id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.province, " NEW FIELD: ", NEW.province),
			OLD.id_location,
            'UPDATE' ,
            'LOCATION' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER UPDATE: trigger para auditar update de datos en la tabla operation_detail
DROP TRIGGER IF EXISTS TRG_LOG_OPERATION_DETAIL_ACTION;
DELIMITER $$
CREATE TRIGGER TRG_LOG_OPERATION_DETAIL_ACTION BEFORE UPDATE ON DBrealstate.operation_detail
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field , id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.value_sale, " NEW FIELD: ", NEW.value_sale),
			OLD.id_operation_detail,
            'UPDATE' ,
            'OPERATION_DETAIL' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER UPDATE: trigger para auditar update de datos en la tabla owner
DROP TRIGGER IF EXISTS TRG_LOG_OWNER_ACTION;
DELIMITER $$
CREATE TRIGGER TRG_LOG_OWNER_ACTION BEFORE UPDATE ON DBrealstate.owner
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.first_name, " NEW FIELD: ", NEW.first_name),
			OLD.id_owner,
            'UPDATE' ,
            'OWNER' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER UPDATE: trigger para auditar update de datos en la tabla tenant
DROP TRIGGER IF EXISTS TRG_LOG_TENANT_ACTION;
DELIMITER $$
CREATE TRIGGER TRG_LOG_TENANT_ACTION BEFORE UPDATE ON DBrealstate.tenant
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("OLD FIELD: ", OLD.first_name, " NEW FIELD: ", NEW.first_name),
			OLD.id_tenant,
            'UPDATE' ,
            'TENANT' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER DELETE: trigger para auditar delete de datos en la tabla seller
DROP TRIGGER IF EXISTS TRG_LOG_SELLER_DELETE;
DELIMITER $$
CREATE TRIGGER TRG_LOG_SELLER_DELETE BEFORE DELETE ON DBrealstate.seller
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE SELLER: ", OLD.first_name),
			OLD.id_seller,
            'DELETE' ,
            'SELLER' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER DELETE: trigger para auditar delete de datos en la tabla guarantor
DROP TRIGGER IF EXISTS TRG_LOG_GUARANTOR_DELETE;
DELIMITER $$
CREATE TRIGGER TRG_LOG_GUARANTOR_DELETE BEFORE DELETE ON DBrealstate.guarantor
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE GUARANTOR: ", OLD.first_name),
			OLD.id_guarantor,
            'DELETE' ,
            'GUARANTOR' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER DELETE: trigger para auditar delete de datos en la tabla location
DROP TRIGGER IF EXISTS TRG_LOG_LOCATION_DELETE;
DELIMITER $$
CREATE TRIGGER TRG_LOG_LOCATION_DELETE BEFORE DELETE ON DBrealstate.location
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE LOCATION: ", OLD.province),
			OLD.id_location,
            'DELETE' ,
            'LOCATION' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER DELETE: trigger para auditar delete de datos en la tabla operation_detail
DROP TRIGGER IF EXISTS TRG_LOG_OPERATION_DETAIL_DELETE;
DELIMITER $$
CREATE TRIGGER TRG_LOG_OPERATION_DETAIL_DELETE BEFORE DELETE ON DBrealstate.operation_detail
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE OPERATION ID: ", OLD.id_operation_detail),
			OLD.id_operation_detail,
            'DELETE' ,
            'OPERATION_DETAIL' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER DELETE: trigger para auditar delete de datos en la tabla owner
DROP TRIGGER IF EXISTS TRG_LOG_OWNER_DELETE;
DELIMITER $$
CREATE TRIGGER TRG_LOG_OWNER_DELETE BEFORE DELETE ON DBrealstate.owner
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE OWNER: ", OLD.first_name),
			OLD.id_owner,
            'DELETE' ,
            'OWNER' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER DELETE: trigger para auditar delete de datos en la tabla property
DROP TRIGGER IF EXISTS TRG_LOG_PROPERTY_DELETE;
DELIMITER $$
CREATE TRIGGER TRG_LOG_PROPERTY_DELETE BEFORE DELETE ON DBrealstate.property
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE PROPERTY FOR OWNER: ", OLD.id_owner),
			OLD.id_property,
            'DELETE' ,
            'PROPERTY' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- TRIGGER DELETE: trigger para auditar delete de datos en la tabla tenant
DROP TRIGGER IF EXISTS TRG_LOG_TENANT_DELETE;
DELIMITER $$
CREATE TRIGGER TRG_LOG_TENANT_DELETE BEFORE DELETE ON DBrealstate.tenant
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_action(name_field, id_table, name_action , name_table, user, date_action, time_action)
	VALUES ( CONCAT("DELETE TENANT: ", OLD.first_name),
			OLD.id_tenant,
            'DELETE' ,
            'TENANT' ,
            CURRENT_USER(),
            CURDATE(),
            CURTIME()) ;
END$$
DELIMITER ;

-- Procedure de insert de datos
DROP PROCEDURE IF EXISTS SP_insert_table;
DELIMITER $$
CREATE PROCEDURE SP_insert_table(
    IN p_table_name VARCHAR(255),
    IN p_columns TEXT,
    IN p_values TEXT
)
BEGIN
    SET @query_insert = CONCAT("INSERT INTO ", p_table_name, " (", p_columns, ") VALUES (", p_values, ");");
    PREPARE param_query FROM @query_insert;
    EXECUTE param_query;
    DEALLOCATE PREPARE param_query;
END$$
DELIMITER ;

# INSERT TABLA SELLER
CALL SP_insert_table('seller', 'first_name, last_name, email, phone, sales, rating', "'Cristian','Lorenzo','cristianventas@inmobiliaria.com',1121338847,13,3.9");
CALL SP_insert_table('seller', 'first_name, last_name, email, phone, sales, rating', "'Rebeca','Navarro','rebecaventas@inmobiliaria.com',1121273782,25,4.8");
CALL SP_insert_table('seller', 'first_name, last_name, email, phone, sales, rating', "'Lucas','Vázques','Lucasventas@inmobiliaria.com',1123123964,21,4.2");

# INSERT TABLA TENANT
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Alexis','Gonzáles','A.G@gmail.com',1123324324,45,'soltero',0,1");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Monica','Pérez','M.Pérez@gmail.com',1121333232,52,'casado',1,1");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Roberto','Rodriguez','roberto.rodriguez@gmail.com',1123233233,23,'soltero',0,1");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Carlos','Martínez','cm@gmail.com',1142342344,34,'soltero',0,2");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Esteban','Sánchez','EstebanSan@gmail.com',1134994920,53,'soltero',0,2");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'María','López','Mlopez@gmail.com',1132430400,19,'soltero',0,2");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'José','García','jgarcia@gmail.com',1140284433,67,'soltero',0,3");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Mariano','Fernández','marianof@gmail.com',1145454322,32,'casado',0,3");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Alfonso','Torres','alftorr@gmail.com',1144432004,36,'soltero',0,3");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Ricardo','Díaz','ricardodiaz@gmail.com',1124444432,41,'casado',1,1");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Mariano','Morales','marianomorales@gmail.com',1119901923,27,'soltero',0,2");

#INSERT TABLA PROPERTY
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '1,0,3,1,1,0,1,1,1,5');
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '1,0,5,2,1,1,2,2,1,5');
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '1,0,3,1,1,0,1,3,2,1');
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '1,0,4,1,1,1,1,4,3,2');
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '0,1,7,2,1,1,3,5,5,3');
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '1,0,4,1,1,1,1,6,2,4');
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '1,0,8,2,1,1,4,7,4,6');
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '0,1,5,1,1,0,3,8,6,7');
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '1,0,4,1,1,1,1,9,5,8');
CALL SP_insert_table('property', 'sale, retal, environments, bathrooms, kitchens, garden, bedrooms, id_operation_detail, id_location, id_owner', '1,0,4,1,1,0,2,10,6,9');

#INSERT TABLA OWNER
CALL SP_insert_table('owner', 'first_name, last_name, email, phone, age, quantity_properties, id_seller', "'Raquel','Mendoza','rq-mendoza@gmail.com',1125403023,41,1,1");
CALL SP_insert_table('owner', 'first_name, last_name, email, phone, age, quantity_properties, id_seller', "'Luis','Ríos','luisrios@gmail.com',1124304950,46,1,1");
CALL SP_insert_table('owner', 'first_name, last_name, email, phone, age, quantity_properties, id_seller', "'Aitana','Medina','AM@gmail.com',1124403023,43,1,2");
CALL SP_insert_table('owner', 'first_name, last_name, email, phone, age, quantity_properties, id_seller', "'Manuel','Rosales','manuelrosales@gmail.com',1142344543,64,1,2");
CALL SP_insert_table('owner', 'first_name, last_name, email, phone, age, quantity_properties, id_seller', "'Lourdes','Paredes','Louparedes@gmail.com',1112023994,69,2,2");
CALL SP_insert_table('owner', 'first_name, last_name, email, phone, age, quantity_properties, id_seller', "'Diego','Cordero','Diegocordero@gmail.com',1112572938,39,1,2");
CALL SP_insert_table('owner', 'first_name, last_name, email, phone, age, quantity_properties, id_seller', "'Elena','Ramírez','ElenaRamirez@gmail.com',1128383903,37,1,3");
CALL SP_insert_table('owner', 'first_name, last_name, email, phone, age, quantity_properties, id_seller', "'Guillermo','Arroyo','GArroyo@gmail.com',1122393039,29,1,3");
CALL SP_insert_table('owner', 'first_name, last_name, email, phone, age, quantity_properties, id_seller', "'Isabel','Peña','isapeña@gmail.com',1127473343,30,1,3");

# INSERT TABLA OPERATION_DETAIL
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,33000,NULL,NULL,'2011-04-23',0,NULL,2");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,41000,NULL,NULL,'2018-08-23',0,NULL,2");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,35000,NULL,NULL,'2022-03-23',0,NULL,1");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,39000,NULL,NULL,'2001-04-23',0,NULL,1");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "0,1,600,0,'2021-03-12','2025-06-12',NULL,150,1,2");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,38500,NULL,NULL,'2016-07-23',0,NULL,2");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,49500,NULL,NULL,'2030-06-23',0,NULL,2");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "0,1,450,0,'2022-04-19','2027-09-13',NULL,150,2,3");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,37500,NULL,NULL,'2028-09-23',0,NULL,3");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,39500,NULL,NULL,'2025-12-23',0,NULL,3");

# INSERT TABLA LOCATION
CALL SP_insert_table('location', 'province, country, department', "'Cordoba','Argentina','Ciudad'");
CALL SP_insert_table('location', 'province, country, department', "'Mendoza','Argentina','Ciudad'");
CALL SP_insert_table('location', 'province, country, department', "'Buenos Aires','Argentina','Ciudad'");
CALL SP_insert_table('location', 'province, country, department', "'San Luis','Argentina','Ciudad'");
CALL SP_insert_table('location', 'province, country, department', "'Santa Fe','Argentina','Ciudad'");
CALL SP_insert_table('location', 'province, country, department', "'Neuquen','Argentina','Ciudad'");

#INSER TABLA GUARANTOR
CALL SP_insert_table('guarantor', 'first_name, last_name, id_tenant, id_property', "'Andres','Rodriguez',2,5");
CALL SP_insert_table('guarantor', 'first_name, last_name, id_tenant, id_property', "'Mariano','Lopez',5,6");


-- Procedure que relaciona las tablas mediante alter tables
DROP PROCEDURE IF EXISTS SP_tables_relations;
DELIMITER //
CREATE PROCEDURE SP_tables_relations(IN P_name_table VARCHAR(25),
									 IN P_name_constraint VARCHAR(35),
									 IN P_fk_id VARCHAR(25),
									 IN P_reference_table VARCHAR(25),
									 IN P_reference_id VARCHAR(25)
									 )
BEGIN

	IF P_name_table 
    OR P_name_constraint
    OR P_fk_id
    OR P_reference_table
    OR P_reference_id <> "" THEN
		SET @alter_table = CONCAT('ALTER TABLE ', P_name_table, 
								 ' ADD CONSTRAINT ', P_name_constraint, 
								 ' FOREIGN KEY ', "(", P_fk_id ,")"
								 ' REFERENCES ', P_reference_table, "(", P_reference_id, ")");
		-- Precompila string con query completa
		PREPARE param_at FROM @alter_table;
		-- Ejecuta query
		EXECUTE param_at;
		-- Liberar statement compilado
		DEALLOCATE PREPARE param_at;
	ELSE
		SELECT FN_ERROR("Los parametros no pueden estár vacios");
    END IF;
END//
DELIMITER ;

# relaciono las tablas: 
-- Referencia FK a la tabla tenant
CALL SP_tables_relations("tenant", "FK_tenant_seller", "id_seller", "seller", "id_seller");

-- Referencias FK a la tabla owner
CALL SP_tables_relations("owner", "FK_owner_seller", "id_seller", "seller", "id_seller");

-- referencias FK a la tabla property
CALL SP_tables_relations("property", "FK_property_operation", "id_operation_detail", "operation_detail", "id_operation_detail");
CALL SP_tables_relations("property", "FK_property_location", "id_location", "location", "id_location");
CALL SP_tables_relations("property", "FK_property_owner", "id_owner", "owner", "id_owner");

-- Referencia FK a la tabla guarantor
CALL SP_tables_relations("guarantor", "FK_guarantor_tenant", "id_tenant", "tenant", "id_tenant");
CALL SP_tables_relations("guarantor", "FK_guarantor_property", "id_property", "property", "id_property");

-- Referencia FK a la tabla operation_detail
CALL SP_tables_relations("operation_detail", "FK_operation_guarantor", "id_guarantor", "guarantor", "id_guarantor");
CALL SP_tables_relations("operation_detail", "FK_operation_seller", "id_seller", "seller", "id_seller");
