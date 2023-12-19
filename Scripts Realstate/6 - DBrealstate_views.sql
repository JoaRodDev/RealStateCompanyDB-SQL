# Script de creación de views

USE DBrealstate;

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

-- Relación seller y operation_detail
DROP VIEW IF EXISTS View_Seller_Operation;
CREATE VIEW View_Seller_Operation AS
SELECT s.first_name AS seller_first_name, s.last_name AS seller_last_name,
       o.is_sale, o.is_rent, o.value_rent, o.value_sale,
       o.rent_start, o.rent_end, o.sale_date, o.value_inscription
FROM seller s
JOIN operation_detail o ON s.id_seller = o.id_seller;