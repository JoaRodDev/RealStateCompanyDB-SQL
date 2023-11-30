USE DBrealstate;

# PRIMERA TABLA (seller)

START TRANSACTION;
DELETE FROM seller WHERE id_seller = 1;
DELETE FROM seller WHERE id_seller = 2;
-- ROLLBACK;
-- COMMIT;
-- CALL SP_insert_table('seller', 'first_name, last_name, email, phone, sales, rating', "'Cristian','Lorenzo','cristianventas@inmobiliaria.com',1121338847,13,3.9");
-- CALL SP_insert_table('seller', 'first_name, last_name, email, phone, sales, rating', "'Rebeca','Navarro','rebecaventas@inmobiliaria.com',1121273782,25,4.8");

# SEGUNDA TABLA (tenant)

START TRANSACTION;
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Fernando','Gonzales','FG123@gmail.com',1123320234,65,'soltero',0,3");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Fernanda','Montivero','FerMontivero@gmail.com',1121339873,43,'soltero',0,3");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Mariano','Fonseca','MF@gmail.com',1123238345,34,'soltero',0,3");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Diego','Tobares','dtobares@gmail.com',1144392344,30,'casado',1,3");
SAVEPOINT SP1;
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Mario','Sánchez','MarianoS@gmail.com',1137201920,49,'soltero',0,3");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Pablo','Robledo','PRobledo@gmail.com',1132492340,24,'soltero',0,3");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Mauro','García','MauroGarcia@gmail.com',1140209873,63,'soltero',0,3");
CALL SP_insert_table('tenant', 'first_name, last_name, email, phone, age, civil_status, childrens, id_seller', "'Flabia','Rodriguez','FRodriguez@gmail.com',1143334322,36,'casado',1,3");
SAVEPOINT SP2;
-- RELEASE SAVEPOINT SP1;