USE DBrealstate;

-- Procedure que crea las view de una tabla de manera ascendente o descendente dependiendo de la columna que pasemos por parametro
DROP PROCEDURE IF EXISTS SP_tables_views;
DELIMITER //
CREATE PROCEDURE SP_tables_views(IN P_name_view VARCHAR(35),
								 IN P_name_table VARCHAR(25),
								 IN P_name_column VARCHAR(25),
                                 IN P_asc_desc VARCHAR(25)
								 )
BEGIN
	
    SET P_asc_desc = LCASE(P_asc_desc);
	
    IF P_asc_desc = 'ASC' OR P_asc_desc = 'DESC' THEN
		SET @table_view = CONCAT('CREATE OR REPLACE VIEW ', P_name_view,' AS ', '(',
								 ' SELECT * FROM ', P_name_table, 
								 ' ORDER BY ', P_name_column, ' ', P_asc_desc, ')');
		PREPARE param_tv FROM @table_view;
		EXECUTE param_tv;
		DEALLOCATE PREPARE param_tv;
	ELSE
		SELECT FN_ERROR("ERROR, Debes colocar DESC o ASC");
	END IF;
    
END//
DELIMITER ;


# CREACIÓN DE VIEWS:
CALL SP_tables_views( 'VW_guarantor_desc' , 'guarantor' , 'first_name' , 'DESC' );
CALL SP_tables_views("VW_location_asc", "location", "province", "ASC");
CALL SP_tables_views("VW_owner_asc", "owner", "first_name", "ASC");
CALL SP_tables_views("VW_seller_asc", "seller", "first_name", "ASC");
CALL SP_tables_views("VW_tenant_desc", "tenant", "first_name", "DESC");

-- CALL SP_tables_views("VW_tenant_desc", "tenant", "first_name", "DESC"); -- EJEMPLO DE ERROR

-- CREACIÓN DE VISTAS CON JOIN

-- Relación entre la tabla tenant, operation detail y guarantor
DROP VIEW IF EXISTS View_Tenant_Operation_Guarantor;
CREATE VIEW View_Tenant_Operation_Guarantor AS
SELECT t.first_name AS tenant_first_name, t.last_name AS tenant_last_name,
       o.is_sale, o.is_rent, o.value_rent, o.value_sale,
       o.rent_start, o.rent_end, o.sale_date, o.value_inscription,
       g.first_name AS guarantor_first_name, g.last_name AS guarantor_last_name
FROM tenant t
JOIN operation_detail o ON t.id_seller = o.id_seller
LEFT JOIN guarantor g ON o.id_guarantor = g.id_guarantor;

SELECT * FROM View_Tenant_Operation_Guarantor;

-- Relación entre la tabla property, location y owner
DROP VIEW IF EXISTS View_Property_Location_Owner;
CREATE VIEW View_Property_Location_Owner AS
SELECT p.id_property, p.sale, p.retal, p.environments,
       p.bathrooms, p.kitchens, p.garden, p.bedrooms,
       l.province, l.country, l.department,
       o.first_name AS owner_first_name, o.last_name AS owner_last_name
FROM property p
JOIN location l ON p.id_location = l.id_location
LEFT JOIN owner o ON p.id_owner = o.id_owner;

SELECT * FROM View_Property_Location_Owner;

-- Relación seller y operation_detail
DROP VIEW IF EXISTS View_Seller_Operation;
CREATE VIEW View_Seller_Operation AS
SELECT s.first_name AS seller_first_name, s.last_name AS seller_last_name,
       o.is_sale, o.is_rent, o.value_rent, o.value_sale,
       o.rent_start, o.rent_end, o.sale_date, o.value_inscription
FROM seller s
JOIN operation_detail o ON s.id_seller = o.id_seller;

SELECT * FROM View_Seller_Operation;
