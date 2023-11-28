USE DBrealstate;

-- USUARIO REFERENCIA RECURSOS HUMANOS
CREATE USER IF NOT EXISTS 'RRHH_realstate'@'localhost' identified by 'recursos123' ;

-- USUARIO REFERENCIA ADMINISTRADOR
CREATE USER IF NOT EXISTS 'ADMIN_realstate'@'localhost' identified by 'admin123' ; 

-- ESTE USUARIO PODRÁ VISUALIZAR LAS TABLAS DE LA BASE DE DATOS
GRANT SELECT ON DBrealstate.guarantor to 'RRHH_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.location to 'RRHH_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.operation_detail to 'RRHH_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.owner to 'RRHH_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.property to 'RRHH_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.seller to 'RRHH_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.tenant to 'RRHH_realstate'@'localhost' ;

-- ESTE USUARIO PODRÁ VISUALIZAR, ACTUALIZAR E INSERTAR EN LAS TABLAS DE LA BASE DE DATOS
GRANT SELECT, UPDATE, INSERT ON DBrealstate.guarantor to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.location to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.owner to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.property to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.seller to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.tenant to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.operation_detail to 'ADMIN_realstate'@'localhost' ;