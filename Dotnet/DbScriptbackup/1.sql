ALTER TABLE [dbo].[StateProvince] DROP CONSTRAINT [StateProvince_Country]
GO
ALTER TABLE [dbo].[ShippingMethodRestrictions] DROP CONSTRAINT [ShippingMethod_RestrictedCountries_Target]
GO
ALTER TABLE [dbo].[Country] DROP CONSTRAINT [DF_Country_IsActive]
GO
DROP TABLE [dbo].[Country]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TwoLetterIsoCode] [nvarchar](2) NULL,
	[ThreeLetterIsoCode] [nvarchar](3) NULL,
	[NumericIsoCode] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL)
GO
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_LastModified]
GO
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_CreatedOn]
GO
ALTER TABLE [dbo].[Brand] DROP CONSTRAINT [DF_Brand_IsActive]
GO
DROP TABLE [dbo].[Brand]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [bigint]  NULL,
	[BrandName] [varchar](128) NOT NULL,
	[Description] [varchar](1024) NULL,
	[IsActive] [bit] NOT NULL,
	[MetaUrl] [varchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[MetaKeywords] [varchar](50) NULL,
	[MetaDescription] [varchar](1024) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ImageUrl] [varchar](200) NULL,
	[Language] [varchar](5) NULL,
	[LastModified] [datetime] NULL,
)
GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF_Category_LastModified]
GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF_Category_CreatedOn]
GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF_Category_IsDeleted]
GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF_Category_IsActive]
GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF_Category_SortOrder]
GO
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [DF_Category_ParentID]
GO
DROP TABLE [dbo].[Category]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] NOT NULL,
	[ParentID] [bigint] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[MetaTitle] [nvarchar](128) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](1024) NULL,
	[MetaUrl] [nvarchar](128) NULL,
	[ImageUrl] [nvarchar](128) NULL,
	[ThumbnailUrl] [nvarchar](128) NULL,
	[SortOrder] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsHomePageCategory] [bit] NOT NULL,
	[IsPopular] [bit] NOT NULL,
	[PopularSortOrder] [int] NOT NULL,	
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 )
GO
ALTER TABLE [dbo].[Category_Brand_Mapping] DROP CONSTRAINT [DF_Category_Brand_CreatedOn]
GO
DROP TABLE [dbo].[Category_Brand_Mapping]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Brand_Mapping](
	[ID] [int] NOT NULL,
	[Category_ID] [bigint] NULL,
	[Brand_ID] [bigint] NULL,
	[SortOrder] [int] NULL,
	[CreatedOn] [datetime] NULL)
