--set identity_insert ProductPlacement off
--
insert into ProductPlacement (ProductID, PlacementID, SortOrder, DateFrom, DateTo, AllowedQuantity, SoldQuantity, CreationDate, isActive)
select product.id,1,3,null,null,50,1,GETDATE(),1 from Category inner join Product_Categories_Mapping on Category.ID = Product_Categories_Mapping.CategoryID 
                       inner join Product  on product.id = Product_Categories_Mapping.ProductID
where IsHomePageCategory =1

--insert into product (ID, ParentID, BrandID, VendorID, ProductManagerID, Name, ShortDescription, FullDescription, SKU, ProductType, EANNumber, MetaTitle, MetaKeywords, MetaDescription, SEOUrl, WarrantyPolicy, SearchKeywords, ImageName, ImageUrl, ImageThumbnailUrl, MRP, IsActive, CreatedOn, LastModified, ISBN, UniversalProductCode, BarcodeNumber, Size, Weight, UnitOfMeasurement, Length, Width, Height, IsDownload, UnlimitedDownload, MaxDownloads, AvailableStartDate, AvailableEndDate, IsShipEnable, IsFreeShipping, HasUserAgreement, UserAgreementText, TaxID, DisableBuyButton, CostPrice, Price, SpecialPrice, SpecialPriceStartDateTimeUtc, SpecialPriceEndDateTimeUtc, OldPrice, ShowOnHomePage, AllowCustomerReviews, DisableWishlistButton, DeliveryDate, DisplayOrder, IsStockable, StockQuantity, DisplayStockQuantity, DisplayStockAvailability, MinStockQuantity, NotifyAdminForQuantityBelow, OrderMinQuantity, OrderMaxQuantity, ApprovedRatingSum, NotApprovedRatingSum, ApprovedTotalReviews, NotApprovedTotalReviews, RestrictSale)
--select * from SnacCommerce_db..product where id in (110190,60166,60159)

select * from product where id in (
select productId from ProductPlacement where PlacementID in (

select ID from Placement where placement like 'Best%'
)

)

select product.id from Category inner join Product_Categories_Mapping on Category.ID = Product_Categories_Mapping.CategoryID 
                       inner join Product  on product.id = Product_Categories_Mapping.ProductID
where IsHomePageCategory =1


select * from ProductPlacement where PlacementID in (
select ID from Placement where placement like 'Best%'
)


--ID, ProductID, PlacementID, SortOrder, DateFrom, DateTo, AllowedQuantity, SoldQuantity, CreationDate, isActive
--ID, ParentID, BrandID, VendorID, ProductManagerID, Name, ShortDescription, FullDescription, SKU, ProductType, EANNumber, MetaTitle, MetaKeywords, MetaDescription, SEOUrl, WarrantyPolicy, SearchKeywords, ImageName, ImageUrl, ImageThumbnailUrl, MRP, IsActive, CreatedOn, LastModified, ISBN, UniversalProductCode, BarcodeNumber, Size, Weight, UnitOfMeasurement, Length, Width, Height, IsDownload, UnlimitedDownload, MaxDownloads, AvailableStartDate, AvailableEndDate, IsShipEnable, IsFreeShipping, HasUserAgreement, UserAgreementText, TaxID, DisableBuyButton, CostPrice, Price, SpecialPrice, SpecialPriceStartDateTimeUtc, SpecialPriceEndDateTimeUtc, OldPrice, ShowOnHomePage, AllowCustomerReviews, DisableWishlistButton, DeliveryDate, DisplayOrder, IsStockable, StockQuantity, DisplayStockQuantity, DisplayStockAvailability, MinStockQuantity, NotifyAdminForQuantityBelow, OrderMinQuantity, OrderMaxQuantity, ApprovedRatingSum, NotApprovedRatingSum, ApprovedTotalReviews, NotApprovedTotalReviews, RestrictSale