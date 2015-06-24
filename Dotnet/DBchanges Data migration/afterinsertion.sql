
CREATE TABLE [dbo].[Tmp_brand](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


SET IDENTITY_INSERT dbo.Tmp_brand ON 

go

IF EXISTS(SELECT * FROM dbo.brand)
INSERT INTO [dbo].[Tmp_brand]
           ([Id]
           ,[BrandName]
           ,[Description]
           ,[IsActive]
           ,[MetaUrl]
           ,[MetaTitle]
           ,[MetaKeywords]
           ,[MetaDescription]
           ,[DisplayOrder]
           ,[CreatedOn]
           ,[ImageUrl]
           ,[Language]
           ,[LastModified])           
                        SELECT [Id]
           ,[BrandName]
           ,[Description]
           ,[IsActive]
           ,[MetaUrl]
           ,[MetaTitle]
           ,[MetaKeywords]
           ,[MetaDescription]
           ,[DisplayOrder]
           ,[CreatedOn]
           ,[ImageUrl]
           ,[Language]
           ,[LastModified] FROM dbo.brand	TABLOCKX

 

go

SET IDENTITY_INSERT dbo.Tmp_brand OFF
go

DROP TABLE [dbo].[Brand]
GO

Exec sp_rename 'Tmp_brand', 'brand'
go

ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO

CREATE TABLE [dbo].[Tmp_Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
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
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

go
SET IDENTITY_INSERT dbo.Tmp_Category ON 

go

IF EXISTS(SELECT * FROM dbo.Category)
INSERT INTO [dbo].[Tmp_Category]
           ([ID]
		   ,[ParentID]
           ,[Name]
           ,[Description]
           ,[MetaTitle]
           ,[MetaKeywords]
           ,[MetaDescription]
           ,[MetaUrl]
           ,[ImageUrl]
           ,[ThumbnailUrl]
           ,[SortOrder]
           ,[IsActive]
           ,[IsDeleted]
           ,[CreatedOn]
           ,[LastModified])           
                        SELECT[ID], [ParentID]
           ,[Name]
           ,[Description]
           ,[MetaTitle]
           ,[MetaKeywords]
           ,[MetaDescription]
           ,[MetaUrl]
           ,[ImageUrl]
           ,[ThumbnailUrl]
           ,[SortOrder]
           ,[IsActive]
           ,[IsDeleted]
           ,[CreatedOn]
           ,[LastModified] FROM dbo.Category	TABLOCKX

 

go

SET IDENTITY_INSERT dbo.Tmp_Category OFF
go

DROP TABLE [dbo].[Category]
GO

Exec sp_rename 'Tmp_Category', 'Category'
go


ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ParentID]  DEFAULT ((0)) FOR [ParentID]
GO

ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO

ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO


CREATE TABLE [dbo].[Tmp_Supplier](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
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
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

go
SET IDENTITY_INSERT dbo.Tmp_Supplier ON 

go
IF EXISTS(SELECT * FROM [dbo].[Supplier])
INSERT INTO [dbo].[Tmp_Supplier]
           ([ID]
           ,[CompanyName]
           ,[CategoryID]
           ,[Email]
           ,[Website]
           ,[CompanyPhone1]
           ,[CompanyPhone2]
           ,[CompanyFaxNo1]
           ,[BillingAddress]
           ,[BillingPostalCode]
           ,[ShippingAddress]
           ,[ShippingPostalCode]
           ,[SupplierManagerID]
           ,[POSalesPersonName]
           ,[POAttention]
           ,[POContact1Title]
           ,[POContact1Email]
           ,[POContact1Phone]
           ,[POContact1Mob]
           ,[POContact1SkypeId]
           ,[isPOContact1Default]
           ,[Contact2Name]
           ,[Contact2Title]
           ,[Contact2Email]
           ,[Contact2Phone]
           ,[Contact2Mob]
           ,[Contact2SkypeId]
           ,[isContact2Default]
           ,[Contact3Name]
           ,[Contact3Title]
           ,[Contact3Email]
           ,[Contact3Phone]
           ,[Contact3Mob]
           ,[Contact3SkypeId]
           ,[isContact3Default]
           ,[DiscountPercent]
           ,[PaymentTerms]
           ,[CreditDays]
           ,[ModeOfPayment]
           ,[BankName]
           ,[BranchAddress]
           ,[IBANNo]
           ,[Beneficiary]
           ,[SwiftBic]
           ,[Currency]
           ,[isWarrantyGiven]
           ,[isActive]
           ,[CreatedOn]
           ,[LastModified])
		   select [ID]
           ,[CompanyName]
           ,[CategoryID]
           ,[Email]
           ,[Website]
           ,[CompanyPhone1]
           ,[CompanyPhone2]
           ,[CompanyFaxNo1]
           ,[BillingAddress]
           ,[BillingPostalCode]
           ,[ShippingAddress]
           ,[ShippingPostalCode]
           ,[SupplierManagerID]
           ,[POSalesPersonName]
           ,[POAttention]
           ,[POContact1Title]
           ,[POContact1Email]
           ,[POContact1Phone]
           ,[POContact1Mob]
           ,[POContact1SkypeId]
           ,[isPOContact1Default]
           ,[Contact2Name]
           ,[Contact2Title]
           ,[Contact2Email]
           ,[Contact2Phone]
           ,[Contact2Mob]
           ,[Contact2SkypeId]
           ,[isContact2Default]
           ,[Contact3Name]
           ,[Contact3Title]
           ,[Contact3Email]
           ,[Contact3Phone]
           ,[Contact3Mob]
           ,[Contact3SkypeId]
           ,[isContact3Default]
           ,[DiscountPercent]
           ,[PaymentTerms]
           ,[CreditDays]
           ,[ModeOfPayment]
           ,[BankName]
           ,[BranchAddress]
           ,[IBANNo]
           ,[Beneficiary]
           ,[SwiftBic]
           ,[Currency]
           ,[isWarrantyGiven]
           ,[isActive]
           ,[CreatedOn]
           ,[LastModified]  FROM [dbo].[Supplier]	TABLOCKX
		   
		   go

SET IDENTITY_INSERT [dbo].[Tmp_Supplier] OFF
go

DROP TABLE [dbo].[Supplier]
GO

Exec sp_rename 'Tmp_Supplier', 'Supplier'
go

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_isWarrantyGiven]  DEFAULT ((0)) FOR [isWarrantyGiven]
GO

ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

CREATE TABLE [dbo].[Tmp_Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


go
SET IDENTITY_INSERT [dbo].[Tmp_Product] ON 

go
IF EXISTS(SELECT * FROM [dbo].[Product])
INSERT INTO [dbo].[Tmp_Product]
           ([ID]
           ,[ParentID]
           ,[BrandID]
           ,[VendorID]
           ,[ProductManagerID]
           ,[Name]
           ,[ShortDescription]
           ,[FullDescription]
           ,[SKU]
           ,[ProductType]
           ,[EANNumber]
           ,[MetaTitle]
           ,[MetaKeywords]
           ,[MetaDescription]
           ,[SEOUrl]
           ,[WarrantyPolicy]
           ,[SearchKeywords]
           ,[ImageName]
           ,[ImageUrl]
           ,[ImageThumbnailUrl]
           ,[MRP]
           ,[IsActive]
           ,[CreatedOn]
           ,[LastModified]
           ,[ISBN]
           ,[UniversalProductCode]
           ,[BarcodeNumber]
           ,[Size]
           ,[Weight]
           ,[UnitOfMeasurement]
           ,[Length]
           ,[Width]
           ,[Height]
           ,[IsDownload]
           ,[UnlimitedDownload]
           ,[MaxDownloads]
           ,[AvailableStartDate]
           ,[AvailableEndDate]
           ,[IsShipEnable]
           ,[IsFreeShipping]
           ,[HasUserAgreement]
           ,[UserAgreementText]
           ,[TaxID]
           ,[DisableBuyButton]
           ,[CostPrice]
           ,[Price]
           ,[SpecialPrice]
           ,[SpecialPriceStartDateTimeUtc]
           ,[SpecialPriceEndDateTimeUtc]
           ,[OldPrice]
           ,[ShowOnHomePage]
           ,[AllowCustomerReviews]
           ,[DisableWishlistButton]
           ,[DeliveryDate]
           ,[DisplayOrder]
           ,[IsStockable]
           ,[StockQuantity]
           ,[DisplayStockQuantity]
           ,[DisplayStockAvailability]
           ,[MinStockQuantity]
           ,[NotifyAdminForQuantityBelow]
           ,[OrderMinQuantity]
           ,[OrderMaxQuantity]
           ,[ApprovedRatingSum]
           ,[NotApprovedRatingSum]
           ,[ApprovedTotalReviews]
           ,[NotApprovedTotalReviews]
           ,[RestrictSale])
		   
		   		   select [ID]
           ,[ParentID]
           ,[BrandID]
           ,[VendorID]
           ,[ProductManagerID]
           ,[Name]
           ,[ShortDescription]
           ,[FullDescription]
           ,[SKU]
           ,[ProductType]
           ,[EANNumber]
           ,[MetaTitle]
           ,[MetaKeywords]
           ,[MetaDescription]
           ,[SEOUrl]
           ,[WarrantyPolicy]
           ,[SearchKeywords]
           ,[ImageName]
           ,[ImageUrl]
           ,[ImageThumbnailUrl]
           ,[MRP]
           ,[IsActive]
           ,[CreatedOn]
           ,[LastModified]
           ,[ISBN]
           ,[UniversalProductCode]
           ,[BarcodeNumber]
           ,[Size]
           ,[Weight]
           ,[UnitOfMeasurement]
           ,[Length]
           ,[Width]
           ,[Height]
           ,[IsDownload]
           ,[UnlimitedDownload]
           ,[MaxDownloads]
           ,[AvailableStartDate]
           ,[AvailableEndDate]
           ,[IsShipEnable]
           ,[IsFreeShipping]
           ,[HasUserAgreement]
           ,[UserAgreementText]
           ,[TaxID]
           ,[DisableBuyButton]
           ,[CostPrice]
           ,[Price]
           ,[SpecialPrice]
           ,[SpecialPriceStartDateTimeUtc]
           ,[SpecialPriceEndDateTimeUtc]
           ,[OldPrice]
           ,[ShowOnHomePage]
           ,[AllowCustomerReviews]
           ,[DisableWishlistButton]
           ,[DeliveryDate]
           ,[DisplayOrder]
           ,[IsStockable]
           ,[StockQuantity]
           ,[DisplayStockQuantity]
           ,[DisplayStockAvailability]
           ,[MinStockQuantity]
           ,[NotifyAdminForQuantityBelow]
           ,[OrderMinQuantity]
           ,[OrderMaxQuantity]
           ,[ApprovedRatingSum]
           ,[NotApprovedRatingSum]
           ,[ApprovedTotalReviews]
           ,[NotApprovedTotalReviews]
           ,[RestrictSale]  
		   FROM [dbo].[Product]	TABLOCKX		   
		   
		   go

SET IDENTITY_INSERT [dbo].[Tmp_Product] OFF
go

DROP TABLE [dbo].[Product] 
GO

Exec sp_rename 'Tmp_Product', 'Product'
go


ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ParentID]  DEFAULT ((0)) FOR [ParentID]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsDownloaded]  DEFAULT ((0)) FOR [IsDownload]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_UnlimitedDownload]  DEFAULT ((0)) FOR [UnlimitedDownload]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsFreeShipping]  DEFAULT ((0)) FOR [IsFreeShipping]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_HasUserAgreement]  DEFAULT ((0)) FOR [HasUserAgreement]
GO

ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_DisableBuyButton]  DEFAULT ((0)) FOR [DisableBuyButton]
GO



