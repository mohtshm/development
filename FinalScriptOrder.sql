SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;SET NAMES utf8;SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0;

-- select * from catalog_product_entity_media_gallery
SET GLOBAL FOREIGN_KEY_CHECKS=0;
  call `Customer_Migrate`();
 CALL Product_Migrate();
 


-- CALL add_sales_flat_address();
-- CALL add_sales_quote_payment();
-- CALL `add_order_items`();
-- CALL `add_order_grid_shippingrate`();
 
 
 
-- TRUNCATE TABLE core_url_rewrite; 
--  CALL  `add_product_url_rewrite`();
 
-- call add_customer_varchar_looping();

-- select * from tempcustomervarchar where entity_id like  '%52214%'

SET GLOBAL FOREIGN_KEY_CHECKS=1;

SET SQL_MODE=@OLD_SQL_MODE;SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;SET SQL_NOTES=@OLD_SQL_NOTES;