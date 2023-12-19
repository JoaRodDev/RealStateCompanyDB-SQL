#Script de creación de usuarios.

USE DBrealstate;

-- USUARIO REFERENCIA ADMIN
CREATE USER IF NOT EXISTS 'ADMIN_realstate'@'localhost' identified by 'admin123' ;

GRANT SELECT, UPDATE, INSERT ON DBrealstate.guarantor to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.location to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.LOG_audit_action to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.LOG_audit_create to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.owner to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.property to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.seller to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.tenant to 'ADMIN_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.operation_detail to 'ADMIN_realstate'@'localhost' ;

-- USUARIO REFERENCIA RECURSOS HUMANOS
CREATE USER IF NOT EXISTS 'RRHH_realstate'@'localhost' identified by 'rrhh123' ;

GRANT SELECT ON DBrealstate.seller to 'RRHH_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.operation_detail to 'RRHH_realstate'@'localhost' ;

-- USUARIO REFERENCIA A VENDEDORES
CREATE USER IF NOT EXISTS 'SELLERS_realstate'@'localhost' identified by 'seller123' ;

GRANT SELECT ON DBrealstate.guarantor to 'SELLERS_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.location to 'SELLERS_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.owner to 'SELLERS_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.property to 'SELLERS_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.seller to 'SELLERS_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.tenant to 'SELLERS_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.operation_detail to 'SELLERS_realstate'@'localhost' ;

-- USUARIO REFERENCIA INQUILINOS
CREATE USER IF NOT EXISTS 'TENANT_realstate'@'localhost' identified by 'tenant123' ;

GRANT SELECT, UPDATE, INSERT ON DBrealstate.guarantor to 'TENANT_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.location to 'TENANT_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.owner to 'TENANT_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.property to 'TENANT_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.seller to 'TENANT_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.operation_detail to 'TENANT_realstate'@'localhost' ;


-- USUARIO REFERENCIA PROPIETARIOS
CREATE USER IF NOT EXISTS 'OWNER_realstate'@'localhost' identified by 'owner123' ;

GRANT SELECT ON DBrealstate.guarantor to 'OWNER_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.location to 'OWNER_realstate'@'localhost' ;
GRANT SELECT, UPDATE, INSERT ON DBrealstate.property to 'OWNER_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.seller to 'OWNER_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.tenant to 'OWNER_realstate'@'localhost' ;
GRANT SELECT ON DBrealstate.operation_detail to 'OWNER_realstate'@'localhost' ;