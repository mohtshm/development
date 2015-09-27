
SELECT CUSTOMER_id, customer_fname, customer_email, shipping_mobile_number FROM dss_customers INNER JOIN
(

	SELECT customer_id AS cid,shipping_mobile_number FROM dss_shipping INNER JOIN (
		SELECT  MAX(shipping_id) AS sid FROM dss_shipping WHERE shipping_mobile_number <> '' AND LENGTH(shipping_mobile_number) > 3 GROUP BY customer_id  
	) AS gShipping ON shipping_id = sid 
) AS sDetails ON customer_id = cid