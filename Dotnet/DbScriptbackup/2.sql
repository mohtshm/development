CREATE TABLE [dbo].[Tmp_Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TwoLetterIsoCode] [nvarchar](2) NULL,
	[ThreeLetterIsoCode] [nvarchar](3) NULL,
	[NumericIsoCode] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Country] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Country])
INSERT INTO [dbo].[Tmp_Country] (
       Id, Name, TwoLetterIsoCode, ThreeLetterIsoCode, NumericIsoCode, IsActive, DisplayOrder
)           
SELECT Id, Name, TwoLetterIsoCode, ThreeLetterIsoCode, NumericIsoCode, IsActive, DisplayOrder
  FROM [dbo].[Country]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Country] OFF
GO
DROP TABLE [dbo].[Country]
GO
Exec sp_rename 'Tmp_Country', 'Country'
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StateProvince]  WITH CHECK ADD  CONSTRAINT [StateProvince_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StateProvince] CHECK CONSTRAINT [StateProvince_Country]
GO
ALTER TABLE [dbo].[ShippingMethodRestrictions]  WITH CHECK ADD  CONSTRAINT [ShippingMethod_RestrictedCountries_Target] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Country] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShippingMethodRestrictions] CHECK CONSTRAINT [ShippingMethod_RestrictedCountries_Target]
GO
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
GO
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
GO
SET IDENTITY_INSERT dbo.Tmp_brand OFF
GO
DROP TABLE [dbo].[Brand]
GO
Exec sp_rename 'Tmp_brand', 'brand'
GO
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
	[IsHomePageCategory] [bit] NOT NULL,
	[IsPopular] [bit] NOT NULL,
	[PopularSortOrder] [int] NOT NULL,	
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_Category ON 
GO
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
		   ,[IsHomePageCategory]
		   ,[IsPopular]
		   ,[PopularSortOrder]	
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
           ,[IsHomePageCategory]
		   ,[IsPopular]
		   ,[PopularSortOrder]	
           ,[IsDeleted]
           ,[CreatedOn]
           ,[LastModified] FROM dbo.Category	TABLOCKX
GO
SET IDENTITY_INSERT dbo.Tmp_Category OFF
GO
DROP TABLE [dbo].[Category]
GO
Exec sp_rename 'Tmp_Category', 'Category'
GO
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
CREATE TABLE [dbo].[Tmp_Category_Brand_Mapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_ID] [bigint] NULL,
	[Brand_ID] [bigint] NULL,
	[SortOrder] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Category_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Category_Brand_Mapping] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Category_Brand_Mapping])
INSERT INTO [dbo].[Tmp_Category_Brand_Mapping](ID, Category_ID, Brand_ID, SortOrder, CreatedOn)
select ID, Category_ID, Brand_ID, SortOrder, CreatedOn  FROM [dbo].[Category_Brand_Mapping]	TABLOCKX
GO
SET IDENTITY_INSERT [dbo].[Tmp_Category_Brand_Mapping] OFF
GO
DROP TABLE [dbo].[Category_Brand_Mapping]
GO
Exec sp_rename 'Tmp_Category_Brand_Mapping', 'Category_Brand_Mapping'
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Category_Brand_Mapping] ADD  CONSTRAINT [DF_Category_Brand_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
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
GO
SET IDENTITY_INSERT dbo.Tmp_Supplier ON 
GO
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
		   GO
SET IDENTITY_INSERT [dbo].[Tmp_Supplier] OFF
GO
DROP TABLE [dbo].[Supplier]
GO
Exec sp_rename 'Tmp_Supplier', 'Supplier'
GO
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
	[NewArrivalSortOrder]  int Default(0) NOT NULL 
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Product] ON 
GO
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
		   GO
