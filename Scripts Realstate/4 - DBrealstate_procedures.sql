# Script de procedimientos

USE DBrealstate;

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