ALTER TABLE [dbo].[Order] DROP CONSTRAINT [DF_Order_paypal_paid]
GO

DROP TABLE [dbo].[Order]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tmp_Order](
	[Id] [bigint] NOT NULL,
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
	[paypal_paid] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


SET IDENTITY_INSERT [dbo].[Tmp_Order] ON 

go

IF EXISTS(SELECT * FROM [dbo].[Order])
INSERT INTO [dbo].[Tmp_Order] (
       [Id]
      ,[OrderNumber]
      ,[StoreId]
      ,[UserId]
      ,[BillingAddressId]
      ,[ShippingAddressId]
      ,[IsPickUpInStore]
      ,[OrderStatusId]
      ,[ShippingStatusId]
      ,[PaymentStatusId]
      ,[PaymentMethodType]
      ,[CustomerCurrencyCode]
      ,[CurrencyRate]
      ,[c_CouponCode]
      ,[c_CouponAmount]
      ,[c_DeliveryDate]
      ,[TaxRates]
      ,[OrderTaxAmount]
      ,[OrderSubtotalInclTax]
      ,[OrderSubtotalExclTax]
      ,[OrderSubTotalDiscountInclTax]
      ,[OrderSubTotalDiscountExclTax]
      ,[OrderShippingInclTax]
      ,[OrderShippingExclTax]
      ,[OrderDiscountAmount]
      ,[OrderTotalAmount]
      ,[RefundedAmount]
      ,[RewardPointsWereAdded]
      ,[c_CustomerIP]
      ,[AllowStoringCreditCardNumber]
      ,[CardType]
      ,[CardName]
      ,[CardNumber]
      ,[MaskedCreditCardNumber]
      ,[CardCvv2]
      ,[CardExpirationMonth]
      ,[CardExpirationYear]
      ,[AuthorizationTransactionId]
      ,[AuthorizationTransactionCode]
      ,[AuthorizationTransactionResult]
      ,[PaidDateUtc]
      ,[IsShippingWaived]
      ,[ShippingMethod]
      ,[c_AirwayBillNumber]
      ,[c_CustomerConfirmed]
      ,[c_OrderNote]
      ,[IsDeleted]
      ,[CreatedOnUtc]
      ,[StockMode]
      ,[CurrentDepartmentId]
      ,[IsOnHold]
      ,[OnHoldReason]
      ,[UrgentDelivery]
      ,[paypal_paid])   	          
SELECT [Id]
      ,[OrderNumber]
      ,[StoreId]
      ,[UserId]
      ,[BillingAddressId]
      ,[ShippingAddressId]
      ,[IsPickUpInStore]
      ,[OrderStatusId]
      ,[ShippingStatusId]
      ,[PaymentStatusId]
      ,[PaymentMethodType]
      ,[CustomerCurrencyCode]
      ,[CurrencyRate]
      ,[c_CouponCode]
      ,[c_CouponAmount]
      ,[c_DeliveryDate]
      ,[TaxRates]
      ,[OrderTaxAmount]
      ,[OrderSubtotalInclTax]
      ,[OrderSubtotalExclTax]
      ,[OrderSubTotalDiscountInclTax]
      ,[OrderSubTotalDiscountExclTax]
      ,[OrderShippingInclTax]
      ,[OrderShippingExclTax]
      ,[OrderDiscountAmount]
      ,[OrderTotalAmount]
      ,[RefundedAmount]
      ,[RewardPointsWereAdded]
      ,[c_CustomerIP]
      ,[AllowStoringCreditCardNumber]
      ,[CardType]
      ,[CardName]
      ,[CardNumber]
      ,[MaskedCreditCardNumber]
      ,[CardCvv2]
      ,[CardExpirationMonth]
      ,[CardExpirationYear]
      ,[AuthorizationTransactionId]
      ,[AuthorizationTransactionCode]
      ,[AuthorizationTransactionResult]
      ,[PaidDateUtc]
      ,[IsShippingWaived]
      ,[ShippingMethod]
      ,[c_AirwayBillNumber]
      ,[c_CustomerConfirmed]
      ,[c_OrderNote]
      ,[IsDeleted]
      ,[CreatedOnUtc]
      ,[StockMode]
      ,[CurrentDepartmentId]
      ,[IsOnHold]
      ,[OnHoldReason]
      ,[UrgentDelivery]
      ,[paypal_paid]
  FROM [dbo].[Order]	TABLOCKX 

go

SET IDENTITY_INSERT [dbo].[Tmp_Order] OFF
go

DROP TABLE [dbo].[Order]
GO

Exec sp_rename 'Tmp_Order', 'Order'
go

ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_paypal_paid]  DEFAULT ((0)) FOR [paypal_paid]
GO

