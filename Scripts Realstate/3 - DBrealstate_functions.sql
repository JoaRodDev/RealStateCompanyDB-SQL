#Script de creación de funciones.

USE DBrealstate;

START TRANSACTION;

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

DROP FUNCTION IF EXISTS FN_is_mail;
DELIMITER $$
CREATE FUNCTION FN_is_mail(
    P_mail VARCHAR(250)
)
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
    DECLARE message_error VARCHAR(250);
    SET message_error = "";
    
    IF P_mail LIKE "%@%" THEN
        SET message_error = "OK";
    ELSE
        SET message_error = CONCAT("El mail ", P_mail, " no contiene @");
    END IF;
    
    RETURN message_error;
END$$
DELIMITER ;

SAVEPOINT SP1;

-- SELECT FN_is_mail("joarod@gmail.com");
-- SELECT FN_is_mail("joarodgmail.com"); -- Devuelve un error

DROP FUNCTION IF EXISTS FN_seller_rating;
DELIMITER $$
CREATE FUNCTION FN_seller_rating(
	par_id_seller INT
)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE query_seller_rating FLOAT;

    SET query_seller_rating = (
        SELECT rating
        FROM seller
        WHERE seller.id_seller = par_id_seller
    );
    RETURN query_seller_rating;
END$$
DELIMITER ;

COMMIT;