# Script de creación de triggers
USE DBrealstate;

START TRANSACTION;

DROP TRIGGER IF EXISTS TRG_LOG_SELLER;
DELIMITER $$
CREATE TRIGGER TRG_LOG_SELLER AFTER INSERT ON DBrealstate.seller
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'seller' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_LOG_GUARANTOR;
DELIMITER $$
CREATE TRIGGER TRG_LOG_GUARANTOR AFTER INSERT ON DBrealstate.guarantor
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'guarantor' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_LOG_LOCATION;
DELIMITER $$
CREATE TRIGGER TRG_LOG_LOCATION AFTER INSERT ON DBrealstate.location
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'location' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_LOG_OPERATION_DETAIL;
DELIMITER $$
CREATE TRIGGER TRG_LOG_OPERATION_DETAIL AFTER INSERT ON DBrealstate.operation_detail
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'operation_detail' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_LOG_OWNER;
DELIMITER $$
CREATE TRIGGER TRG_LOG_OWNER AFTER INSERT ON DBrealstate.owner
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'owner' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_LOG_PROPERTY;
DELIMITER $$
CREATE TRIGGER TRG_LOG_PROPERTY AFTER INSERT ON DBrealstate.property
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'property' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_LOG_TENANT;
DELIMITER $$
CREATE TRIGGER TRG_LOG_TENANT AFTER INSERT ON DBrealstate.tenant
FOR EACH ROW 
BEGIN
	INSERT INTO LOG_audit_create(name_action , name_table , user, date_action, time_action)
	VALUES ( 'INSERT' , 'tenant' , CURRENT_USER() , CURDATE(), CURTIME());
END$$
DELIMITER ;

SAVEPOINT SP_inserts;

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

SAVEPOINT SP_updates;

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

COMMIT;