ALTER TABLE [dbo].[DiscountUsageHistory]  WITH CHECK ADD  CONSTRAINT [DiscountUsageHistory_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[DiscountUsageHistory] CHECK CONSTRAINT [DiscountUsageHistory_Order]
GO

ALTER TABLE [dbo].[RewardPointsHistory]  WITH CHECK ADD  CONSTRAINT [RewardPointsHistory_UsedWithOrder] FOREIGN KEY([UsedWithOrder_Id])
REFERENCES [dbo].[Order] ([Id])
GO

ALTER TABLE [dbo].[RewardPointsHistory] CHECK CONSTRAINT [RewardPointsHistory_UsedWithOrder]
GO

ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [Shipment_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [Shipment_Order]
GO


DROP TABLE [dbo].[Order_Details]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tmp_Order_Details](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
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
	[VendorID] [nvarchar](128) NULL
) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[Tmp_Order_Details] ON 
go

IF EXISTS(SELECT * FROM [dbo].[Order_Details])
INSERT INTO [dbo].[Tmp_Order_Details] (
       [Id]
      ,[OrderId]
      ,[ProductId]
      ,[SupplierId]
      ,[Quantity]
      ,[UnitPriceInclTax]
      ,[UnitPriceExclTax]
      ,[c_SpecialPriceInclTax]
      ,[c_SpecialPriceExclTax]
      ,[DiscountAmountInclTax]
      ,[DiscountAmountExclTax]
      ,[OriginalProductCost]
      ,[AttributeDescription]
      ,[DownloadCount]
      ,[IsDownloadActivated]
      ,[LicenseDownloadId]
      ,[ItemWeight]
      ,[c_IMEINumber]
      ,[c_Color]
      ,[c_IsDeal]
      ,[c_IsLPOGenerated]
      ,[c_WarrantyDuration]
      ,[c_WarrantyAmount]
      ,[ItemDeleted]
      ,[Page_Type]
      ,[VendorID]
)           
SELECT [Id]
      ,[OrderId]
      ,[ProductId]
      ,[SupplierId]
      ,[Quantity]
      ,[UnitPriceInclTax]
      ,[UnitPriceExclTax]
      ,[c_SpecialPriceInclTax]
      ,[c_SpecialPriceExclTax]
      ,[DiscountAmountInclTax]
      ,[DiscountAmountExclTax]
      ,[OriginalProductCost]
      ,[AttributeDescription]
      ,[DownloadCount]
      ,[IsDownloadActivated]
      ,[LicenseDownloadId]
      ,[ItemWeight]
      ,[c_IMEINumber]
      ,[c_Color]
      ,[c_IsDeal]
      ,[c_IsLPOGenerated]
      ,[c_WarrantyDuration]
      ,[c_WarrantyAmount]
      ,[ItemDeleted]
      ,[Page_Type]
      ,[VendorID]
  FROM [dbo].[Order_Details]	TABLOCKX 

go

SET IDENTITY_INSERT [dbo].[Tmp_Order_Details] OFF
go

DROP TABLE [dbo].[Order_Details]
GO

Exec sp_rename '[Tmp_Order_Details]', '[Order_Details]'
go

DROP TABLE [dbo].[Product_Categories_Mapping]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tmp_Product_Categories_Mapping](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Tmp_Product_Categories_Mapping] ON 
go

IF EXISTS(SELECT * FROM [dbo].[Product_Categories_Mapping])
INSERT INTO [dbo].[Tmp_Product_Categories_Mapping] (
       [ID]
      ,[ProductID]
      ,[CategoryID]
      ,[SortOrder]
)           
SELECT [ID]
      ,[ProductID]
      ,[CategoryID]
      ,[SortOrder]
  FROM [dbo].[Product_Categories_Mapping]	TABLOCKX 

go

SET IDENTITY_INSERT [dbo].[Tmp_Product_Categories_Mapping] OFF
go

DROP TABLE [dbo].[Product_Categories_Mapping]
GO

Exec sp_rename '[Tmp_Product_Categories_Mapping]', '[Product_Categories_Mapping]'
go