SET IDENTITY_INSERT [dbo].[Tmp_Product] OFF
GO
DROP TABLE [dbo].[Product] 
GO
Exec sp_rename 'Tmp_Product', 'Product'
GO
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
GO
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
GO
SET IDENTITY_INSERT [dbo].[Tmp_Product_Categories_Mapping] OFF
GO
DROP TABLE [dbo].[Product_Categories_Mapping]
GO
Exec sp_rename 'Tmp_Product_Categories_Mapping', 'Product_Categories_Mapping'
GO
CREATE TABLE [dbo].[Tmp_Product_Supplier_Mapping](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[SupplierID] [bigint] NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_Product_Supplier_Mapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
GO
SET IDENTITY_INSERT [dbo].[Tmp_Product_Supplier_Mapping] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Product_Supplier_Mapping])
INSERT INTO [dbo].[Tmp_Product_Supplier_Mapping]
           ( [ID]
      ,[ProductID]
      ,[SupplierID]
      ,[IsDefault])
		   select  [ID]
      ,[ProductID]
      ,[SupplierID]
      ,[IsDefault]  FROM [dbo].[Product_Supplier_Mapping]	TABLOCKX
GO
SET IDENTITY_INSERT [dbo].[Tmp_Product_Supplier_Mapping] OFF
GO
DROP TABLE [dbo].[Product_Supplier_Mapping]
GO
Exec sp_rename 'Tmp_Product_Supplier_Mapping', 'Product_Supplier_Mapping'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tmp_Product_Images_Mapping](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Name] [varchar](128) NULL,
	[Url] [varchar](128) NULL,
	[ThumbnailUrl] [varchar](128) NULL,
	[SortOrder] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Product_Images_Mapping] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Product_Images_Mapping])
INSERT INTO [dbo].[Tmp_Product_Images_Mapping] (ID, ProductID, Name, Url, ThumbnailUrl, SortOrder, IsDeleted, CreatedOn)           
SELECT ID, ProductID, Name, Url, ThumbnailUrl, SortOrder, IsDeleted, CreatedOn  FROM [dbo].[Product_Images_Mapping] TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Product_Images_Mapping] OFF
GO
DROP TABLE [dbo].[Product_Images_Mapping]
GO
Exec sp_rename 'Tmp_Product_Images_Mapping', 'Product_Images_Mapping'
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Product_Images_Mapping] ADD  CONSTRAINT [DF_ProductImages_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product_Images_Mapping] ADD  CONSTRAINT [DF_ProductImages_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
CREATE TABLE [dbo].[Tmp_Quicklink](
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
	[IsShowOnTopMenu] [bit] NULL,
 CONSTRAINT [PK_Quicklink] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Quicklink] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Quicklink])
INSERT INTO [dbo].[Tmp_Quicklink] (
      ID, Quicklink_Name, Quicklink_URL, QuicklinkType, Ordering, [Status], HasBanner, BannerWidht, BannerHeight, IsSystemTypeBanner, CreatedOn, LastModified, IsShowOnTopMenu
)           
SELECT ID, Quicklink_Name, Quicklink_URL, QuicklinkType, Ordering, [Status], HasBanner, BannerWidht, BannerHeight, IsSystemTypeBanner, CreatedOn, LastModified, IsShowOnTopMenu
  FROM [dbo].[Quicklink]  TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Quicklink] OFF
GO
DROP TABLE [dbo].[Quicklink]
GO
Exec sp_rename 'Tmp_Quicklink', 'Quicklink'
GO
ALTER TABLE [dbo].[Quicklink] ADD  CONSTRAINT [DF_Quicklink_IsShowOnTopMenu]  DEFAULT ((0)) FOR [IsShowOnTopMenu]
GO
CREATE TABLE [dbo].[Tmp_Banner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Banner] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Banner])
INSERT INTO [dbo].[Tmp_Banner] (
       ID, BannerTitle, BannerType, BannerLink, BannerMap, MapTag, ImageUrl, ThumbImageUrl,[DisplayType], SortOrder, CreatedOn, LastModified, IsActive
)           
SELECT ID, BannerTitle, BannerType, BannerLink, BannerMap, MapTag, ImageUrl, ThumbImageUrl,[DisplayType], SortOrder, CreatedOn, LastModified, IsActive
  FROM [dbo].[Banner]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Banner] OFF
