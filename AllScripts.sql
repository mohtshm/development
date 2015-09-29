
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/* Procedure structure for procedure `add_customer_entity` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_customer_entity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer_entity`()
BEGIN
 INSERT INTO `customer_entity`(`ENTITY_ID`,`ENTITY_TYPE_ID`,`ATTRIBUTE_SET_ID`,`WEBSITE_ID`,`EMAIL`,`GROUP_ID`,`INCREMENT_ID`,`STORE_ID`,`CREATED_AT`,`UPDATED_AT`,`IS_ACTIVE`,`DISABLE_AUTO_GROUP_CHANGE`)
 SELECT CUSTOMER_ID,1,0,1,CUSTOMER_EMAIL,1,NULL,0,NOW(),NOW(),1,0 FROM  cd_website.`dss_customers` WHERE CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_customer_entity_int` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_customer_entity_int` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer_entity_int`()
BEGIN
 INSERT INTO `customer_entity_INT`(`ENTITY_TYPE_ID`,`ATTRIBUTE_ID`,`ENTITY_ID`,`VALUE`)  
 SELECT 1,18,CUSTOMER_ID, CASE LOWER(CUSTOMER_GENDER) WHEN 'MALE' THEN 1 ELSE 2 END AS GENDER FROM  cd_website.`dss_customers`  WHERE CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID;  
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_customer_varchar` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_customer_varchar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer_varchar`()
BEGIN
TRUNCATE TABLE `customer_entity_varchar`;
	INSERT INTO customer_entity_varchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
	SELECT `entity_type_id`,`attribute_id`,`entity_id`,`value` FROM TempCustomerVarchar  ORDER BY entity_id ,attribute_id; 	    		 
  		 
--  DECLARE lowerLimit INT DEFAULT 0;       
--  DECLARE upperLimit INT DEFAULT 0; 
--  DECLARE loopCounter INT DEFAULT 1;
--  DECLARE totalCount INT DEFAULT 1;
--  DECLARE tablePortion INT DEFAULT 2;
--    
-- 	SET totalCount = (SELECT COUNT(entity_id) FROM TempCustomerVarchar);	 
-- 	SET upperLimit = totalCount / tablePortion ;
-- 	
-- 	  SELECT 'inserting varchar by upper, lower and count'; 	
-- 		
-- 	  SELECT lowerLimit,upperLimit,loopCounter,totalCount; 	
-- 		
-- 	-- SET FOREIGN_KEY_CHECKS=0;  
-- -- 	INSERT INTO customer_entity_varchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
-- -- 	SELECT `entity_type_id`,`attribute_id`,`entity_id`,`value` FROM TempCustomerVarchar  ORDER BY entity_id ,attribute_id; 	    	
-- -- --	SELECT `entity_type_id`,`attribute_id`,`entity_id`,`value` FROM TempCustomerVarchar  ORDER BY entity_id ,attribute_id LIMIT lowerLimit,upperLimit; 	    	
-- -- -- 	customer_loop: LOOP
-- -- -- 		SET loopCounter = loopCounter + 1; 	 
-- -- -- 		 SET lowerLimit = upperLimit+1;
-- -- -- 		 SET upperLimit = loopCounter * (totalCount / tablePortion );	 
-- -- -- 		 
-- -- -- 		  SELECT lowerLimit,upperLimit,loopCounter,totalCount; 	
-- -- -- 		 INSERT INTO customer_entity_varchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
-- -- -- 		 SELECT `entity_type_id`,`attribute_id`,`entity_id`,`value` FROM TempCustomerVarchar  ORDER BY entity_id ,attribute_id LIMIT lowerLimit,upperLimit; 	
-- -- -- 			 
-- -- -- 		IF upperLimit >= totalCount THEN
-- -- -- 		LEAVE customer_loop;
-- -- -- 		END IF;
-- -- -- 	 END LOOP customer_loop;  
-- -- 	 
-- -- SET FOREIGN_KEY_CHECKS=1;  		 
-- -- DROP TABLE TempCustomerVarchar;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_customer_varchar_looping` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_customer_varchar_looping` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer_varchar_looping`()
BEGIN
 DECLARE lowerLimit INT DEFAULT 0;       
 DECLARE upperLimit INT DEFAULT 0; 
 DECLARE loopCounter INT DEFAULT 1;
 DECLARE totalCount INT DEFAULT 1;
 DECLARE tablePortion INT DEFAULT 10;
   
	SET totalCount = (SELECT COUNT(entity_id) FROM TempCustomerVarchar);	 
	SET upperLimit = totalCount / tablePortion ;
	
	  SELECT 'inserting varchar by upper, lower and count'; 	
		
	  SELECT lowerLimit,upperLimit,loopCounter,totalCount; 	
		
	customer_loop: LOOP
		SET loopCounter = loopCounter + 1; 	 
		 SET lowerLimit = upperLimit+1;
		 SET upperLimit = loopCounter * (totalCount / tablePortion );	 
		 
		  SELECT lowerLimit,upperLimit,loopCounter,totalCount; 	
			 
		IF upperLimit >= totalCount THEN
		LEAVE customer_loop;
		END IF;
	 END LOOP customer_loop;  
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_order_grid_shippingrate` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_order_grid_shippingrate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_order_grid_shippingrate`()
BEGIN 
INSERT  INTO `sales_flat_order_grid`
(`entity_id`,`status`,`store_id`,`store_name`,`customer_id`,`base_grand_total`,`base_total_paid`,`grand_total`,`total_paid`
,`increment_id`,`base_currency_code`,`order_currency_code`,`shipping_name`,`billing_name`,`created_at`,`updated_at`) 
SELECT o.order_id,'pending',1,'crazydeals.com\nmain website store\nEnglish',o.customer_id,o.order_amount,NULL,o.order_amount,NULL
,CONCAT(SUBSTR('100000000',1,9-LENGTH(o.order_id)),o.order_id),'AED','AED',c.`customer_fname`,c.`customer_fname`,o.`order_date`,o.`order_date`
FROM cd_website.`dss_orders` AS o 
INNER JOIN cd_website.`dss_customers` AS c 
ON o.customer_id = c.`customer_id`;
INSERT  INTO `sales_flat_quote_shipping_rate`
(`rate_id`,`address_id`,`created_at`,`updated_at`,`carrier`,`carrier_title`,`code`,`method`,`method_description`,`price`
,`error_message`,`method_title`) 
SELECT address_id,created_at, updated_at,'freeshipping','Free Shipping','freeshipping_freeshipping','freeshipping',NULL,0.0000,NULL,'Free' FROM sales_flat_quote_address WHERE address_type = 'shipping' order by address_id desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_order_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_order_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_order_items`()
BEGIN 
INSERT  INTO `sales_flat_quote_item`
(`item_id`,`quote_id`,`created_at`,`updated_at`,`product_id`,`store_id`,`parent_item_id`,`is_virtual`,`sku`,`name`,`description`,`applied_rule_ids`,`additional_data`,`free_shipping`,`is_qty_decimal`,`no_discount`,`weight`,`qty`,`price`,`base_price`,`custom_price`,`discount_percent`,`discount_amount`,`base_discount_amount`,`tax_percent`,`tax_amount`,`base_tax_amount`,`row_total`,`base_row_total`,`row_total_with_discount`,`row_weight`,`product_type`,`base_tax_before_discount`,`tax_before_discount`,`original_custom_price`,`redirect_url`,`base_cost`,`price_incl_tax`,`base_price_incl_tax`,`row_total_incl_tax`,`base_row_total_incl_tax`,`hidden_tax_amount`,`base_hidden_tax_amount`,`gift_message_id`,`weee_tax_disposition`,`weee_tax_row_disposition`,`base_weee_tax_disposition`,`base_weee_tax_row_disposition`,`weee_tax_applied`,`weee_tax_applied_amount`,`weee_tax_applied_row_amount`,`base_weee_tax_applied_amount`,`base_weee_tax_applied_row_amnt`,`event_id`,`giftregistry_item_id`,`gw_id`,`gw_base_price`,`gw_price`,`gw_base_tax_amount`,`gw_tax_amount`)
SELECT op.order_id, o.`order_id`,o.`order_date`,o.`order_date`,op.order_product,1,NULL,0,op.products_sku,op.products_title,NULL,NULL,NULL,0,0,0,NULL,2.0000,0.0000,0.0000,NULL,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,'Simple',NULL,NULL,NULL,NULL,NULL,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,0.0000,0.0000,0.0000,0.0000,'a:0:{}',0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
FROM cd_website.`dss_orders` AS o
INNER JOIN (
SELECT order_id,order_product,p.products_sku,p.products_title,order_number 
FROM cd_website.`dss_order_product`
INNER JOIN cd_website.`dss_products` p ON 
 p.products_id = order_product
) AS op
ON o.`order_number` = op.`order_number`
ORDER BY o.order_id;
 INSERT  INTO `sales_flat_quote_item_option`
 (`option_id`,`item_id`,`product_id`,`code`,`value`)  
SELECT order_id,order_product,'info_buyRequest','a:1:{s:3:\"qty\";i:2;}',CONCAT('a:1:{s:3:\"qty\";i:',`order_product_qty`,';}')
FROM cd_website.`dss_order_product`;
INSERT  INTO `sales_flat_order_item`
(`item_id`,`order_id`,`parent_item_id`,`quote_item_id`,`store_id`,`created_at`,`updated_at`,`product_id`,`product_type`,`product_options`,`weight`,`is_virtual`
,`sku`,`name`,`description`,`applied_rule_ids`,`additional_data`,`free_shipping`,`is_qty_decimal`,`no_discount`,`qty_backordered`,`qty_canceled`
,`qty_invoiced`,`qty_ordered`,`qty_refunded`,`qty_shipped`,`base_cost`,`price`,`base_price`,`original_price`,`base_original_price`,`tax_percent`
,`tax_amount`,`base_tax_amount`,`tax_invoiced`,`base_tax_invoiced`,`discount_percent`,`discount_amount`,`base_discount_amount`,`discount_invoiced`
,`base_discount_invoiced`,`amount_refunded`,`base_amount_refunded`,`row_total`,`base_row_total`,`row_invoiced`,`base_row_invoiced`
,`row_weight`,`base_tax_before_discount`,`tax_before_discount`,`ext_order_item_id`,`locked_do_invoice`,`locked_do_ship`,`price_incl_tax`,`base_price_incl_tax`
,`row_total_incl_tax`,`base_row_total_incl_tax`,`hidden_tax_amount`,`base_hidden_tax_amount`,`hidden_tax_invoiced`,`base_hidden_tax_invoiced`
,`hidden_tax_refunded`
,`base_hidden_tax_refunded`,`is_nominal`,`tax_canceled`,`hidden_tax_canceled`,`tax_refunded`,`base_tax_refunded`,`discount_refunded`,`base_discount_refunded`,`gift_message_id`,`gift_message_available`,`base_weee_tax_applied_amount`,`base_weee_tax_applied_row_amnt`,`weee_tax_applied_amount`,`weee_tax_applied_row_amount`,`weee_tax_applied`,`weee_tax_disposition`,`weee_tax_row_disposition`,`base_weee_tax_disposition`,`base_weee_tax_row_disposition`,`event_id`,`giftregistry_item_id`,`gw_id`,`gw_base_price`,`gw_price`,`gw_base_tax_amount`,`gw_tax_amount`,`gw_base_price_invoiced`,`gw_price_invoiced`,`gw_base_tax_amount_invoiced`,`gw_tax_amount_invoiced`,`gw_base_price_refunded`,`gw_price_refunded`,`gw_base_tax_amount_refunded`,`gw_tax_amount_refunded`,`qty_returned`) 
SELECT op.order_id, o.`order_id`,NULL,op.order_id,1,o.`order_date`,o.`order_date`,op.order_product,'Simple',concat('a:1:{s:15:\"info_buyRequest\";a:2:{s:3:\"qty\";i:',op.order_product_qty,';s:7:\"options\";a:0:{}}}'),NULL,0
,op.products_sku,op.products_title,NULL,NULL,NULL,0,0,0,NULL,0.0000,0.0000,op.order_product_qty,0.0000,0.0000,NULL,0.0000
,0.0000,0.0000,0.0000,0.0000 AS tamount,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000 AS dinvoice,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000
,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL AS priceitax,0.0000,0.0000 AS rtitax,0.0000,0.0000,0.0000,0.0000,NULL,NULL AS hiddentaxref,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0.0000,0.0000,0.0000,0.0000,'a:0:{}',0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000
FROM cd_website.`dss_orders` AS o
INNER JOIN (
SELECT order_id,order_product,p.products_sku,p.products_title,order_number,`order_product_qty` 
FROM cd_website.`dss_order_product`
INNER JOIN cd_website.`dss_products` p ON 
 p.products_id = order_product
) AS op
ON o.`order_number` = op.`order_number`
ORDER BY o.order_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_product_entity` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_product_entity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_entity`()
BEGIN
 
 INSERT INTO `catalog_product_entity`
            (`entity_id`,
             `entity_type_id`,
             `attribute_set_id`,
             `type_id`,
             `sku`,
             `has_options`,
             `required_options`,
             `created_at`,
             `updated_at`) 
 SELECT products_id,4,4,'Simple',products_sku,0,0,Products_dateAdded,Products_dateAdded FROM `cd_website`.`dss_products`;
      
INSERT INTO `catalog_category_product`
            (`category_id`,
             `product_id`,
             `position`) 
 SELECT 2,products_id,1 FROM `cd_website`.`dss_products`;        
        
        INSERT INTO `catalog_product_website`
            (`product_id`,
             `website_id`)             
 SELECT products_id,1 FROM `cd_website`.`dss_products`;  
 
  INSERT INTO `cataloginventory_stock_item`(`product_id`, `stock_id`, `qty`, `use_config_min_qty`, `is_qty_decimal`, `use_config_backorders`, `use_config_min_sale_qty`, `use_config_max_sale_qty`, `is_in_stock`, `low_stock_date`, `use_config_notify_stock_qty`, `use_config_manage_stock`, `stock_status_changed_auto`, `use_config_qty_increments`, `use_config_enable_qty_inc`, `is_decimal_divided`)            
  SELECT products_id,1,50,1,0,1,1,1,1,NULL, 1, 1, 0, 1, 1, 0 FROM `cd_website`.`dss_products`;    
        
INSERT INTO `cataloginventory_stock_status` (`product_id`,`website_id`,`stock_id`,`qty`,`stock_status`) 
SELECT products_id AS p_id,1,1,50,1 FROM `cd_website`.`dss_products`;    
 
 INSERT INTO `catalog_product_index_website` (`website_id`,`website_date`,`rate`)
 SELECT '1',NOW(),1;        
 INSERT INTO `catalogsearch_fulltext` (`product_id`,`store_id`,`data_index`) 
 SELECT  products_id,1, CONCAT(products_sku,'|None|',products_title,'|No|',products_metadesc,'|',products_metatitle,'|',products_price,'|1')  FROM `cd_website`.`dss_products`;    
       
        
        
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_product_entity_datetime` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_product_entity_datetime` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_entity_datetime`()
BEGIN
INSERT INTO `catalog_product_entity_datetime`
            (`entity_type_id`,
             `attribute_id`,
             `store_id`,
             `entity_id`,
             `value`)
SELECT  * FROM(        
        SELECT 4 AS e_id,93 AS a_id,0 AS s_id,products_id AS p_id, NULL AS val FROM `cd_website`.`dss_products` UNION ALL
        SELECT 4 AS e_id,94 AS a_id,0 AS s_id,products_id AS p_id, NULL AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,77 AS a_id,0 AS s_id,products_id AS p_id, NULL AS val FROM `cd_website`.`dss_products` UNION ALL
        SELECT 4 AS e_id,78 AS a_id,0 AS s_id,products_id AS p_id, NULL AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,105 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`  UNION ALL        
        SELECT 4 AS e_id,104 AS a_id,0 AS s_id,products_id AS p_id, NULL AS val  FROM `cd_website`.`dss_products`)AS entity ORDER BY entity.p_id;             
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_product_entity_decimal` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_product_entity_decimal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_entity_decimal`()
BEGIN
INSERT INTO `catalog_product_entity_decimal`
            (`entity_type_id`,
             `attribute_id`,
             `store_id`,
             `entity_id`,
             `value`)
SELECT  * FROM(        
        SELECT 4 AS e_id,80 AS a_id,0 AS s_id,products_id AS p_id,`product_weight` AS val FROM `cd_website`.`dss_products` UNION ALL
        SELECT 4 AS e_id,75 AS a_id,0 AS s_id,products_id AS p_id,`products_price` AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,120 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`  UNION ALL        
        SELECT 4 AS e_id,76 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`  UNION ALL        
        SELECT 4 AS e_id,148 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val  FROM `cd_website`.`dss_products`)AS entity ORDER BY entity.p_id;             
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_product_entity_int` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_product_entity_int` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_entity_int`()
BEGIN
INSERT INTO `catalog_product_entity_int`
            (`entity_type_id`,
             `attribute_id`,
             `store_id`,
             `entity_id`,
             `value`)
SELECT  * FROM(   
	SELECT 4,92,0 ,products_id AS p_id,NULL FROM `cd_website`.`dss_products`  UNION ALL
	SELECT 4,81,0 ,products_id AS p_id,NULL  FROM `cd_website`.`dss_products`  UNION ALL             
        SELECT 4 AS e_id, 96 AS a_id,0 AS s_id,products_id AS p_id,`products_isActive` FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,102 AS a_id,0 AS s_id,products_id AS p_id,4 AS val FROM `cd_website`.`dss_products` UNION ALL
        SELECT 4 AS e_id,121 AS a_id,0 AS s_id,products_id AS p_id,0 AS val FROM `cd_website`.`dss_products`  UNION ALL
        SELECT 4,237,0 ,products_id AS p_id,0 FROM `cd_website`.`dss_products` UNION ALL
	SELECT 4,255,0 ,products_id AS p_id,NULL  FROM `cd_website`.`dss_products`  UNION ALL
        SELECT 4 AS e_id,256 AS a_id,0 AS s_id,products_id AS p_id,241 AS val FROM `cd_website`.`dss_products`  UNION ALL
        SELECT 4,122,0 ,products_id AS p_id,0  FROM `cd_website`.`dss_products` UNION ALL
        SELECT 4 AS e_id,100 AS a_id,0 AS s_id,products_id AS p_id,0 AS val FROM `cd_website`.`dss_products`  
        -- UNION ALL  SELECT 4 AS e_id,132 AS a_id,0 AS s_id,products_id AS p_id,`p_home_featured` FROM `cd_website`.`dss_products`
        )AS entity ORDER BY entity.p_id;             
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_product_entity_text` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_product_entity_text` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_entity_text`()
BEGIN
 INSERT INTO `catalog_product_entity_text`
            (
             `entity_type_id`,
             `attribute_id`,
             `store_id`,
             `entity_id`,
             `value`)
SELECT  * FROM(        
        SELECT 4 AS e_id,72 AS a_id,0 AS s_id,products_id AS p_id,`products_desc` AS val FROM `cd_website`.`dss_products` UNION ALL
        SELECT 4 AS e_id,73 AS a_id,0 AS s_id,products_id AS p_id,CONCAT(products_title,products_metadesc) FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,83 AS a_id,0 AS s_id,products_id AS p_id,`products_metakeywords` AS val FROM `cd_website`.`dss_products`  UNION ALL     
        SELECT 4 AS e_id,106 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`        
        )AS entity ORDER BY entity.p_id;  
        
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_product_entity_varchar` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_product_entity_varchar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_entity_varchar`()
BEGIN
INSERT INTO `catalog_product_entity_varchar`
            (
             `entity_type_id`,
             `attribute_id`,
             `store_id`,
             `entity_id`,
             `value`)
SELECT  * FROM(        
        SELECT 4 AS e_id,71 AS a_id,0 AS s_id,products_id AS p_id,`products_title` AS val FROM `cd_website`.`dss_products` UNION ALL
        SELECT 4 AS e_id, 97 AS a_id,0 AS s_id,products_id AS p_id,`products_urlkey` FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id, 97 AS a_id,1 AS s_id,products_id AS p_id,`products_urlkey` FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id, 98 AS a_id,0 AS s_id,products_id AS p_id,CONCAT(`products_urlkey`,'.html') FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id, 98 AS a_id,1 AS s_id,products_id AS p_id,CONCAT(`products_urlkey`,'.html') FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4,117,0 ,products_id AS p_id,NULL FROM `cd_website`.`dss_products`  UNION ALL
	  SELECT 4,224,0 ,products_id AS p_id,NULL FROM `cd_website`.`dss_products` UNION ALL
	  SELECT 4,225,0 ,products_id AS p_id,NULL FROM `cd_website`.`dss_products` UNION ALL
	  SELECT 4,253,0 ,products_id AS p_id,NULL FROM `cd_website`.`dss_products` UNION ALL
	  SELECT 4,254,0 ,products_id AS p_id,NULL FROM `cd_website`.`dss_products` UNION ALL
	  SELECT 4,213,0 ,products_id AS p_id,NULL FROM `cd_website`.`dss_products` UNION ALL
	  SELECT 4,214,0 ,products_id AS p_id,NULL FROM `cd_website`.`dss_products` UNION ALL
	  SELECT 4,118,0 ,products_id AS p_id,'2' FROM `cd_website`.`dss_products` UNION ALL
          SELECT 4,119,0 ,products_id AS p_id,'4' FROM `cd_website`.`dss_products` UNION ALL
          SELECT 4,210,0 ,products_id AS p_id,NULL FROM `cd_website`.`dss_products` UNION ALL
          SELECT 4,212,0 ,products_id AS p_id,'0' FROM `cd_website`.`dss_products` UNION ALL  
        SELECT 4 AS e_id,177 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`  UNION ALL        
        SELECT 4 AS e_id,82 AS a_id,0 AS s_id,products_id AS p_id,`products_metatitle` AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,84 AS a_id,0 AS s_id,products_id AS p_id,`products_metadesc` AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,85 AS a_id,0 AS s_id,products_id AS p_id,(SELECT `value` FROM catalog_product_entity_media_gallery WHERE entity_id =products_id LIMIT 0,1 ) AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,86 AS a_id,0 AS s_id,products_id AS p_id,(SELECT `value` FROM catalog_product_entity_media_gallery WHERE entity_id =products_id LIMIT 1,1 ) AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,87 AS a_id,0 AS s_id,products_id AS p_id,(SELECT `value` FROM catalog_product_entity_media_gallery WHERE entity_id =products_id LIMIT 2,1 ) AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,107 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,103 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`   UNION ALL        
	SELECT 4,109,0 ,products_id AS p_id,'container2' FROM `cd_website`.`dss_products` UNION ALL
	SELECT 4,147,0 ,products_id AS p_id,'0'  FROM `cd_website`.`dss_products` UNION ALL
	SELECT 4,123,0 ,products_id AS p_id,NULL  FROM `cd_website`.`dss_products` UNION ALL		
        SELECT 4 AS e_id,122 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`   UNION ALL        
        SELECT 4 AS e_id,112 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,113 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`   UNION ALL
        SELECT 4 AS e_id,114 AS a_id,0 AS s_id,products_id AS p_id,NULL AS val FROM `cd_website`.`dss_products`        
        )AS entity ORDER BY entity.p_id;                    
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_product_images` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_product_images` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_images`()
BEGIN
INSERT INTO `catalog_product_entity_media_gallery`
            (
             `attribute_id`,
             `entity_id`,
             `value`)
SELECT 88,pid,image_url FROM (
SELECT  products_id AS pid,IF(new_img = '',products_image,new_img) AS image_url FROM cd_website.`dss_products` -- WHERE new_img <> ''
UNION ALL
(SELECT  mo.product_id AS pid,md.`image_title` AS image_url
FROM    (
        SELECT  DISTINCT product_id
        FROM    `cd_website`.`dss_products_images`  WHERE product_id <> '' 
        ) mo
JOIN    `cd_website`.`dss_products_images` md
ON      md.product_id >= mo.product_id
        AND md.product_id <= mo.product_id
        AND image_id <=
        COALESCE
                (
                (
                SELECT  image_id
                FROM    `cd_website`.`dss_products_images` mi
                WHERE   mi.product_id = mo.product_id
                ORDER BY
                        image_id
                LIMIT 1, 1
                ),
               ( SELECT  image_id
                FROM    `cd_website`.`dss_products_images` mi
                WHERE   mi.product_id = mo.product_id
                ORDER BY
                        image_id
                LIMIT 0,1)
                )
                )
                ) allimages 
                ORDER BY pid; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_product_index_price` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_product_index_price` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_index_price`()
BEGIN
INSERT INTO `catalog_product_index_price` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`, `group_price`)
SELECT CAST(products_id AS CHAR(6)),0,1,0,`products_price` ,`products_price` ,`products_price` ,`products_price` ,NULL,NULL  FROM `cd_website`.`dss_products`  UNION ALL
SELECT CAST(products_id AS CHAR(6)),1,1,0,`products_price` ,`products_price` ,`products_price` ,`products_price` ,NULL,NULL  FROM `cd_website`.`dss_products`  UNION ALL
SELECT CAST(products_id AS CHAR(6)),2,1,0,`products_price` ,`products_price` ,`products_price` ,`products_price` ,NULL,NULL  FROM `cd_website`.`dss_products`  UNION ALL
SELECT CAST(products_id AS CHAR(6)),4,1,0,`products_price` ,`products_price` ,`products_price` ,`products_price` ,NULL,NULL  FROM `cd_website`.`dss_products`  UNION ALL
SELECT CAST(products_id AS CHAR(6)),5,1,0,`products_price` ,`products_price` ,`products_price` ,`products_price` ,NULL,NULL  FROM `cd_website`.`dss_products` ;
        
        
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_product_url_rewrite` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_product_url_rewrite` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_product_url_rewrite`()
BEGIN
 
   INSERT INTO `core_url_rewrite` (`store_id`,`category_id`,`product_id`,`id_path`,`request_path`,`target_path`,`is_system`)
   SELECT '1',NULL,CAST(products_id AS CHAR(6)),CONCAT('product/',products_id),IF(LENGTH(products_urlkey) > 55,CONCAT(products_id,`products_urlkey`,'.html'), CONCAT(`products_urlkey`,products_id,'.html')) ,CONCAT('catalog/product/view/id/',products_id),1 FROM `cd_website`.`dss_products`;
 -- SELECT '1',NULL,CAST(products_id AS CHAR(6)),CONCAT('product/',products_id),CONCAT(`products_urlkey`,products_id,'.html') ,CONCAT('catalog/product/view/id/',products_id),1 FROM `cd_website`.`dss_products`;    
 
        
        
 SELECT 'products url rewrite added !';  
        
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_sales_flat_address` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_sales_flat_address` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_sales_flat_address`()
BEGIN  
 
INSERT  INTO `sales_flat_quote_address`
(`quote_id`,`created_at`,`updated_at`,`customer_id`,`save_in_address_book`,`customer_address_id`,`address_type`
,`email`,`prefix`,`firstname`,`middlename`,`lastname`,`suffix`,`company`,`street`,`city`,`region`,`region_id`,`postcode`,`country_id`
,`telephone`,`fax`,`same_as_billing`,`free_shipping`,`collect_shipping_rates`,`shipping_method`,`shipping_description`,`weight`
,`subtotal`,`base_subtotal`,`subtotal_with_discount`,`base_subtotal_with_discount`,`tax_amount`,`base_tax_amount`,`shipping_amount`
,`base_shipping_amount`,`shipping_tax_amount`,`base_shipping_tax_amount`,`discount_amount`,`base_discount_amount`,`grand_total`
,`base_grand_total`,`customer_notes`,`applied_taxes`,`discount_description`,`shipping_discount_amount`,`base_shipping_discount_amount`
,`subtotal_incl_tax`,`base_subtotal_total_incl_tax`,`hidden_tax_amount`,`base_hidden_tax_amount`,`shipping_hidden_tax_amount`,`base_shipping_hidden_tax_amnt`
,`shipping_incl_tax`,`base_shipping_incl_tax`,`vat_id`,`vat_is_valid`,`vat_request_id`,`vat_request_date`,`vat_request_success`
,`gift_message_id`,`base_customer_balance_amount`,`customer_balance_amount`,`gift_cards_amount`,`base_gift_cards_amount`,`gift_cards`
,`used_gift_cards`,`giftregistry_item_id`,`gw_id`,`gw_allow_gift_receipt`,`gw_add_card`,`gw_base_price`,`gw_price`,`gw_items_base_price`
,`gw_items_price`,`gw_card_base_price`,`gw_card_price`,`gw_base_tax_amount`,`gw_tax_amount`,`gw_items_base_tax_amount`,`gw_items_tax_amount`
,`gw_card_base_tax_amount`,`gw_card_tax_amount`,`reward_points_balance`,`base_reward_currency_amount`,`reward_currency_amount`,`mpcashondelivery`) 
SELECT  ao.order_id,ao.orderdate,ao.orderdate, ao.customer_id,1,0,addresstype,c.customer_email,NULL,c.customer_fname,NULL,c.customer_lname,NULL AS suffix
,NULL,ao.customer_address,ao.customer_city,ao.customer_state,ao.customer_area,NULL,NUll,contactnumber,NULL,0,0,0,NULL,NULL,0.0000,order_amount AS subtotal,order_amount,order_amount,order_amount
,0.0000,0.0000,0.0000,0.0000 AS base_shippingamount,0.0000,0.0000,0.0000,0.0000,order_amount AS gtot,order_amount,
NULL,'a:0:{}',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000
FROM (
SELECT o.order_id, o.`order_date` AS orderdate,o.customer_id, 'shipping'  AS addresstype,o.`shipping_mobile_number` AS contactnumber,o.`order_amount`,s.customer_address,s.customer_state,s.customer_city,s.customer_country,s.customer_zip,s.customer_area
FROM cd_website.`dss_orders` AS o 
LEFT JOIN 
(
SELECT * FROM cd_website.`dss_shipping` GROUP BY shipping_mobile_number ) s ON o.`shipping_mobile_number` = s.`shipping_mobile_number`
UNION ALL
SELECT o.order_id, o.`order_date` AS orderdate,o.customer_id, 'billing'  AS addresstype,o.`billing_mobile_number` AS contactnumber,o.`order_amount`,b.customer_address,b.customer_state,b.customer_city,b.customer_country,b.customer_zip,b.customer_area
FROM cd_website.`dss_orders` AS o 
LEFT JOIN 
(
SELECT * FROM cd_website.`dss_billing` GROUP BY billing_mobile_number ) b ON o.`billing_mobile_number` = b.`billing_mobile_number`
) ao
INNER JOIN `cd_website`.`dss_customers` AS c ON ao.customer_id = c.`customer_id`
ORDER BY ao.order_id;
INSERT  INTO 
`sales_flat_order_address`
(`parent_id`,`customer_address_id`,`quote_address_id`,`region_id`,`customer_id`,`fax`,`region`,`postcode`,`lastname`,`street`,`city`
,`email`,`telephone`,`country_id`,`firstname`,`address_type`,`prefix`,`middlename`,`suffix`,`company`,`vat_id`,`vat_is_valid`
,`vat_request_id`,`vat_request_date`,`vat_request_success`,`giftregistry_item_id`,`mpcashondelivery`) 
SELECT  ao.order_id,NULL,NULL,NULL, ao.customer_id,NULL,ao.customer_state,ao.customer_area,c.customer_lname,ao.customer_address,ao.customer_city
,c.customer_email,contactnumber,NULL,c.customer_fname,addresstype,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000
FROM (
SELECT o.order_id,o.customer_id, 'shipping'  AS addresstype,o.`shipping_mobile_number` AS contactnumber,o.`order_amount`,s.customer_address,s.customer_state,s.customer_city,s.customer_country,s.customer_zip,s.customer_area
FROM cd_website.`dss_orders` AS o 
LEFT JOIN 
(
SELECT * FROM cd_website.`dss_shipping` GROUP BY shipping_mobile_number ) s ON o.`shipping_mobile_number` = s.`shipping_mobile_number`
UNION ALL
SELECT o.order_id,o.customer_id, 'billing'  AS addresstype,o.`billing_mobile_number` AS contactnumber,o.`order_amount`,b.customer_address,b.customer_state,b.customer_city,b.customer_country,b.customer_zip,b.customer_area
FROM cd_website.`dss_orders` AS o 
LEFT JOIN 
(
SELECT * FROM cd_website.`dss_billing` GROUP BY billing_mobile_number ) b ON o.`billing_mobile_number` = b.`billing_mobile_number`
) ao
INNER JOIN `cd_website`.`dss_customers` AS c ON ao.customer_id = c.`customer_id`
ORDER BY ao.order_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_sales_flat_order` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_sales_flat_order` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_sales_flat_order`()
BEGIN 
INSERT  INTO `sales_flat_quote`
(`entity_id`,`store_id`,`created_at`,`updated_at`,`converted_at`,`is_active`,`is_virtual`,`is_multi_shipping`,`items_count`,`items_qty`,`orig_order_id`,`store_to_base_rate`,`store_to_quote_rate`,`base_currency_code`,`store_currency_code`,`quote_currency_code`
,`grand_total`,`base_grand_total`,`checkout_method`,`customer_id`,`customer_tax_class_id`,`customer_group_id`,`customer_email`,`customer_prefix`,`customer_firstname`,`customer_middlename`,`customer_lastname`,
`customer_suffix`,`customer_dob`,`customer_note`,`customer_note_notify`,`customer_is_guest`,`remote_ip`,`applied_rule_ids`,`reserved_order_id`,`password_hash`,`coupon_code`,`global_currency_code`,`base_to_global_rate`
,`base_to_quote_rate`,`customer_taxvat`,`customer_gender`,`subtotal`,`base_subtotal`,`subtotal_with_discount`,`base_subtotal_with_discount`,`is_changed`,`trigger_recollect`,`ext_shipping_info`,`gift_message_id`,`is_persistent`,
`customer_balance_amount_used`,`base_customer_bal_amount_used`,`use_customer_balance`,`gift_cards`,`gift_cards_amount`,`base_gift_cards_amount`,`gift_cards_amount_used`,`base_gift_cards_amount_used`,`gw_id`,`gw_allow_gift_receipt`,`gw_add_card`,`gw_base_price`,`gw_price`,`gw_items_base_price`,`gw_items_price`,`gw_card_base_price`,`gw_card_price`,`gw_base_tax_amount`,`gw_tax_amount`,`gw_items_base_tax_amount`,`gw_items_tax_amount`,`gw_card_base_tax_amount`,`gw_card_tax_amount`,`use_reward_points`,`reward_points_balance`,`base_reward_currency_amount`,`reward_currency_amount`,`mpcashondelivery`)
SELECT o.order_id,1, o.`order_date`, o.`order_date`, o.`order_date`,1,0,0,COUNT(op.order_number)  AS item_count,SUM(op.`order_product_qty`) AS item_quantity,0,1.0000,1.0000,'AED','AED','AED' -- 15
,o.`order_amount`,o.`order_amount`,o.`payment_method`,o.`customer_id`,3,1,c.`customer_email`,NULL,c.`customer_fname`,NULL,c.`customer_lname` -- 26
,NULL,NULL,NULL,0,0,NULL,NULL,CONCAT(SUBSTR('100000000',1,9-LENGTH(o.order_id)),o.order_id),NULL,NULL,'AED',1.0000,1.0000 AS base_to_quote_rate,NULL,NULL,c.`customer_gender`,o.`order_amount`,o.`order_amount`,o.`order_amount`,o.`order_amount`,1,0,NULL,NULL,0 AS persistent -- 51
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000
FROM cd_website.`dss_orders` AS o 
INNER JOIN cd_website.`dss_customers` AS c 
ON o.customer_id = c.`customer_id`
INNER JOIN cd_website.`dss_order_product` AS op
ON o.order_number = op.order_number
GROUP BY op.`order_number`;
INSERT  INTO `sales_flat_order`
(`entity_id`,`state`,`status`,`coupon_code`,`protect_code`,`shipping_description`,`is_virtual`,`store_id`,`customer_id`
,`base_discount_amount`,`base_discount_canceled`,`base_discount_invoiced`,`base_discount_refunded`,`base_grand_total`
,`base_shipping_amount`,`base_shipping_canceled`,`base_shipping_invoiced`,`base_shipping_refunded`,`base_shipping_tax_amount`
,`base_shipping_tax_refunded`,`base_subtotal`,`base_subtotal_canceled`,`base_subtotal_invoiced`,`base_subtotal_refunded`,`base_tax_amount`
,`base_tax_canceled`,`base_tax_invoiced`,`base_tax_refunded`,`base_to_global_rate`,`base_to_order_rate`,`base_total_canceled`,`base_total_invoiced`
,`base_total_invoiced_cost`,`base_total_offline_refunded`,`base_total_online_refunded`,`base_total_paid`,`base_total_qty_ordered`,`base_total_refunded`
,`discount_amount`,`discount_canceled`,`discount_invoiced`,`discount_refunded`,`grand_total`,`shipping_amount`,`shipping_canceled`,`shipping_invoiced`
,`shipping_refunded`,`shipping_tax_amount`,`shipping_tax_refunded`,`store_to_base_rate`,`store_to_order_rate`,`subtotal`,`subtotal_canceled`
,`subtotal_invoiced`,`subtotal_refunded`,`tax_amount`,`tax_canceled`,`tax_invoiced`,`tax_refunded`,`total_canceled`,`total_invoiced`,`total_offline_refunded`
,`total_online_refunded`,`total_paid`,`total_qty_ordered`,`total_refunded`,`can_ship_partially`,`can_ship_partially_item`,`customer_is_guest`
,`customer_note_notify`,`billing_address_id`,`customer_group_id`,`edit_increment`,`email_sent`,`forced_shipment_with_invoice`
,`payment_auth_expiration`,`quote_address_id`,`quote_id`,`shipping_address_id`,`adjustment_negative`,`adjustment_positive`,`base_adjustment_negative`
,`base_adjustment_positive`,`base_shipping_discount_amount`,`base_subtotal_incl_tax`,`base_total_due`,`payment_authorization_amount`,`shipping_discount_amount`
,`subtotal_incl_tax`,`total_due`,`weight`,`customer_dob`,`increment_id`,`applied_rule_ids`,`base_currency_code`,`customer_email`,`customer_firstname`
,`customer_lastname`,`customer_middlename`,`customer_prefix`,`customer_suffix`,`customer_taxvat`,`discount_description`,`ext_customer_id`
,`ext_order_id`,`global_currency_code`,`hold_before_state`,`hold_before_status`,`order_currency_code`,`original_increment_id`,`relation_child_id`
,`relation_child_real_id`,`relation_parent_id`,`relation_parent_real_id`,`remote_ip`,`shipping_method`,`store_currency_code`,`store_name`
,`x_forwarded_for`,`customer_note`,`created_at`,`updated_at`,`total_item_count`,`customer_gender`,`hidden_tax_amount`,`base_hidden_tax_amount`
,`shipping_hidden_tax_amount`,`base_shipping_hidden_tax_amnt`,`hidden_tax_invoiced`,`base_hidden_tax_invoiced`,`hidden_tax_refunded`
,`base_hidden_tax_refunded`,`shipping_incl_tax`,`base_shipping_incl_tax`,`coupon_rule_name`,`paypal_ipn_customer_notified`,`gift_message_id`
,`base_customer_balance_amount`,`customer_balance_amount`,`base_customer_balance_invoiced`,`customer_balance_invoiced`,`base_customer_balance_refunded`
,`customer_balance_refunded`,`bs_customer_bal_total_refunded`,`customer_bal_total_refunded`,`gift_cards`,`base_gift_cards_amount`,`gift_cards_amount`
,`base_gift_cards_invoiced`,`gift_cards_invoiced`,`base_gift_cards_refunded`,`gift_cards_refunded`,`gw_id`,`gw_allow_gift_receipt`,`gw_add_card`
,`gw_base_price`,`gw_price`,`gw_items_base_price`,`gw_items_price`,`gw_card_base_price`,`gw_card_price`,`gw_base_tax_amount`,`gw_tax_amount`
,`gw_items_base_tax_amount`,`gw_items_tax_amount`,`gw_card_base_tax_amount`,`gw_card_tax_amount`,`gw_base_price_invoiced`,`gw_price_invoiced`
,`gw_items_base_price_invoiced`,`gw_items_price_invoiced`,`gw_card_base_price_invoiced`,`gw_card_price_invoiced`,`gw_base_tax_amount_invoiced`
,`gw_tax_amount_invoiced`,`gw_items_base_tax_invoiced`,`gw_items_tax_invoiced`,`gw_card_base_tax_invoiced`,`gw_card_tax_invoiced`,`gw_base_price_refunded`
,`gw_price_refunded`,`gw_items_base_price_refunded`,`gw_items_price_refunded`,`gw_card_base_price_refunded`,`gw_card_price_refunded`,`gw_base_tax_amount_refunded`
,`gw_tax_amount_refunded`,`gw_items_base_tax_refunded`,`gw_items_tax_refunded`,`gw_card_base_tax_refunded`,`gw_card_tax_refunded`,`reward_points_balance`
,`base_reward_currency_amount`,`reward_currency_amount`,`base_rwrd_crrncy_amt_invoiced`,`rwrd_currency_amount_invoiced`,`base_rwrd_crrncy_amnt_refnded`
,`rwrd_crrncy_amnt_refunded`,`reward_points_balance_refund`,`reward_points_balance_refunded`,`reward_salesrule_points`,`mpcashondelivery`,`dailydeals`) 
SELECT o.order_id,'new','pending',NULL,NULL,'Flat Rate - Fixed',0,1,o.customer_id,0.0000,NULL,NULL,NULL,o.order_amount
,0.0000,NULL,NULL,NULL,0.0000,NULL,o.order_amount AS base_subtotal ,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,1.0000,1.0000,NULL,NULL AS base_totalinvoiced
,NULL,NULL,NULL,o.order_amount,NULL,NULL AS basea_tol_refunded,0.0000,NULL,NULL,NULL,o.order_amount,0.0000,NULL,NULL AS shipping_invoiced,NULL,0.0000
,NULL,1.0000,1.0000,o.order_amount,NULL AS sub_totalcanceled,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL AS total_offline,NULL,NULL,SUM(op.`order_product_qty`) AS item_qty_ordered
,NULL,NULL,NULL,0,0,422 AS billing_address_id,1,NULL,1,NULL,NULL,NULL,o.order_id,423 AS shipping_addressId,NULL,NULL,NULL,NULL,0.0000,0.0000,NULL AS base_tot_due
,NULL,0.0000,0.0000,NULL,0.0000,NULL,CONCAT(SUBSTR('100000000',1,9-LENGTH(o.order_id)),o.order_id),NULL,'AED',c.`customer_email`,c.`customer_fname`,c.`customer_lname`,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,'AED',NULL,NULL,'AED' AS ord_cur_code,NULL,NULL,NULL,NULL,NULL,NULL,'flatrate_flatrate','AED','crazydeals.com\nmain website store\nEnglish'
,NULL,NULL,'2015-08-07 10:29:04','2015-08-07 10:29:12',COUNT(op.order_number)  AS item_count,c.`customer_gender`,0.0000,0.0000,0.0000,0.0000,NULL
,NULL,NULL,NULL,0.0000,0.0000,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,NULL     
FROM cd_website.`dss_orders` AS o 
INNER JOIN cd_website.`dss_customers` AS c 
ON o.customer_id = c.`customer_id`
INNER JOIN cd_website.`dss_order_product` AS op
ON o.order_number = op.order_number
GROUP BY op.`order_number`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_sales_flat_quote` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_sales_flat_quote` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_sales_flat_quote`()
BEGIN 
     
INSERT  INTO `sales_flat_quote`
(`entity_id`,`store_id`,`created_at`,`updated_at`,`converted_at`,`is_active`,`is_virtual`,`is_multi_shipping`,`items_count`,`items_qty`,`orig_order_id`,`store_to_base_rate`,`store_to_quote_rate`,`base_currency_code`,`store_currency_code`,`quote_currency_code`
,`grand_total`,`base_grand_total`,`checkout_method`,`customer_id`,`customer_tax_class_id`,`customer_group_id`,`customer_email`,`customer_prefix`,`customer_firstname`,`customer_middlename`,`customer_lastname`,
`customer_suffix`,`customer_dob`,`customer_note`,`customer_note_notify`,`customer_is_guest`,`remote_ip`,`applied_rule_ids`,`reserved_order_id`,`password_hash`,`coupon_code`,`global_currency_code`,`base_to_global_rate`
,`base_to_quote_rate`,`customer_taxvat`,`customer_gender`,`subtotal`,`base_subtotal`,`subtotal_with_discount`,`base_subtotal_with_discount`,`is_changed`,`trigger_recollect`,`ext_shipping_info`,`gift_message_id`,`is_persistent`,
`customer_balance_amount_used`,`base_customer_bal_amount_used`,`use_customer_balance`,`gift_cards`,`gift_cards_amount`,`base_gift_cards_amount`,`gift_cards_amount_used`,`base_gift_cards_amount_used`,`gw_id`,`gw_allow_gift_receipt`,`gw_add_card`,`gw_base_price`,`gw_price`,`gw_items_base_price`,`gw_items_price`,`gw_card_base_price`,`gw_card_price`,`gw_base_tax_amount`,`gw_tax_amount`,`gw_items_base_tax_amount`,`gw_items_tax_amount`,`gw_card_base_tax_amount`,`gw_card_tax_amount`,`use_reward_points`,`reward_points_balance`,`base_reward_currency_amount`,`reward_currency_amount`,`mpcashondelivery`)
SELECT o.order_id,1, o.`order_date`, o.`order_date`, o.`order_date`,1,0,0,COUNT(op.order_number)  AS item_count,SUM(op.`order_product_qty`) AS item_quantity,0,1.0000,1.0000,'AED','AED','AED' -- 15
,o.`order_amount`,o.`order_amount`,o.`payment_method`,o.`customer_id`,3,1,c.`customer_email`,NULL,c.`customer_fname`,NULL,c.`customer_lname` -- 26
,NULL,NULL,NULL,0,0,NULL,NULL,CONCAT(SUBSTR('100000000',1,9-LENGTH(o.order_id)),o.order_id),NULL,NULL,'AED',1.0000,1.0000 AS base_to_quote_rate,NULL,NULL,c.`customer_gender`,o.`order_amount`,o.`order_amount`,o.`order_amount`,o.`order_amount`,1,0,NULL,NULL,0 AS persistent -- 51
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000
FROM cd_website.`dss_orders` AS o 
INNER JOIN cd_website.`dss_customers` AS c 
ON o.customer_id = c.`customer_id`
INNER JOIN cd_website.`dss_order_product` AS op
ON o.order_number = op.order_number
GROUP BY op.`order_number`;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `add_sales_quote_payment` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_sales_quote_payment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_sales_quote_payment`()
BEGIN 
INSERT  INTO 
`sales_flat_quote_payment`
(`quote_id`,`created_at`,`updated_at`,`method`,`cc_type`,`cc_number_enc`,`cc_last4`,`cc_cid_enc`,`cc_owner`,`cc_exp_month`,`cc_exp_year`,`cc_ss_owner`,`cc_ss_start_month`,`cc_ss_start_year`,`po_number`,`additional_data`,`cc_ss_issue`,`additional_information`,`paypal_payer_id`,`paypal_payer_status`,`paypal_correlation_id`,`cybersource_token`,`ideal_issuer_id`,`ideal_issuer_list`) 
SELECT o.order_id,o.order_date,o.order_date,'cashondelivery',NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
FROM cd_website.`dss_orders` AS o;
     
INSERT  INTO `sales_flat_order_payment`
(`entity_id`,`parent_id`,`base_shipping_captured`,`shipping_captured`,`amount_refunded`,`base_amount_paid`,`amount_canceled`,`base_amount_authorized`
,`base_amount_paid_online`,`base_amount_refunded_online`
,`base_shipping_amount`,`shipping_amount`,`amount_paid`,`amount_authorized`,`base_amount_ordered`,`base_shipping_refunded`,`shipping_refunded`
,`base_amount_refunded`,`amount_ordered`,`base_amount_canceled`,`quote_payment_id`,`additional_data`,`cc_exp_month`,`cc_ss_start_year`,`echeck_bank_name`
,`method`,`cc_debug_request_body`,`cc_secure_verify`,`protection_eligibility`,`cc_approval`,`cc_last4`,`cc_status_description`
,`echeck_type`,`cc_debug_response_serialized`,`cc_ss_start_month`,`echeck_account_type`,`last_trans_id`,`cc_cid_status`,`cc_owner`,`cc_type`,`po_number`,`cc_exp_year`,`cc_status`,`echeck_routing_number`,`account_status`,`anet_trans_method`,`cc_debug_response_body`,`cc_ss_issue`,`echeck_account_name`,`cc_avs_status`,`cc_number_enc`,`cc_trans_id`,`paybox_request_number`,`address_status`,`additional_information`,`cybersource_token`,`flo2cash_account_id`,`ideal_issuer_id`,`ideal_issuer_title`,`ideal_transaction_checked`,`paybox_question_number`)
SELECT o.order_id,o.order_id,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,o.order_amount,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,'cashondelivery',
0.0000 AS debug_request_body,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL 
FROM cd_website.`dss_orders` AS o;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `clean_customers` */

