# Script de inserts y alter tables.

USE DBrealstate;

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