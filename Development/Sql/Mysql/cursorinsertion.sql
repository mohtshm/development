DELIMITER $$

USE `magentodbm1`$$

DROP PROCEDURE IF EXISTS `Customer_Migrate`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Customer_Migrate`()
BEGIN
 DECLARE customerId INT;       
 DECLARE customerName VARCHAR(250);        
 DECLARE customerLastName VARCHAR(250);        
 DECLARE customerEmail VARCHAR(500) ;         
 DECLARE customerPassword VARCHAR(500) DEFAULT "";    
 DECLARE done INT DEFAULT FALSE;
 DECLARE customer_cursor CURSOR FOR 
 SELECT customer_id,customer_fname,customer_lname,customer_email,customer_password FROM  cd_website.`dss_customers`  WHERE customer_id > 10000 AND customer_email <> ''  GROUP BY customer_email  ORDER BY customer_id LIMIT 5000;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
 -- insert into master table
 
  INSERT INTO `customer_entity`(`entity_id`,`entity_type_id`,`attribute_set_id`,`website_id`,`email`,`group_id`,`increment_id`,`store_id`,`created_at`,`updated_at`,`is_active`,`disable_auto_group_change`)
  SELECT customer_id,1,0,1,customer_email,1,NULL,0,NOW(),NOW(),1,0 FROM  cd_website.`dss_customers` WHERE customer_id > 10000 AND customer_email <> ''  GROUP BY customer_email  ORDER BY customer_id LIMIT 5000;
 
  INSERT INTO `customer_entity_int`(`entity_type_id`,`attribute_id`,`entity_id`,`value`)  
  SELECT 1,18,customer_id, CASE LOWER(customer_gender) WHEN 'male' THEN 1 ELSE 2 END AS gender FROM  cd_website.`dss_customers`  WHERE customer_id > 10000 AND customer_email <> ''  GROUP BY customer_email  ORDER BY customer_id LIMIT 5000;
   
 OPEN customer_cursor;
 
 customer_loop: LOOP
 
 FETCH customer_cursor INTO customerId,customerName,customerLastName,customerEmail,customerPassword;
 
	IF done THEN
	LEAVE customer_loop;
	END IF;
	SET FOREIGN_KEY_CHECKS=0;
        INSERT INTO `customer_entity_varchar`(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
		VALUES (1,4,customerId,NULL),(1,5,customerId,customerName),(1,6,customerId,NULL),(1,7,customerId,customerLastName),(1,8,customerId,NULL),(1,15,customerId,customerPassword),(1,12,customerId,NULL),(1,3,customerId,'admin');
	SET FOREIGN_KEY_CHECKS=1; 
 
 END LOOP customer_loop;
 
 CLOSE customer_cursor;
 
END$$

DELIMITER ;