/*!50003 DROP PROCEDURE IF EXISTS  `clean_customers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_customers`()
BEGIN
 
 
 TRUNCATE TABLE `customer_entity_int`;
 TRUNCATE TABLE `customer_entity_text`;
 TRUNCATE TABLE `customer_entity_datetime`;
 TRUNCATE TABLE `customer_entity_decimal`;
 DELETE FROM customer_entity;
 Drop taBle If exists `TempCustomerVarchar`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `clean_order_tables` */

/*!50003 DROP PROCEDURE IF EXISTS  `clean_order_tables` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_order_tables`()
BEGIN 
TRUNCATE TABLE sales_flat_order;
TRUNCATE TABLE sales_flat_order_address;
TRUNCATE TABLE sales_flat_order_item;
TRUNCATE TABLE sales_flat_order_payment;
TRUNCATE TABLE sales_flat_order_grid;
TRUNCATE TABLE sales_flat_quote;
TRUNCATE TABLE sales_flat_quote_address;
TRUNCATE TABLE sales_flat_quote_payment;
TRUNCATE TABLE sales_flat_quote_item;
TRUNCATE TABLE sales_flat_quote_item_option;
TRUNCATE TABLE sales_flat_quote_shipping_rate;
END */$$
DELIMITER ;

/* Procedure structure for procedure `clean_product_tables` */

