-- select supplier_name, LENGTH(supplier_name)   from `dss_suppliers` ORDER BY LENGTH(supplier_name) DESC limit 1;
-- 
-- SELECT `category_name`, LENGTH(`category_name`)   FROM `dss_category` ORDER BY LENGTH(`category_name`) DESC LIMIT 1;
-- 
-- select supplier_name from dss_suppliers

-- select * into supplier_namebackup from `dss_suppliers`
-- CREATE TABLE supplier_namebackup SELECT * FROM `dss_suppliers`;
-- SELECT `contact_name_1`, LENGTH(`contact_name_1`)   FROM `dss_suppliers` ORDER BY LENGTH(`contact_name_1`) DESC LIMIT 1;
-- SELECT `products_title`, LENGTH(`products_title`)   FROM `dss_products` ORDER BY LENGTH(`products_title`) ASC LIMIT 1;
-- SELECT `products_desc`, LENGTH(`products_desc`)   FROM `dss_products` ORDER BY LENGTH(`products_desc`) DESC LIMIT 1;
-- 
--  SELECT `ip`, LENGTH(`ip`)   FROM `dss_customers` ORDER BY LENGTH(`ip`) DESC LIMIT 1;
-- select `customer_status` from dss_customers where customer_status = 1
--   SELECT customer_id FROM `dss_customers` WHERE customer_fname = 'Julie Maramba' OR customer_fname = 'roderic' 

-- select count(order_id) from `dss_orders`
SELECT COUNT(`order_id`), LENGTH(`device_imei`)   FROM `dss_order_product` ORDER BY LENGTH(`device_imei`) DESC LIMIT 1;