GO
DROP TABLE [dbo].[Banner]
GO
Exec sp_rename 'Tmp_Banner', 'Banner'
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Tmp_Order](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
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
GO
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
GO
SET IDENTITY_INSERT [dbo].[Tmp_Order] OFF
GO
DROP TABLE [dbo].[Order]
GO
Exec sp_rename 'Tmp_Order', 'Order'
GO
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
	[c_IMEINumber] [nvarchar](1024) NULL,
	[c_Color] [nvarchar](128) NULL,
	[c_IsDeal] [bit] NULL,
	[c_IsLPOGenerated] [bit] NULL,
	[c_WarrantyDuration] [int] NULL,
	[c_WarrantyAmount] [decimal](18, 0) NULL,
	[ItemDeleted] [bit] NULL,
	[Page_Type] [nvarchar](256) NULL,
	[VendorID] [nvarchar](128) NULL,
	[is_return] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Order_Details] ON 
GO
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
	  ,[is_return]
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
	  ,[is_return]
  FROM [dbo].[Order_Details]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Order_Details] OFF
GO
DROP TABLE [dbo].[Order_Details]
GO
Exec sp_rename 'Tmp_Order_Details', 'Order_Details'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tmp_ProductReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[VendorID] [varchar](128) NULL,
	[ProductId] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[ReviewText] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[HelpfulYesTotal] [int] NOT NULL,
	[HelpfulNoTotal] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
 CONSTRAINT [PK__ProductR__3214EC070E82D8CB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_ProductReview] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[ProductReview])
INSERT INTO [dbo].[Tmp_ProductReview] (
       Id, CustomerId, VendorID, ProductId, IsApproved, Title, ReviewText, Rating, HelpfulYesTotal, HelpfulNoTotal, CreatedOnUtc
)           
SELECT Id, CustomerId, VendorID, ProductId, IsApproved, Title, ReviewText, Rating, HelpfulYesTotal, HelpfulNoTotal, CreatedOnUtc
  FROM [dbo].[ProductReview]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_ProductReview] OFF
GO
DROP TABLE [dbo].[ProductReview]
GO
Exec sp_rename 'Tmp_ProductReview', 'ProductReview'
GO
CREATE TABLE [dbo].[Tmp_Coupons](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CouponCode] [varchar](8) NOT NULL,
	[CouponType] [varchar](128) NOT NULL,
	[CouponUsed] [bit] NULL,
	[UsedByUserID] [nvarchar](128) NULL,
	[ExpiryDate] [date] NOT NULL,
	[StartingDate] [date] NOT NULL,
	[DiscountAmount] [decimal](20, 2) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[DiscountType] [varchar](50) NULL,
	[IsForMultipleUse] [bit] NOT NULL,
 CONSTRAINT [PK_Coupons_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
SET IDENTITY_INSERT [dbo].[Tmp_Coupons] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Coupons])
INSERT INTO [dbo].[Tmp_Coupons] (
       ID, CouponCode, CouponType, CouponUsed, UsedByUserID, ExpiryDate, StartingDate, DiscountAmount, [Description], DiscountType, IsForMultipleUse
)           
SELECT ID, CouponCode, CouponType, CouponUsed, UsedByUserID, ExpiryDate, StartingDate, DiscountAmount, [Description], DiscountType, IsForMultipleUse
  FROM [dbo].[Coupons]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Coupons] OFF
GO
DROP TABLE [dbo].[Coupons]
GO
Exec sp_rename 'Tmp_Coupons', 'Coupons'
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF__Coupons__ExpiryD__1229A90A]  DEFAULT (getdate()) FOR [ExpiryDate]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF__Coupons__Startin__131DCD43]  DEFAULT (getdate()) FOR [StartingDate]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF__Coupons__Discoun__1411F17C]  DEFAULT ((0.00)) FOR [DiscountAmount]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tmp_Areas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
SET IDENTITY_INSERT [dbo].[Tmp_Areas] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Areas])
INSERT INTO [dbo].[Tmp_Areas] (
       Id, CityId, Name
)           
SELECT Id, CityId, Name
  FROM [dbo].[Areas]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Areas] OFF