/*!50003 DROP PROCEDURE IF EXISTS  `clean_product_tables` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_product_tables`()
BEGIN
 
 
 
DELETE  FROM catalog_product_entity;
DELETE  FROM catalog_category_product;
TRUNCATE TABLE catalog_product_entity_int;
TRUNCATE TABLE catalog_product_entity_media_gallery;
TRUNCATE TABLE catalog_product_entity_datetime;
TRUNCATE TABLE catalog_product_entity_decimal;
TRUNCATE TABLE catalog_product_entity_text;
TRUNCATE TABLE catalog_product_entity_varchar;
TRUNCATE TABLE catalog_product_entity_gallery;
TRUNCATE TABLE catalog_product_entity_media_gallery_value;
TRUNCATE TABLE catalog_product_entity_tier_price;
TRUNCATE TABLE catalog_product_website;
DELETE FROM catalog_product_index_price;
DELETE FROM catalog_product_index_website;
TRUNCATE TABLE core_url_rewrite;
TRUNCATE TABLE catalog_category_product_index;
DELETE FROM catalogsearch_fulltext;
TRUNCATE TABLE cataloginventory_stock_item;
TRUNCATE TABLE cataloginventory_stock_status;
   
END */$$
DELIMITER ;

/* Procedure structure for procedure `Customer_Migrate` */

