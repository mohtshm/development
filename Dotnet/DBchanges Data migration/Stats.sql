--select * from AspNetUserClaims
--select * from AspNetRoles
--select * from AspNetUserRoles
-- select top 100 * from AspNetUsers order by createdon desc
--select top 100 * from AspNetUsers order by createdon 
-- 300 73036   90843
-- 700 91434 91794  92516 -- 7128   24815-25720
-- 257 120458  312 124700
-- 1258 36883 1259 37629 100 38401 142 64416
select count(id) from AspNetUsers with (nolock)
--select  count(id) from order_details 	