GO
ALTER TABLE [dbo].[Supplier] DROP CONSTRAINT [DF_Supplier_CreatedOn]
GO
ALTER TABLE [dbo].[Supplier] DROP CONSTRAINT [DF_Supplier_isActive]
GO
ALTER TABLE [dbo].[Supplier] DROP CONSTRAINT [DF_Supplier_isWarrantyGiven]
GO
ALTER TABLE [dbo].[Purchase] DROP CONSTRAINT [FK_Purchase_Supplier]
GO
DROP TABLE [dbo].[Supplier]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [bigint] NOT NULL,
	[CompanyName] [nvarchar](128) NULL,
	[CategoryID] [int] NULL,
	[Email] [nvarchar](128) NULL,
	[Website] [varchar](30) NULL,
	[CompanyPhone1] [nvarchar](50) NULL,
	[CompanyPhone2] [nvarchar](50) NULL,
	[CompanyFaxNo1] [varchar](30) NULL,
	[BillingAddress] [nvarchar](400) NULL,
	[BillingPostalCode] [nvarchar](50) NULL,
	[ShippingAddress] [nvarchar](400) NULL,
	[ShippingPostalCode] [nvarchar](50) NULL,
	[SupplierManagerID] [nvarchar](128) NULL,
	[POSalesPersonName] [varchar](30) NULL,
	[POAttention] [varchar](30) NULL,
	[POContact1Title] [varchar](30) NULL,
	[POContact1Email] [varchar](30) NULL,
	[POContact1Phone] [varchar](30) NULL,
	[POContact1Mob] [varchar](30) NULL,
	[POContact1SkypeId] [varchar](30) NULL,
	[isPOContact1Default] [bit] NULL,
	[Contact2Name] [varchar](40) NULL,
	[Contact2Title] [varchar](30) NULL,
	[Contact2Email] [nvarchar](90) NULL,
	[Contact2Phone] [nvarchar](50) NULL,
	[Contact2Mob] [varchar](30) NULL,
	[Contact2SkypeId] [varchar](30) NULL,
	[isContact2Default] [bit] NULL,
	[Contact3Name] [varchar](40) NULL,
	[Contact3Title] [varchar](30) NULL,
	[Contact3Email] [varchar](30) NULL,
	[Contact3Phone] [varchar](30) NULL,
	[Contact3Mob] [varchar](30) NULL,
	[Contact3SkypeId] [varchar](30) NULL,
	[isContact3Default] [bit] NULL,
	[DiscountPercent] [decimal](18, 2) NULL,
	[PaymentTerms] [nvarchar](64) NULL,
	[CreditDays] [int] NULL,
	[ModeOfPayment] [varchar](30) NULL,
	[BankName] [varchar](50) NULL,
	[BranchAddress] [varchar](100) NULL,
	[IBANNo] [varchar](50) NULL,
	[Beneficiary] [varchar](50) NULL,
	[SwiftBic] [varchar](50) NULL,
	[Currency] [varchar](50) NULL,
	[isWarrantyGiven] [bit] NULL,
	[isActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[LastModified] [datetime] NULL)
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_DisableBuyButton]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_HasUserAgreement]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_IsFreeShipping]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_UnlimitedDownload]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_IsDownloaded]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_LastModified]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_CreatedOn]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_IsActive]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_ParentID]
GO
ALTER TABLE [dbo].[Product_Images_Mapping] DROP CONSTRAINT [FK_dbo.Product_Images_Mapping_dbo.Product_ProductID]
GO
ALTER TABLE [dbo].[Product_Images_Mapping] DROP CONSTRAINT [FK_Product_Images_Product]
GO
ALTER TABLE [dbo].[Purchase_Items] DROP CONSTRAINT [FK_Purchase_Items_Product]
GO
ALTER TABLE [dbo].[ShoppingCartItem] DROP CONSTRAINT [ShoppingCartItem_Product]
GO
ALTER TABLE [dbo].[BackInStockSubscription] DROP CONSTRAINT [BackInStockSubscription_Product]
GO
ALTER TABLE [dbo].[Deal_Details] DROP CONSTRAINT [FK_Deal_Details_Product]
GO
ALTER TABLE [dbo].[Discount_AppliedToProducts] DROP CONSTRAINT [Discount_AppliedToProducts_Target]
GO
DROP TABLE [dbo].[Product]
GO
 SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] NOT NULL,
	[ParentID] [bigint] NOT NULL,
	[BrandID] [bigint] NULL,
	[VendorID] [nvarchar](128) NULL,
	[ProductManagerID] [nvarchar](128) NULL,
	[Name] [nvarchar](256) NULL,
	[ShortDescription] [nvarchar](2028) NULL,
	[FullDescription] [nvarchar](max) NULL,
	[SKU] [nvarchar](128) NULL,
	[ProductType] [nvarchar](10) NOT NULL,
	[EANNumber] [nvarchar](128) NULL,
	[MetaTitle] [nvarchar](256) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](1024) NULL,
	[SEOUrl] [nvarchar](256) NULL,
	[WarrantyPolicy] [nvarchar](1024) NULL,
	[SearchKeywords] [nvarchar](max) NULL,
	[ImageName] [varchar](128) NULL,
	[ImageUrl] [varchar](128) NULL,
	[ImageThumbnailUrl] [varchar](128) NULL,
	[MRP] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[ISBN] [varchar](128) NULL,
	[UniversalProductCode] [varchar](128) NULL,
	[BarcodeNumber] [varchar](512) NULL,
	[Size] [varchar](25) NULL,
	[Weight] [varchar](128) NULL,
	[UnitOfMeasurement] [varchar](128) NULL,
	[Length] [int] NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[IsDownload] [bit] NULL,
	[UnlimitedDownload] [bit] NULL,
	[MaxDownloads] [int] NULL,
	[AvailableStartDate] [datetime] NULL,
	[AvailableEndDate] [datetime] NULL,
	[IsShipEnable] [bit] NULL,
	[IsFreeShipping] [bit] NULL,
	[HasUserAgreement] [bit] NULL,
	[UserAgreementText] [nvarchar](2028) NULL,
	[TaxID] [bigint] NULL,
	[DisableBuyButton] [bit] NULL,
	[CostPrice] [decimal](18, 4) NULL,
	[Price] [decimal](18, 4) NOT NULL,
	[SpecialPrice] [decimal](18, 4) NULL,
	[SpecialPriceStartDateTimeUtc] [datetime] NULL,
	[SpecialPriceEndDateTimeUtc] [datetime] NULL,
	[OldPrice] [decimal](18, 4) NULL,
	[ShowOnHomePage] [bit] NULL,
	[AllowCustomerReviews] [bit] NULL,
	[DisableWishlistButton] [bit] NULL,
	[DeliveryDate] [varchar](50) NULL,
	[DisplayOrder] [int] NULL,
	[IsStockable] [bit] NULL,
	[StockQuantity] [int] NULL,
	[DisplayStockQuantity] [bit] NULL,
	[DisplayStockAvailability] [bit] NULL,
	[MinStockQuantity] [int] NULL,
	[NotifyAdminForQuantityBelow] [int] NULL,
	[OrderMinQuantity] [int] NULL,
	[OrderMaxQuantity] [int] NULL,
	[ApprovedRatingSum] [int] NULL,
	[NotApprovedRatingSum] [int] NULL,
	[ApprovedTotalReviews] [int] NULL,
	[NotApprovedTotalReviews] [int] NULL,
	[RestrictSale] [int] NULL,
	[NewArrivalSortOrder]  int Default(0) NOT NULL 
 )