/*!50003 DROP PROCEDURE IF EXISTS  `Customer_Migrate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Customer_Migrate`()
BEGIN
 call clean_customers();      
 call add_customer_entity();
 call add_customer_entity_int();
  call fill_customer_varchar();
  
  call add_customer_varchar();
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `fill_customer_varchar` */

/*!50003 DROP PROCEDURE IF EXISTS  `fill_customer_varchar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fill_customer_varchar`()
BEGIN
CREATE TABLE TempCustomerVarchar SELECT * FROM customer_entity_varchar WHERE 1=0;
	
        INSERT INTO TempCustomerVarchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
	SELECT 1,3,customer_id,'Admin' FROM cd_website.`dss_customers` WHERE  CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID;
	
        
        INSERT INTO TempCustomerVarchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`) 	
	SELECT 1,4,customer_id,NULL FROM cd_website.`dss_customers` WHERE  CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID;
	
        INSERT INTO TempCustomerVarchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
        SELECT 1,5,customer_id,customer_fname FROM cd_website.`dss_customers` WHERE  CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID;
	
        INSERT INTO TempCustomerVarchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
        SELECT 1,6,customer_id,NULL FROM cd_website.`dss_customers` WHERE  CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID;
	
        INSERT INTO TempCustomerVarchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
        SELECT 1,7,customer_id,customer_lname FROM cd_website.`dss_customers` WHERE  CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID;
	
	
        INSERT INTO TempCustomerVarchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
        SELECT 1,8,customer_id,NULL FROM cd_website.`dss_customers` WHERE  CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID;
	
        INSERT INTO TempCustomerVarchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
	SELECT 1,12,customer_id,customer_password FROM cd_website.`dss_customers` WHERE  CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID;
	
        INSERT INTO TempCustomerVarchar(`entity_type_id`,`attribute_id`,`entity_id`,`value`)
        SELECT 1,15,customer_id,NULL FROM cd_website.`dss_customers` WHERE  CUSTOMER_EMAIL <> ''  GROUP BY CUSTOMER_EMAIL  ORDER BY CUSTOMER_ID ;
	
 select 'filled with' ,count(entity_id) from `TempCustomerVarchar`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Order_Migrate` */