GO
DROP TABLE [dbo].[Areas]
GO
Exec sp_rename 'Tmp_Areas', 'Areas'
GO
CREATE TABLE [dbo].[Tmp_Placement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Placement] [varchar](50) NULL,
	[type] nvarchar(50),
	[PlacementUrl] [varchar](400) NULL,
	[PageTitle] [nvarchar](50) NULL,
	[PageLayout] [nvarchar](50) NULL,
	[PageKeywords] [nvarchar](200) NULL,
	[PageDesc] [nvarchar](max) NULL,
	[BannerImage] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[SortOrder] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Placement] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Placement])
INSERT INTO [dbo].[Tmp_Placement] (
       ID, Placement, [Type], PlacementUrl, PageTitle, PageLayout, PageKeywords, PageDesc, BannerImage, isActive, SortOrder
)           
SELECT ID, Placement, [Type], PlacementUrl, PageTitle, PageLayout, PageKeywords, PageDesc, BannerImage, isActive, SortOrder
  FROM [dbo].[Placement]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Placement] OFF
GO
DROP TABLE [dbo].[Placement]
GO
Exec sp_rename 'Tmp_Placement', 'Placement'
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Placement] ADD  CONSTRAINT [DF_Placement_isActive]  DEFAULT ((1)) FOR [isActive]
GO
CREATE TABLE [dbo].[Tmp_ProductPlacement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NULL,
	[PlacementID] [bigint] NULL,
	[SortOrder] [bigint] NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
	[AllowedQuantity] [int] NULL,
	[SoldQuantity] [int] NULL,
	[CreationDate] [datetime] NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_ProductPlacement] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[ProductPlacement])
INSERT INTO [dbo].[Tmp_ProductPlacement] (
       ID, ProductID, PlacementID, SortOrder, DateFrom, DateTo, AllowedQuantity, SoldQuantity, CreationDate, isActive
)           
SELECT ID, ProductID, PlacementID, SortOrder, DateFrom, DateTo, AllowedQuantity, SoldQuantity, CreationDate, isActive
  FROM [dbo].[ProductPlacement]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_ProductPlacement] OFF
GO
DROP TABLE [dbo].[ProductPlacement]
GO
Exec sp_rename 'Tmp_ProductPlacement', 'ProductPlacement'
GO
ALTER TABLE [dbo].[ProductPlacement] ADD  CONSTRAINT [DF_ProductPlacement_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ProductPlacement] ADD  CONSTRAINT [DF_ProductPlacement_isActive]  DEFAULT ((1)) FOR [isActive]
GO
CREATE TABLE [dbo].[Tmp_Warehouse_Zone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseID] [int] NULL,
	[ZoneName] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Warehouse_Zone] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Warehouse_Zone])
INSERT INTO [dbo].[Tmp_Warehouse_Zone] (
       ID, WarehouseID, ZoneName
)           
SELECT ID, WarehouseID, ZoneName
  FROM [dbo].[Warehouse_Zone]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Warehouse_Zone] OFF
GO
DROP TABLE [dbo].[Warehouse_Zone]
GO
Exec sp_rename 'Tmp_Warehouse_Zone', 'Warehouse_Zone'
GO
CREATE TABLE [dbo].[Tmp_Warehouse_Shelf](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseID] [int] NOT NULL,
	[ZoneID] [int] NULL,
	[ShelfCode] [varchar](20) NULL,
	[ShelfType] [varchar](30) NULL,
	[ShelfSize] [varchar](20) NULL,
	[Section] [varchar](30) NULL,
 CONSTRAINT [PK_Shelf] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tmp_Warehouse_Shelf] ON 
GO
IF EXISTS(SELECT * FROM [dbo].[Warehouse_Shelf])
INSERT INTO [dbo].[Tmp_Warehouse_Shelf] (
       ID, WarehouseID, ZoneID, ShelfCode, ShelfType, ShelfSize, Section
)           
SELECT ID, WarehouseID, ZoneID, ShelfCode, ShelfType, ShelfSize, Section
  FROM [dbo].[Warehouse_Shelf]	TABLOCKX 
GO
SET IDENTITY_INSERT [dbo].[Tmp_Warehouse_Shelf] OFF
GO
DROP TABLE [dbo].[Warehouse_Shelf]
GO
Exec sp_rename 'Tmp_Warehouse_Shelf', 'Warehouse_Shelf'
GO