GO
DROP TABLE [dbo].[Product_Categories_Mapping]
GO
CREATE TABLE [dbo].[Product_Categories_Mapping](
	[ID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[SortOrder] [int] NOT NULL,
 )
GO
DROP TABLE [dbo].[Product_Supplier_Mapping]
GO
CREATE TABLE [dbo].[Product_Supplier_Mapping](
	[ID] [bigint] NOT NULL,
	[ProductID] [bigint] NULL,
	[SupplierID] [bigint] NULL,
	[IsDefault] [bit] NULL)
GO
ALTER TABLE [dbo].[Product_Images_Mapping] DROP CONSTRAINT [DF_ProductImages_CreatedOn]
GO
ALTER TABLE [dbo].[Product_Images_Mapping] DROP CONSTRAINT [DF_ProductImages_IsDeleted]
GO
DROP TABLE [dbo].[Product_Images_Mapping]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Images_Mapping](
	[ID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Name] [varchar](128) NULL,
	[Url] [varchar](128) NULL,
	[ThumbnailUrl] [varchar](128) NULL,
	[SortOrder] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL
	)
GO
ALTER TABLE [dbo].[Quicklink] DROP CONSTRAINT [DF_Quicklink_IsShowOnTopMenu]
GO
DROP TABLE [dbo].[Quicklink]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quicklink](
	[ID] [int] NOT NULL,
	[Quicklink_Name] [nvarchar](255) NOT NULL,
	[Quicklink_URL] [nvarchar](255) NOT NULL,
	[QuicklinkType] [nvarchar](255) NULL,
	[Ordering] [int] NULL,
	[Status] [bit] NOT NULL,
	[HasBanner] [bit] NULL,
	[BannerWidht] [int] NULL,
	[BannerHeight] [int] NULL,
	[IsSystemTypeBanner] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[IsShowOnTopMenu] [bit] NULL)
GO
DROP TABLE [dbo].[Banner]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] NOT NULL,
	[BannerTitle] [nvarchar](255) NOT NULL,
	[BannerType] [nvarchar](255) NOT NULL,
	[BannerLink] [nvarchar](255) NOT NULL,
	[BannerMap] [varchar](50) NOT NULL,
	[MapTag] [varchar](50) NOT NULL,
	[ImageUrl] [nvarchar](128) NULL,
	[ThumbImageUrl] [nvarchar](128) NULL,
	[DisplayType] [varchar](128) NULL,
	[SortOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL
	)