/*!50003 DROP PROCEDURE IF EXISTS  `Order_Migrate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Order_Migrate`()
BEGIN 
     
CALL `clean_order_tables`();
call `add_sales_flat_order`();
call add_sales_flat_address();
call add_sales_quote_payment();
call `add_order_items`();
CALL `add_order_grid_shippingrate`();
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `Product_Migrate` */

/*!50003 DROP PROCEDURE IF EXISTS  `Product_Migrate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Product_Migrate`()
BEGIN  
     -- 
CALL `clean_product_tables`();
CALL add_product_entity();
-- CALL add_product_images(); 
 -- CALL add_product_entity_varchar(); -- 13 mints  
 CALL add_product_entity_text();
  CALL add_product_entity_decimal();
  CALL add_product_entity_datetime();
  CALL add_product_entity_int();
  CALL  `add_product_url_rewrite`();
  
  CALL `add_product_index_price`();
  
  
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `update_incomplete_images` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_incomplete_images` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `update_incomplete_images`()
BEGIN
INSERT INTO `catalog_product_entity_media_gallery`(`attribute_id`,`entity_id`,`value`)
SELECT `attribute_id`,`entity_id`,`value` FROM catalog_product_entity_media_gallery GROUP BY entity_id HAVING COUNT(entity_id) =1 UNION ALL
SELECT `attribute_id`,`entity_id`,`value` FROM catalog_product_entity_media_gallery GROUP BY entity_id HAVING COUNT(entity_id) =1;
INSERT INTO `catalog_product_entity_media_gallery`(`attribute_id`,`entity_id`,`value`)
SELECT `attribute_id`,`entity_id`,`value` FROM catalog_product_entity_media_gallery GROUP BY entity_id HAVING COUNT(entity_id) =2;
END */$$
DELIMITER ;

