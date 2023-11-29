USE DBrealstate;

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
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "0,1,600,30000,'2021-03-12','2025-06-12',NULL,150,1,2");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,38500,NULL,NULL,'2016-07-23',0,NULL,2");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "1,0,0,49500,NULL,NULL,'2030-06-23',0,NULL,2");
CALL SP_insert_table('operation_detail', 'is_sale, is_rent, value_rent, value_sale, rent_start, rent_end, sale_date, value_inscription, id_guarantor, id_seller', "0,1,450,29000,'2022-04-19','2027-09-13',NULL,150,2,3");
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

-- 
USE DBrealstate;

-- Procedure para actualizar los datos de renta de una propiedad
DROP PROCEDURE IF EXISTS SP_update_rent;
DELIMITER $$
CREATE PROCEDURE SP_update_rent(
    IN P_id_operation INT,
    IN P_value_rent FLOAT,
    IN P_value_inscription FLOAT,
    IN P_rent_start DATE,
    IN P_rent_end DATE,
    IN P_id_guarantor INT
)
BEGIN
    IF P_id_operation IS NOT NULL
        AND P_value_rent IS NOT NULL
        AND P_rent_start IS NOT NULL
        AND P_rent_end IS NOT NULL
        AND P_id_guarantor IS NOT NULL
        AND P_value_inscription IS NOT NULL THEN

        SET @query_rent = CONCAT('UPDATE operation_detail
                                    SET value_rent = ', P_value_rent, ',
                                        rent_start = "', P_rent_start, '",
                                        rent_end = "', P_rent_end, '",
                                        id_guarantor = ', P_id_guarantor, ',
                                        value_inscription = ', P_value_inscription, '
                                    WHERE id_operation_detail = ', P_id_operation);

        PREPARE param_query FROM @query_rent;
        EXECUTE param_query;
        DEALLOCATE PREPARE param_query;
    ELSE
        SELECT FN_ERROR('Los parametros no pueden estar vacios');
    END IF;
END$$
DELIMITER ;

CALL SP_update_rent("5", "700", "200", "2022-04-20", "2026-11-21", "1");

-- SP para actualizar los valores de venta de cada operación
DROP PROCEDURE IF EXISTS SP_update_sale;
DELIMITER $$
CREATE PROCEDURE SP_update_sale(
    IN P_id_operation INT,
    IN P_value_sale FLOAT,
    IN P_sale_date DATE
)
BEGIN
    IF P_id_operation IS NOT NULL
        AND P_value_sale IS NOT NULL
        AND P_sale_date IS NOT NULL THEN
        SET @query_sale = CONCAT('UPDATE operation_detail
                                    SET value_sale = ', P_value_sale, ',
                                        sale_date = "', P_sale_date, '"
									WHERE id_operation_detail = ', P_id_operation);

        PREPARE param_query FROM @query_sale;
        EXECUTE param_query;
        DEALLOCATE PREPARE param_query;
    ELSE
        SELECT FN_ERROR('Los parametros no pueden estar vacios');
    END IF;
END$$
DELIMITER ;

CALL SP_update_sale("1", "34000", "2011-04-25");

-- SP para calcular las comisiones que adquiere el vendedor por concretar una operación
-- La comisión por venta es del 10% y de alquiler de un 5%
DROP PROCEDURE IF EXISTS SP_calculate_seller_commission;
DELIMITER $$
CREATE PROCEDURE SP_calculate_seller_commission(
    IN P_id_operation INT,
    OUT P_commission FLOAT
)
BEGIN
    DECLARE commission FLOAT;
    SELECT 
        CASE 
            WHEN is_sale = 1 THEN value_sale * 0.10
            WHEN is_rent = 1 THEN value_rent * 0.05
            ELSE 0.00 
        END INTO commission
    FROM operation_detail
    WHERE id_operation_detail = P_id_operation;
    SET P_commission = commission;
END$$
DELIMITER ;

CALL SP_calculate_seller_commission(5, @commission_value);
SELECT @commission_value;

-- VISUALIZACIÓN DE LOGS
SELECT * FROM LOG_audit_create;
SELECT * FROM LOG_audit_action;