GO
ALTER TABLE [dbo].[Order] DROP CONSTRAINT [DF_Order_paypal_paid]
GO
ALTER TABLE [dbo].[DiscountUsageHistory] DROP CONSTRAINT [DiscountUsageHistory_Order]
GO
ALTER TABLE [dbo].[RewardPointsHistory] DROP CONSTRAINT [RewardPointsHistory_UsedWithOrder]
GO
ALTER TABLE [dbo].[Shipment] DROP CONSTRAINT [Shipment_Order]
GO
DROP TABLE [dbo].[Order]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [bigint]  NOT NULL,
	[OrderNumber] [nvarchar](40) NOT NULL,
	[StoreId] [int] NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[BillingAddressId] [bigint] NULL,
	[ShippingAddressId] [int] NULL,
	[IsPickUpInStore] [bit] NULL,
	[OrderStatusId] [int] NULL,
	[ShippingStatusId] [int] NULL,
	[PaymentStatusId] [int] NULL,
	[PaymentMethodType] [nvarchar](50) NULL,
	[CustomerCurrencyCode] [nvarchar](50) NULL,
	[CurrencyRate] [decimal](18, 0) NULL,
	[c_CouponCode] [nvarchar](128) NULL,
	[c_CouponAmount] [decimal](18, 0) NULL,
	[c_DeliveryDate] [datetime] NULL,
	[TaxRates] [nvarchar](50) NULL,
	[OrderTaxAmount] [decimal](18, 0) NULL,
	[OrderSubtotalInclTax] [decimal](18, 0) NULL,
	[OrderSubtotalExclTax] [decimal](18, 0) NULL,
	[OrderSubTotalDiscountInclTax] [decimal](18, 0) NULL,
	[OrderSubTotalDiscountExclTax] [decimal](18, 0) NULL,
	[OrderShippingInclTax] [decimal](18, 0) NULL,
	[OrderShippingExclTax] [decimal](18, 0) NULL,
	[OrderDiscountAmount] [decimal](18, 0) NULL,
	[OrderTotalAmount] [decimal](18, 0) NULL,
	[RefundedAmount] [decimal](18, 0) NULL,
	[RewardPointsWereAdded] [bit] NULL,
	[c_CustomerIP] [nvarchar](50) NULL,
	[AllowStoringCreditCardNumber] [bit] NULL,
	[CardType] [nvarchar](50) NULL,
	[CardName] [nvarchar](40) NULL,
	[CardNumber] [nvarchar](30) NULL,
	[MaskedCreditCardNumber] [nvarchar](130) NULL,
	[CardCvv2] [nvarchar](10) NULL,
	[CardExpirationMonth] [nvarchar](10) NULL,
	[CardExpirationYear] [nvarchar](10) NULL,
	[AuthorizationTransactionId] [nvarchar](128) NULL,
	[AuthorizationTransactionCode] [nvarchar](128) NULL,
	[AuthorizationTransactionResult] [nvarchar](128) NULL,
	[PaidDateUtc] [datetime] NULL,
	[IsShippingWaived] [bit] NULL,
	[ShippingMethod] [nvarchar](50) NULL,
	[c_AirwayBillNumber] [nvarchar](128) NULL,
	[c_CustomerConfirmed] [int] NULL,
	[c_OrderNote] [nvarchar](1600) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[StockMode] [int] NULL,
	[CurrentDepartmentId] [int] NULL,
	[IsOnHold] [bit] NULL,
	[OnHoldReason] [nvarchar](70) NULL,
	[UrgentDelivery] [bit] NULL,
	[paypal_paid] [bit] NULL
	)	
Go
DROP TABLE [dbo].[Order_Details]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[Id] [bigint]  NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[SupplierId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPriceInclTax] [decimal](18, 0) NULL,
	[UnitPriceExclTax] [decimal](18, 0) NULL,
	[c_SpecialPriceInclTax] [decimal](18, 0) NULL,
	[c_SpecialPriceExclTax] [decimal](18, 0) NULL,
	[DiscountAmountInclTax] [decimal](18, 0) NULL,
	[DiscountAmountExclTax] [decimal](18, 0) NULL,
	[OriginalProductCost] [decimal](18, 0) NOT NULL,
	[AttributeDescription] [nchar](128) NULL,
	[DownloadCount] [int] NULL,
	[IsDownloadActivated] [bit] NULL,
	[LicenseDownloadId] [bit] NULL,
	[ItemWeight] [decimal](18, 0) NULL,
	[c_IMEINumber] [nvarchar](128) NULL,
	[c_Color] [nvarchar](128) NULL,
	[c_IsDeal] [bit] NULL,
	[c_IsLPOGenerated] [bit] NULL,
	[c_WarrantyDuration] [int] NULL,
	[c_WarrantyAmount] [decimal](18, 0) NULL,
	[ItemDeleted] [bit] NULL,
	[Page_Type] [nvarchar](75) NULL,
	[VendorID] [nvarchar](128) NULL,
	[is_return] [bit] NULL
)
GO
DROP TABLE [dbo].[ProductReview]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductReview](
	[Id] [int] NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[VendorID] [varchar](128) NULL,
	[ProductId] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ReviewText] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[HelpfulYesTotal] [int] NOT NULL,
	[HelpfulNoTotal] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL
	)