/* Procedure structure for procedure `update_sales_flat_address` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_sales_flat_address` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `update_sales_flat_address`()
BEGIN  
 
SET @s = 0;
INSERT  INTO `sales_flat_quote_address`
(`address_id`,`quote_id`,`created_at`,`updated_at`,`customer_id`,`save_in_address_book`,`customer_address_id`,`address_type`
,`email`,`prefix`,`firstname`,`middlename`,`lastname`,`suffix`,`company`,`street`,`city`,`region`,`region_id`,`postcode`,`country_id`
,`telephone`,`fax`,`same_as_billing`,`free_shipping`,`collect_shipping_rates`,`shipping_method`,`shipping_description`,`weight`
,`subtotal`,`base_subtotal`,`subtotal_with_discount`,`base_subtotal_with_discount`,`tax_amount`,`base_tax_amount`,`shipping_amount`
,`base_shipping_amount`,`shipping_tax_amount`,`base_shipping_tax_amount`,`discount_amount`,`base_discount_amount`,`grand_total`
,`base_grand_total`,`customer_notes`,`applied_taxes`,`discount_description`,`shipping_discount_amount`,`base_shipping_discount_amount`
,`subtotal_incl_tax`,`base_subtotal_total_incl_tax`,`hidden_tax_amount`,`base_hidden_tax_amount`,`shipping_hidden_tax_amount`,`base_shipping_hidden_tax_amnt`
,`shipping_incl_tax`,`base_shipping_incl_tax`,`vat_id`,`vat_is_valid`,`vat_request_id`,`vat_request_date`,`vat_request_success`
,`gift_message_id`,`base_customer_balance_amount`,`customer_balance_amount`,`gift_cards_amount`,`base_gift_cards_amount`,`gift_cards`
,`used_gift_cards`,`giftregistry_item_id`,`gw_id`,`gw_allow_gift_receipt`,`gw_add_card`,`gw_base_price`,`gw_price`,`gw_items_base_price`
,`gw_items_price`,`gw_card_base_price`,`gw_card_price`,`gw_base_tax_amount`,`gw_tax_amount`,`gw_items_base_tax_amount`,`gw_items_tax_amount`
,`gw_card_base_tax_amount`,`gw_card_tax_amount`,`reward_points_balance`,`base_reward_currency_amount`,`reward_currency_amount`,`mpcashondelivery`) 
SELECT  @s:=@s+1, ao.order_id,ao.orderdate,ao.orderdate, ao.customer_id,1,0,NULL,addresstype,c.customer_email,NULL,c.customer_fname,NULL,c.customer_lname,NULL AS suffix
,NULL,NULL,NULL,NULL,NULL,NULL,contactnumber,NULL,0,0,0,NULL,NULL,0.0000,order_amount AS subtotal,order_amount,order_amount,order_amount
,0.0000,0.0000,0.0000,0.0000 AS base_shippingamount,0.0000,0.0000,0.0000,0.0000,order_amount AS gtot,order_amount,
NULL,'a:0:{}',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000
FROM (
SELECT o.order_id, o.`order_date` AS orderdate,o.customer_id, 'shipping'  AS addresstype,o.`shipping_mobile_number` AS contactnumber,o.`order_amount`
FROM cd_website.`dss_orders` AS o 
UNION ALL
SELECT o.order_id, o.`order_date` AS orderdate,o.customer_id, 'billing'  AS addresstype,o.`billing_mobile_number` AS contactnumber,o.`order_amount`
FROM cd_website.`dss_orders` AS o 
) ao
INNER JOIN `cd_website`.`dss_customers` AS c ON ao.customer_id = c.`customer_id`
ORDER BY ao.order_id;
 
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;