GO
CREATE TABLE [dbo].[DTUserMapping](
    [DTUserMappingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[DTUserID] [bigint] NOT NULL,	
	)
GO
ALTER TABLE [dbo].[Coupons] DROP CONSTRAINT [DF__Coupons__Discoun__1411F17C]
GO
ALTER TABLE [dbo].[Coupons] DROP CONSTRAINT [DF__Coupons__Startin__131DCD43]
GO
ALTER TABLE [dbo].[Coupons] DROP CONSTRAINT [DF__Coupons__ExpiryD__1229A90A]
GO
DROP TABLE [dbo].[Coupons]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupons](
	[ID] [bigint] NOT NULL,
	[CouponCode] [varchar](8) NOT NULL,
	[CouponType] [varchar](128) NOT NULL,
	[CouponUsed] [bit] NULL,
	[UsedByUserID] [nvarchar](128) NULL,
	[ExpiryDate] [date] NOT NULL,
	[StartingDate] [date] NOT NULL,
	[DiscountAmount] [decimal](20, 2) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[DiscountType] [varchar](50) NULL,
	[IsForMultipleUse] [bit] NOT NULL)
GO
DROP TABLE [dbo].[Areas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[Id] [int] NOT NULL,
	[CityId] [int] NULL,
	[Name] [nvarchar](50) NULL
	)
GO
ALTER TABLE [dbo].[Placement] DROP CONSTRAINT [DF_Placement_isActive]
GO
DROP TABLE [dbo].[Placement]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Placement](
	[ID] [int] NOT NULL,
	[Placement] [varchar](50) NULL,
	[Type] [varchar](10) NULL,
	[PlacementUrl] [varchar](400) NULL,
	[PageTitle] [nvarchar](50) NULL,
	[PageLayout] [nvarchar](50) NULL,
	[PageKeywords] [nvarchar](200) NULL,
	[PageDesc] [nvarchar](max) NULL,
	[BannerImage] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[SortOrder] [int] NULL
) 
GO
ALTER TABLE [dbo].[ProductPlacement] DROP CONSTRAINT [DF_ProductPlacement_isActive]
GO
ALTER TABLE [dbo].[ProductPlacement] DROP CONSTRAINT [DF_ProductPlacement_CreationDate]
GO
DROP TABLE [dbo].[ProductPlacement]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPlacement](
	[ID] [int] NOT NULL,
	[ProductID] [bigint] NULL,
	[PlacementID] [bigint] NULL,
	[SortOrder] [bigint] NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
	[AllowedQuantity] [int] NULL,
	[SoldQuantity] [int] NULL,
	[CreationDate] [datetime] NULL,
	[isActive] [bit] NULL
	)
GO
DROP TABLE [dbo].[Warehouse_Zone]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse_Zone](
	[ID] [int] NOT NULL,
	[WarehouseID] [int] NULL,
	[ZoneName] [varchar](50) NULL
)
GO
DROP TABLE [dbo].[Warehouse_Shelf]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse_Shelf](
	[ID] [int] NOT NULL,
	[WarehouseID] [int] NOT NULL,
	[ZoneID] [int] NULL,
	[ShelfCode] [varchar](20) NULL,
	[ShelfType] [varchar](30) NULL,
	[ShelfSize] [varchar](20) NULL,
	[Section] [varchar](30) NULL
	)
GO
alter table supplier alter column CompanyName nvarchar(128) 
go
alter table supplier alter column CompanyPhone2 nvarchar(50) 
go
alter table supplier alter column CompanyPhone1 nvarchar(50) 
go
alter table supplier alter column Contact2Phone nvarchar(50) 
go
alter table supplier alter column Contact2Email nvarchar(90)
go
alter table supplier alter column paymentterms nvarchar(64) 
go
alter table supplier alter column Email nvarchar(128) 
go
alter table Product alter column metatitle nvarchar(256) 
go
alter table Product alter column name nvarchar(256) 
go
alter table Product alter column seourl nvarchar(256) 
go
alter table AspNetUsers alter column firstname nvarchar(128) 
go
alter table AspNetUsers alter column userip nvarchar(32)
go
alter table [order] alter column c_OrderNote nvarchar(1600)
go
alter table [order_details] alter column page_type nvarchar(256)
go
alter table [order_details] alter column c_IMEINumber nvarchar(1024)
go
alter table placement alter column [type] nvarchar(50)
GO