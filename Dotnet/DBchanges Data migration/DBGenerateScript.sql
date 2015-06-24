SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](128) NULL,
	[LastName] [nvarchar](32) NULL,
	[Gender] [nvarchar](10) NULL,
	[Landline] [nvarchar](50) NULL,
	[DateOfBith] [datetime] NULL,
	[ParentID] [nvarchar](60) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](60) NULL,
	[RoleLevelID] [nvarchar](60) NULL,
	[ImageUrl] [nvarchar](100) NULL,
	[ThumbnailUrl] [nvarchar](100) NULL,
	[BarcodeNumber] [nvarchar](50) NULL,
	[UserIP] [nvarchar](32) NULL,
	[CreatedOn] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[DeptID] [int] NULL,
	[Store_Credits] [decimal](18, 0) NULL,
	[IsCustomer] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditDataItemPersistent]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditDataItemPersistent](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[ModifiedOn] [datetime] NULL,
	[OperationType] [nvarchar](100) NULL,
	[Description] [nvarchar](2048) NULL,
	[AuditedObject] [uniqueidentifier] NULL,
	[OldObject] [uniqueidentifier] NULL,
	[NewObject] [uniqueidentifier] NULL,
	[OldValue] [nvarchar](1024) NULL,
	[NewValue] [nvarchar](1024) NULL,
	[PropertyName] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_AuditDataItemPersistent] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditedObjectWeakReference]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditedObjectWeakReference](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[GuidId] [uniqueidentifier] NULL,
	[IntId] [int] NULL,
	[DisplayName] [nvarchar](250) NULL,
 CONSTRAINT [PK_AuditedObjectWeakReference] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogs](
	[AuditLogID] [uniqueidentifier] NOT NULL,
	[EntityTypeAudited] [nvarchar](max) NULL,
	[DateTimeAuditRecorded] [datetime] NOT NULL,
	[User] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](max) NULL,
	[ActionName] [nvarchar](max) NULL,
	[AuditedProperties] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AuditLogs] PRIMARY KEY CLUSTERED 
(
	[AuditLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Audits]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Audits](
	[AuditID] [uniqueidentifier] NOT NULL,
	[SessionID] [varchar](50) NULL,
	[IPAddress] [varchar](20) NULL,
	[UserName] [varchar](50) NULL,
	[URLAccessed] [varchar](150) NULL,
	[TimeAccessed] [datetime] NULL,
	[Data] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BackInStockSubscription]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackInStockSubscription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Banner]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banner](
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
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
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
/****** Object:  Table [dbo].[Category_Brand_Mapping]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_Brand_Mapping](
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
/****** Object:  Table [dbo].[CategoryBrandProduct_Mapping]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryBrandProduct_Mapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Categroy_Brand_ID] [int] NULL,
	[Product_ID] [bigint] NULL,
	[SortOrder] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_CategoryBrandProduct_Mapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckoutAttribute]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckoutAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[TextPrompt] [nvarchar](max) NULL,
	[IsRequired] [bit] NOT NULL,
	[ShippableProductRequired] [bit] NOT NULL,
	[IsTaxExempt] [bit] NOT NULL,
	[TaxCategoryId] [int] NOT NULL,
	[AttributeControlTypeId] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[LimitedToStores] [bit] NOT NULL,
	[ValidationMinLength] [int] NULL,
	[ValidationMaxLength] [int] NULL,
	[ValidationFileAllowedExtensions] [nvarchar](max) NULL,
	[ValidationFileMaximumSize] [int] NULL,
	[DefaultValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckoutAttributeValue]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckoutAttributeValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CheckoutAttributeId] [int] NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[ColorSquaresRgb] [nvarchar](100) NULL,
	[PriceAdjustment] [decimal](18, 4) NOT NULL,
	[WeightAdjustment] [decimal](18, 4) NOT NULL,
	[IsPreSelected] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComplaintAgentTracking]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintAgentTracking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComplainId] [bigint] NULL,
	[AgentId] [nvarchar](128) NULL,
	[ComplainStatus] [nvarchar](100) NULL,
	[ComplainStatusId] [int] NULL,
	[AssignDate] [datetime] NULL,
 CONSTRAINT [PK_ComplaintAgentTracking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComplaintTicket]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintTicket](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TicketNo] [nvarchar](40) NULL,
	[TicketTypeId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[AgentId] [nvarchar](128) NULL,
	[DateOpened] [datetime] NULL,
	[ComplaintStatus] [int] NULL,
	[IsAssignAgent] [bit] NULL,
	[DateClosed] [datetime] NULL,
	[TicketTags] [nvarchar](200) NULL,
 CONSTRAINT [PK_ComplaintTicket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComplaintTicket_Details]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintTicket_Details](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ComplainId] [bigint] NOT NULL,
	[ComplainDesc] [nvarchar](max) NULL,
	[ReplyBy] [nvarchar](128) NULL,
	[ReplyDate] [datetime] NULL,
 CONSTRAINT [PK_ComplaintTicket_Details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
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
/****** Object:  Table [dbo].[Coupons]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupons](
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

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coupons_Details]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupons_Details](
	[CouponID] [bigint] IDENTITY(1,1) NOT NULL,
	[CouponNo] [varchar](200) NOT NULL,
	[DateUsed] [date] NOT NULL,
	[Status] [bit] NOT NULL,
	[TimeStamp] [time](7) NOT NULL,
	[UsedStatus] [bit] NOT NULL,
	[DateSend] [date] NOT NULL,
	[CustomerID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Coupons_Details_CouponNo] PRIMARY KEY CLUSTERED 
(
	[CouponNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CrossSellProduct]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrossSellProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId1] [bigint] NOT NULL,
	[ProductId2] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currency]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CurrencyCode] [nvarchar](5) NOT NULL,
	[Rate] [decimal](18, 4) NOT NULL,
	[DisplayLocale] [nvarchar](50) NULL,
	[CustomFormatting] [nvarchar](50) NULL,
	[LimitedToStores] [bit] NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerAttribute]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[AttributeControlTypeId] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerAttributeValue]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAttributeValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerAttributeId] [int] NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[IsPreSelected] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Deal]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Deal](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VendorID] [nvarchar](128) NOT NULL,
	[Title] [varchar](128) NOT NULL,
	[Price] [decimal](18, 4) NULL,
	[ImageUrl] [varchar](128) NULL,
	[ThumbnailUrl] [varchar](128) NULL,
	[SalesBannerUrl] [varchar](128) NULL,
	[SalesBannerDurationHrs] [int] NULL,
	[ShortDescription] [varchar](512) NULL,
	[LongDescription] [varchar](1024) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[Quantity] [int] NOT NULL,
	[QuantitySold] [int] NULL,
	[SortOrder] [int] NULL,
	[MetaUrl] [varchar](128) NULL,
	[MetaTitle] [varchar](128) NULL,
	[MetaKeywords] [varchar](128) NULL,
	[MetaDescription] [varchar](128) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Deal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Deal_Details]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deal_Details](
	[DealID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[IsActive] [bit] NULL,
	[SortOrder] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[LastModified] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeliveryDate]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryDate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] NOT NULL,
	[DepartmentName] [nvarchar](100) NULL,
	[DepartmentDesc] [nvarchar](max) NULL,
	[VendorId] [nvarchar](128) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DiscountTypeId] [int] NOT NULL,
	[UsePercentage] [bit] NOT NULL,
	[DiscountPercentage] [decimal](18, 4) NOT NULL,
	[DiscountAmount] [decimal](18, 4) NOT NULL,
	[StartDateUtc] [datetime] NULL,
	[EndDateUtc] [datetime] NULL,
	[RequiresCouponCode] [bit] NOT NULL,
	[CouponCode] [nvarchar](100) NULL,
	[DiscountLimitationId] [int] NOT NULL,
	[LimitationTimes] [int] NOT NULL,
 CONSTRAINT [PK__Discount__3214EC07571DF1D5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount_AppliedToCategories]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_AppliedToCategories](
	[Discount_Id] [int] NOT NULL,
	[Category_Id] [bigint] NOT NULL,
 CONSTRAINT [PK__Discount__9AC84AD202BCB9B7] PRIMARY KEY CLUSTERED 
(
	[Discount_Id] ASC,
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount_AppliedToProducts]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_AppliedToProducts](
	[Discount_Id] [int] NOT NULL,
	[Product_Id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Discount_Id] ASC,
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountRequirement]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountRequirement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiscountId] [int] NOT NULL,
	[DiscountRequirementRuleSystemName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountUsageHistory]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountUsageHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiscountId] [int] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DispatchRiders]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DispatchRiders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[ContactNumber] [nvarchar](100) NULL,
	[CreatedOn] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_DispatchRiders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Download]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Download](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DownloadGuid] [uniqueidentifier] NOT NULL,
	[UseDownloadUrl] [bit] NOT NULL,
	[DownloadUrl] [nvarchar](max) NULL,
	[DownloadBinary] [varbinary](max) NULL,
	[ContentType] [nvarchar](max) NULL,
	[Filename] [nvarchar](max) NULL,
	[Extension] [nvarchar](max) NULL,
	[IsNew] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailAccount]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[DisplayName] [nvarchar](255) NULL,
	[Host] [nvarchar](255) NOT NULL,
	[Port] [int] NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[EnableSsl] [bit] NOT NULL,
	[UseDefaultCredentials] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExternalAuthenticationRecord]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalAuthenticationRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[ExternalIdentifier] [nvarchar](max) NULL,
	[ExternalDisplayIdentifier] [nvarchar](max) NULL,
	[OAuthToken] [nvarchar](max) NULL,
	[OAuthAccessToken] [nvarchar](max) NULL,
	[ProviderSystemName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KpiDefinition]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiDefinition](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TargetObjectType] [nvarchar](100) NULL,
	[Changed] [datetime] NULL,
	[KpiInstance] [uniqueidentifier] NULL,
	[Name] [nvarchar](100) NULL,
	[Active] [bit] NULL,
	[Criteria] [nvarchar](max) NULL,
	[Expression] [nvarchar](max) NULL,
	[GreenZone] [float] NULL,
	[RedZone] [float] NULL,
	[Range] [nvarchar](100) NULL,
	[Compare] [bit] NULL,
	[RangeToCompare] [nvarchar](100) NULL,
	[MeasurementFrequency] [int] NULL,
	[MeasurementMode] [int] NULL,
	[Direction] [int] NULL,
	[ChangedOn] [datetime] NULL,
	[SuppressedSeries] [nvarchar](100) NULL,
	[EnableCustomizeRepresentation] [bit] NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_KpiDefinition] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KpiHistoryItem]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiHistoryItem](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[KpiInstance] [uniqueidentifier] NULL,
	[RangeStart] [datetime] NULL,
	[RangeEnd] [datetime] NULL,
	[Value] [float] NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_KpiHistoryItem] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KpiInstance]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiInstance](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ForceMeasurementDateTime] [datetime] NULL,
	[KpiDefinition] [uniqueidentifier] NULL,
	[Settings] [nvarchar](max) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_KpiInstance] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KpiScorecard]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiScorecard](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
 CONSTRAINT [PK_KpiScorecard] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KpiScorecardScorecards_KpiInstanceIndicators]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators](
	[Indicators] [uniqueidentifier] NULL,
	[Scorecards] [uniqueidentifier] NULL,
	[OID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_KpiScorecardScorecards_KpiInstanceIndicators] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LanguageCulture] [nvarchar](20) NOT NULL,
	[UniqueSeoCode] [nvarchar](2) NULL,
	[FlagImageFileName] [nvarchar](50) NULL,
	[Rtl] [bit] NOT NULL,
	[LimitedToStores] [bit] NOT NULL,
	[DefaultCurrencyId] [int] NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LPO]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LPO](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LPONumber] [nvarchar](50) NOT NULL,
	[SupplierID] [bigint] NULL,
	[CurrentDeptID] [int] NULL,
	[ShipToAddressID] [bigint] NULL,
	[RequesterID] [nvarchar](128) NULL,
	[BuyerID] [nvarchar](128) NULL,
	[Mode] [nvarchar](30) NULL,
	[IsApproved] [bit] NULL,
	[ApprovedDate] [datetime] NULL,
	[ShipByID] [int] NULL,
	[ShippingType] [varchar](50) NULL,
	[WaybillNo] [varchar](50) NULL,
	[LPODate] [datetime] NULL,
	[PromisedDate] [datetime] NULL,
	[Status] [int] NOT NULL,
	[ClosedDate] [datetime] NULL,
	[CancelledDate] [datetime] NULL,
	[LPONotes] [nvarchar](1024) NULL,
	[DiscountPercent] [decimal](18, 2) NULL,
	[CanMergeItems] [bit] NULL,
	[IsCashIssued] [bit] NULL,
	[SalesTaxID] [int] NULL,
	[TotalAmount] [decimal](18, 4) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsLPOGenForOrder] [bit] NULL,
	[CreatedBy] [nvarchar](128) NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LPO_Comments]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LPO_Comments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LPOID] [bigint] NOT NULL,
	[TimeStamp] [datetime] NULL,
	[UserID] [nvarchar](128) NULL,
	[Comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_LPO_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[LPOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LPO_Items]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LPO_Items](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LPOID] [bigint] NULL,
	[OrderId] [bigint] NULL,
	[ProductID] [bigint] NULL,
	[Quantity] [int] NULL,
	[CostPrice] [decimal](18, 4) NULL,
	[Amount] [decimal](18, 4) NULL,
	[LineItemDiscount] [decimal](18, 2) NOT NULL,
	[QuantityReceived] [int] NOT NULL,
	[LineItemNote] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsWarrantyGiven] [bit] NULL,
 CONSTRAINT [PK_PurchaseOrder_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LPO_Tracking]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LPO_Tracking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LPOId] [bigint] NULL,
	[DeptID] [int] NULL,
	[UserId] [nvarchar](128) NULL,
	[CreatedOn] [datetime2](7) NULL,
 CONSTRAINT [PK_LPO_Tracking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LuckyDeal]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LuckyDeal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](128) NULL,
	[ImageUrl] [varchar](128) NULL,
	[ThumbImageUrl] [varchar](128) NULL,
	[DealType] [nvarchar](128) NULL,
	[LuckyProductPrice] [decimal](18, 4) NULL,
	[OriginalPrice] [decimal](18, 4) NULL,
	[DealExpiryDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[SortOrder] [int] NULL,
	[WinnerName] [nvarchar](128) NULL,
	[Winner_ImageUrl] [varchar](128) NULL,
	[Winner_ThumbImageUrl] [varchar](128) NULL,
	[IsWinner] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_LuckyDeal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManagmentEmailAddresses]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagmentEmailAddresses](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[VendorId] [nvarchar](128) NULL,
	[Active] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](400) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaTitle] [nvarchar](400) NULL,
	[PictureId] [int] NOT NULL,
	[PageSize] [int] NOT NULL,
	[AllowCustomersToSelectPageSize] [bit] NOT NULL,
	[PageSizeOptions] [nvarchar](200) NULL,
	[PriceRanges] [nvarchar](400) NULL,
	[SubjectToAcl] [bit] NOT NULL,
	[LimitedToStores] [bit] NOT NULL,
	[Published] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NOT NULL,
 CONSTRAINT [PK__Manufact__3214EC0790CA5700] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ModuleInfo]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleInfo](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Version] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[AssemblyFileName] [nvarchar](100) NULL,
	[IsMain] [bit] NULL,
	[OptimisticLockField] [int] NULL,
 CONSTRAINT [PK_ModuleInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Short] [nvarchar](max) NOT NULL,
	[Full] [nvarchar](max) NOT NULL,
	[Published] [bit] NOT NULL,
	[StartDateUtc] [datetime] NULL,
	[EndDateUtc] [datetime] NULL,
	[AllowComments] [bit] NOT NULL,
	[CommentCount] [int] NOT NULL,
	[LimitedToStores] [bit] NOT NULL,
	[MetaKeywords] [nvarchar](400) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaTitle] [nvarchar](400) NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsComment]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentTitle] [nvarchar](max) NULL,
	[CommentText] [nvarchar](max) NULL,
	[NewsItemId] [int] NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsLetter]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsLetter](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Header] [nvarchar](max) NULL,
	[Contents] [nvarchar](max) NULL,
	[Footer] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_NewsLetter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsLetterSubscription]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsLetterSubscription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsLetterSubscriptionGuid] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
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
/****** Object:  Table [dbo].[Order_Details]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
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
/****** Object:  Table [dbo].[Order_LPO]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_LPO](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[LPOID] [bigint] NOT NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_order_lpos_tracking_id] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Sales_Log]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Sales_Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Previous_Dept] [int] NULL,
	[Next_Dept] [int] NULL,
	[Order_ID] [bigint] NOT NULL,
	[Product_ID] [bigint] NULL,
	[Product_Quantity] [int] NULL,
	[Previous_State] [int] NULL,
	[Next_State] [int] NULL,
	[TimeStamp] [datetime] NULL,
	[Other_Logs] [nvarchar](255) NULL,
	[Log_type] [nvarchar](10) NULL,
 CONSTRAINT [PK_Order_Sales_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_SLA]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order_SLA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[ForwardToDept] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[ForwardByUser] [varchar](128) NOT NULL,
 CONSTRAINT [PK_dss_orders_sla_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_Tracking]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Tracking](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[c_ProductID] [bigint] NOT NULL,
	[c_StatusMessage] [nvarchar](1024) NULL,
	[c_Comments] [nvarchar](140) NULL,
	[TrackingDate] [datetime] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Department] [int] NOT NULL,
	[DownloadId] [int] NULL,
	[IsDisplayToCustomer] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Order_Tracking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SystemName] [nvarchar](128) NOT NULL,
	[DisplayName] [nvarchar](512) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Permission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permissions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SystemName] [varchar](128) NOT NULL,
	[DisplayName] [nvarchar](512) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Picklist]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picklist](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PickStatus] [int] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Picklist_Picklist_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picklist_Orders]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picklist_Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PicklistId] [bigint] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[OrderNumber] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Picklist_Orders_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Placement]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Placement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Poll]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[SystemKeyword] [nvarchar](max) NULL,
	[Published] [bit] NOT NULL,
	[ShowOnHomePage] [bit] NOT NULL,
	[AllowGuestsToVote] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[StartDateUtc] [datetime] NULL,
	[EndDateUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PollAnswer]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollAnswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PollId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[NumberOfVotes] [int] NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK__PollAnsw__3214EC07746D8EBA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PollVotingRecord]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PollVotingRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PollAnswerId] [int] NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
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

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Categories_Mapping]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Categories_Mapping](
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
/****** Object:  Table [dbo].[Product_Images_Mapping]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Images_Mapping](
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Specification_Attribute_Mapping]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Specification_Attribute_Mapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[AttributeID] [int] NULL,
	[VendorID] [nvarchar](128) NULL,
	[Value] [nvarchar](max) NULL,
	[ShowOnProductPage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[SpecificationAttributeID] [int] NULL,
 CONSTRAINT [PK__Product___3214EC070863C51E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Supplier_Mapping]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Supplier_Mapping](
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
/****** Object:  Table [dbo].[Product_Vendor_Mapping]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Vendor_Mapping](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[VendorID] [nvarchar](128) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[SKU] [nvarchar](128) NULL,
	[WarrantyPolicy] [nvarchar](1024) NULL,
	[HandlingTime] [nvarchar](50) NULL,
	[Condition] [tinyint] NULL,
	[IsActive] [bit] NULL,
	[IsDownload] [bit] NULL,
	[UnlimitedDownload] [bit] NULL,
	[MaxDownloads] [bit] NULL,
	[AvailableStartDate] [datetime] NULL,
	[AvailableEndDate] [datetime] NULL,
	[IsShipEnable] [bit] NULL,
	[IsFreeShipping] [bit] NULL,
	[TaxID] [bigint] NULL,
	[DisableBuyButton] [bit] NULL,
	[CostPrice] [decimal](18, 4) NULL,
	[Price] [decimal](18, 4) NOT NULL,
	[SpecialPrice] [decimal](18, 4) NULL,
	[SpecialPriceStartDateTimeUtc] [datetime] NULL,
	[SpecialPriceEndDateTimeUtc] [datetime] NULL,
	[ShowOnHomePage] [bit] NULL,
	[AllowCustomerReviews] [bit] NULL,
	[DisableWishlistButton] [bit] NULL,
	[OfferNote] [nvarchar](1024) NULL,
	[IsPickupAvailable] [bit] NULL,
	[IsDeliveryAvailable] [bit] NULL,
	[DeliveryDate] [varchar](50) NULL,
	[DisplayOrder] [int] NULL,
	[IsStockable] [bit] NULL,
	[StockQuantity] [int] NULL,
	[DisplayStockQuantity] [bit] NULL,
	[DisplayStockAvailability] [bit] NULL,
	[MinStockQuantity] [int] NULL,
	[OrderMinQuantity] [int] NULL,
	[OrderMaxQuantity] [int] NULL,
	[ApprovedTotalReviews] [int] NULL,
	[RestrictSale] [int] NULL,
	[Status] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_Product_Vendor_Mapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [bigint] NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Type] [nvarchar](20) NULL,
	[ValuesList] [nvarchar](max) NULL,
	[LimitInput] [bit] NULL,
 CONSTRAINT [PK__ProductA__3214EC07863CC354] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductPlacement]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPlacement](
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
/****** Object:  Table [dbo].[ProductReview]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductReview](
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductTag]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchase](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LPOID] [bigint] NULL,
	[WareHouseID] [int] NULL,
	[SupplierID] [bigint] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[Note] [nvarchar](1024) NULL,
	[TotalAmount] [decimal](18, 4) NOT NULL,
	[IsDeleted] [bit] NULL,
	[Status] [varchar](20) NULL,
	[CreatedOn] [datetime] NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_purchases_id] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Purchase_Items]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Items](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PurchaseID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 4) NOT NULL,
	[TaxAmount] [decimal](18, 4) NULL,
	[GrossAmount] [decimal](18, 4) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_purchase_items_id] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quicklink]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quicklink](
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
/****** Object:  Table [dbo].[RelatedProduct]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelatedProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId1] [int] NOT NULL,
	[ProductId2] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReturnRequest]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [nvarchar](128) NOT NULL,
	[OrderItemId] [int] NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ReasonForReturn] [nvarchar](max) NOT NULL,
	[RequestedAction] [nvarchar](max) NOT NULL,
	[CustomerComments] [nvarchar](max) NULL,
	[StaffNotes] [nvarchar](max) NULL,
	[ReturnRequestStatusId] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RewardPointsHistory]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardPointsHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[Points] [int] NOT NULL,
	[PointsBalance] [int] NOT NULL,
	[UsedAmount] [decimal](18, 4) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UsedWithOrder_Id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RFQ]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQ](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RFQNo] [nvarchar](20) NULL,
	[IssueDate] [smalldatetime] NULL,
	[DueDate] [smalldatetime] NULL,
	[SupplierID] [int] NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[ModifiedDate] [smalldatetime] NULL,
	[Notes] [nvarchar](500) NULL,
	[TaxRate] [float] NULL,
	[SalesTax] [float] NULL,
	[OtherTax] [float] NULL,
	[Total] [decimal](18, 4) NULL,
	[isSend] [bit] NULL,
 CONSTRAINT [PK_RFQ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RFQ_Details]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RFQ_Details](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RFQID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [float] NULL,
	[Tax] [float] NULL,
 CONSTRAINT [PK_RFQ_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role_Permissions_Mapping]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Permissions_Mapping](
	[RoleID] [nvarchar](128) NOT NULL,
	[PermissionID] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Role_Permissions_Mapping] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesTax]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesTax](
	[ID] [int] NOT NULL,
	[TaxName] [varchar](50) NULL,
	[TaxPercent] [decimal](10, 2) NULL,
	[IsUsed] [bit] NULL,
 CONSTRAINT [PK_SalesTax] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScheduleTask]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleTask](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Seconds] [int] NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[StopOnError] [bit] NOT NULL,
	[LastStartUtc] [datetime] NULL,
	[LastEndUtc] [datetime] NULL,
	[LastSuccessUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SearchTerm]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchTerm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Keyword] [nvarchar](max) NULL,
	[Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 6/11/2015 10:42:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[TotalWeight] [decimal](18, 4) NULL,
	[ShippedDateUtc] [datetime] NULL,
	[DeliveryDateUtc] [datetime] NULL,
	[AdminComment] [nvarchar](max) NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShipmentItem]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShipmentId] [int] NOT NULL,
	[OrderItemId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingMethod]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingMethodRestrictions]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingMethodRestrictions](
	[ShippingMethod_Id] [int] NOT NULL,
	[Country_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingMethod_Id] ASC,
	[Country_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoppingCartItem]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [nvarchar](128) NOT NULL,
	[ShoppingCartTypeId] [int] NOT NULL,
	[CustomerId] [nvarchar](128) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[AttributesXml] [nvarchar](max) NULL,
	[CustomerEnteredPrice] [decimal](18, 4) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specification_Attribute]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specification_Attribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Specification_Attribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecificationAttribute]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificationAttribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK__Specific__3214EC075047BF8D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecificationAttributeOption]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificationAttributeOption](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecificationAttributeId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK__Specific__3214EC07D1B94B98] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StateProvince]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateProvince](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Abbreviation] [nvarchar](100) NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Store_Credit_Log]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Credit_Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](50) NOT NULL,
	[Issued_For_Order_Number] [nvarchar](50) NOT NULL,
	[Applied_Order_Number] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](15) NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[Comments] [nvarchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Store_Credit_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaxCategory]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TicketTypes]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTypes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[TableName] [nvarchar](100) NULL,
 CONSTRAINT [PK_TicketTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Address_Mapping]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Address_Mapping](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[CountryName] [nvarchar](128) NULL,
	[StateProvince] [nvarchar](128) NULL,
	[City] [nvarchar](128) NULL,
	[Address1] [nvarchar](512) NULL,
	[Address2] [nvarchar](512) NULL,
	[ZipPostalCode] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Landline] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[EntityType] [varchar](30) NULL,
	[OrderNumber] [nvarchar](40) NULL,
	[VerificationCode] [nvarchar](50) NULL,
	[MobileVerified] [bit] NULL,
 CONSTRAINT [PK_dbo.User_Address_Mapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Bank_Mapping]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Bank_Mapping](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[BranchCode] [nvarchar](30) NULL,
	[BranchName] [nvarchar](50) NULL,
	[BranchAddress] [nvarchar](128) NULL,
	[Currency] [nvarchar](20) NULL,
	[Zip_PostalCode] [varchar](20) NULL,
	[Landline1] [varchar](20) NULL,
	[Landline2] [varchar](20) NULL,
	[Email] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[SortOrder] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_User_Bank_Mapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_CreditCard_Mapping]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_CreditCard_Mapping](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[CreditCardNumber] [varchar](32) NULL,
	[BankName] [nvarchar](128) NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[CardHolderName] [nvarchar](50) NULL,
	[PinNumber] [nvarchar](10) NULL,
	[CardType] [nvarchar](32) NULL,
	[IsDefault] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.User_CreditCard_Mapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Documents]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Documents](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [nvarchar](50) NULL,
	[OrderId] [bigint] NULL,
	[File_URL] [nvarchar](max) NULL,
	[Uploaded_Date] [datetime] NULL,
 CONSTRAINT [PK_User_Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Roles_Mapping]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Roles_Mapping](
	[UserID] [nvarchar](128) NOT NULL,
	[RoleID] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_User_Roles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
	[UserID] [nvarchar](128) NOT NULL,
	[StoreName] [nvarchar](128) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[MetaUrl] [varchar](128) NULL,
	[MetaTitle] [nvarchar](64) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](1024) NULL,
	[CompanyName] [nvarchar](128) NULL,
	[CompanyLogoImage] [nvarchar](128) NULL,
	[ContactPersonName] [nvarchar](128) NULL,
	[ContactPersonMobile] [nvarchar](128) NULL,
	[ContactPersonEmail] [nvarchar](128) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Vendor] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Country] [nvarchar](30) NULL,
	[City] [nvarchar](30) NULL,
	[AddressLine1] [nvarchar](50) NULL,
	[AddressId] [bigint] NOT NULL,
	[OwnerID] [nvarchar](128) NULL,
 CONSTRAINT [PK__Warehous__3214EC076BBE36BE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Warehouse_Product]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse_Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SupplierID] [bigint] NULL,
	[VendorID] [nvarchar](128) NULL,
	[LPOID] [bigint] NULL,
	[WarehouseID] [int] NULL,
	[ZoneID] [int] NULL,
	[ShelfID] [int] NULL,
	[ProductID] [bigint] NULL,
	[CreationDate] [datetime] NULL,
	[CostPrice] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[ReservedQuantity] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Warehouse_Shelf]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse_Shelf](
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Warehouse_Zone]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse_Zone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseID] [int] NULL,
	[ZoneName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[XPObjectType]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPObjectType](
	[OID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeName] [nvarchar](254) NULL,
	[AssemblyName] [nvarchar](254) NULL,
 CONSTRAINT [PK_XPObjectType] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XPWeakReference]    Script Date: 6/11/2015 10:42:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPWeakReference](
	[Oid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TargetType] [int] NULL,
	[TargetKey] [nvarchar](100) NULL,
	[OptimisticLockField] [int] NULL,
	[GCRecord] [int] NULL,
	[ObjectType] [int] NULL,
 CONSTRAINT [PK_XPWeakReference] PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_IsCustomer]  DEFAULT ((0)) FOR [IsCustomer]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ParentID]  DEFAULT ((0)) FOR [ParentID]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_PopularSortOrder]  DEFAULT ((999)) FOR [PopularSortOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[Category_Brand_Mapping] ADD  CONSTRAINT [DF_Category_Brand_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ComplaintAgentTracking] ADD  CONSTRAINT [DF_ComplaintAgentTracking_AssignDate]  DEFAULT (getdate()) FOR [AssignDate]
GO
ALTER TABLE [dbo].[ComplaintTicket] ADD  CONSTRAINT [DF_ComplaintTicket_PostedDate]  DEFAULT (getdate()) FOR [DateOpened]
GO
ALTER TABLE [dbo].[ComplaintTicket] ADD  CONSTRAINT [DF_ComplaintTicket_IsAssignAgent]  DEFAULT ((0)) FOR [IsAssignAgent]
GO
ALTER TABLE [dbo].[ComplaintTicket_Details] ADD  CONSTRAINT [DF_ComplaintTicket_Details_ReplyDate]  DEFAULT (getdate()) FOR [ReplyDate]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF__Coupons__ExpiryD__1229A90A]  DEFAULT (getdate()) FOR [ExpiryDate]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF__Coupons__Startin__131DCD43]  DEFAULT (getdate()) FOR [StartingDate]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF__Coupons__Discoun__1411F17C]  DEFAULT ((0.00)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[Deal] ADD  CONSTRAINT [DF_Deal_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Deal] ADD  CONSTRAINT [DF_Deal_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Deal] ADD  CONSTRAINT [DF_Deal_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[Deal] ADD  CONSTRAINT [DF_Deal_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[DispatchRiders] ADD  CONSTRAINT [DF_DispatchRiders_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[DispatchRiders] ADD  CONSTRAINT [DF_DispatchRiders_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[LPO] ADD  CONSTRAINT [DF_LPO_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[LPO] ADD  CONSTRAINT [DF_LPO_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[LPO] ADD  CONSTRAINT [DF_LPO_IsLPOGenForOrder]  DEFAULT ((0)) FOR [IsLPOGenForOrder]
GO
ALTER TABLE [dbo].[LPO_Items] ADD  CONSTRAINT [DF_LPO_Items_ItemDiscount]  DEFAULT ((0)) FOR [LineItemDiscount]
GO
ALTER TABLE [dbo].[LPO_Items] ADD  CONSTRAINT [DF_LPO_Items_QuantityRecieved]  DEFAULT ((0)) FOR [QuantityReceived]
GO
ALTER TABLE [dbo].[LPO_Tracking] ADD  CONSTRAINT [DF_LPO_Tracking_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ManagmentEmailAddresses] ADD  CONSTRAINT [DF_ManagmentEmailAddresses_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_paypal_paid]  DEFAULT ((0)) FOR [paypal_paid]
GO
ALTER TABLE [dbo].[Order_Details] ADD  CONSTRAINT [DF_Order_Details_is_return]  DEFAULT ((0)) FOR [is_return]
GO
ALTER TABLE [dbo].[Order_SLA] ADD  CONSTRAINT [DF__Orders_SL__TimeS__349EBC9F]  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Permissions] ADD  CONSTRAINT [DF_Permissions_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Permissions] ADD  CONSTRAINT [DF_Permissions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Permissions] ADD  CONSTRAINT [DF_Permissions_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[Picklist] ADD  CONSTRAINT [DF__Picklist__Creati__218BE82B]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Placement] ADD  CONSTRAINT [DF_Placement_isActive]  DEFAULT ((1)) FOR [isActive]
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
ALTER TABLE [dbo].[Product_Images_Mapping] ADD  CONSTRAINT [DF_ProductImages_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product_Images_Mapping] ADD  CONSTRAINT [DF_ProductImages_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Product_Vendor_Mapping] ADD  CONSTRAINT [DF_Product_Vendor_Mapping_IsFreeShipping]  DEFAULT ((0)) FOR [IsFreeShipping]
GO
ALTER TABLE [dbo].[Product_Vendor_Mapping] ADD  CONSTRAINT [DF_Product_Vendor_Mapping_DisableBuyButton]  DEFAULT ((0)) FOR [DisableBuyButton]
GO
ALTER TABLE [dbo].[ProductPlacement] ADD  CONSTRAINT [DF_ProductPlacement_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ProductPlacement] ADD  CONSTRAINT [DF_ProductPlacement_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF__Purchase__IsDele__473C8FC7]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[Quicklink] ADD  CONSTRAINT [DF_Quicklink_IsShowOnTopMenu]  DEFAULT ((0)) FOR [IsShowOnTopMenu]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_isWarrantyGiven]  DEFAULT ((0)) FOR [isWarrantyGiven]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[User_Bank_Mapping] ADD  CONSTRAINT [DF_User_Bank_Mapping_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User_Bank_Mapping] ADD  CONSTRAINT [DF_User_Bank_Mapping_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[User_Bank_Mapping] ADD  CONSTRAINT [DF_Table_1_CreatedOn1]  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[User_Roles_Mapping] ADD  CONSTRAINT [DF_User_Roles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User_Roles_Mapping] ADD  CONSTRAINT [DF_User_Roles_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[User_Roles_Mapping] ADD  CONSTRAINT [DF_User_Roles_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[Warehouse_Product] ADD  CONSTRAINT [DF_Warehouse_Products_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AuditDataItemPersistent]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditDataItemPersistent_AuditedObject] FOREIGN KEY([AuditedObject])
REFERENCES [dbo].[AuditedObjectWeakReference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[AuditDataItemPersistent] CHECK CONSTRAINT [FK_AuditDataItemPersistent_AuditedObject]
GO
ALTER TABLE [dbo].[AuditDataItemPersistent]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditDataItemPersistent_NewObject] FOREIGN KEY([NewObject])
REFERENCES [dbo].[XPWeakReference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[AuditDataItemPersistent] CHECK CONSTRAINT [FK_AuditDataItemPersistent_NewObject]
GO
ALTER TABLE [dbo].[AuditDataItemPersistent]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditDataItemPersistent_OldObject] FOREIGN KEY([OldObject])
REFERENCES [dbo].[XPWeakReference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[AuditDataItemPersistent] CHECK CONSTRAINT [FK_AuditDataItemPersistent_OldObject]
GO
ALTER TABLE [dbo].[AuditedObjectWeakReference]  WITH NOCHECK ADD  CONSTRAINT [FK_AuditedObjectWeakReference_Oid] FOREIGN KEY([Oid])
REFERENCES [dbo].[XPWeakReference] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[AuditedObjectWeakReference] CHECK CONSTRAINT [FK_AuditedObjectWeakReference_Oid]
GO
ALTER TABLE [dbo].[BackInStockSubscription]  WITH CHECK ADD  CONSTRAINT [BackInStockSubscription_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BackInStockSubscription] CHECK CONSTRAINT [BackInStockSubscription_Customer]
GO
ALTER TABLE [dbo].[BackInStockSubscription]  WITH CHECK ADD  CONSTRAINT [BackInStockSubscription_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BackInStockSubscription] CHECK CONSTRAINT [BackInStockSubscription_Product]
GO
ALTER TABLE [dbo].[CheckoutAttributeValue]  WITH CHECK ADD  CONSTRAINT [CheckoutAttributeValue_CheckoutAttribute] FOREIGN KEY([CheckoutAttributeId])
REFERENCES [dbo].[CheckoutAttribute] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CheckoutAttributeValue] CHECK CONSTRAINT [CheckoutAttributeValue_CheckoutAttribute]
GO
ALTER TABLE [dbo].[ComplaintTicket]  WITH NOCHECK ADD  CONSTRAINT [FK_ComplaintTicket_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ComplaintTicket] NOCHECK CONSTRAINT [FK_ComplaintTicket_AspNetUsers]
GO
ALTER TABLE [dbo].[ComplaintTicket]  WITH NOCHECK ADD  CONSTRAINT [FK_ComplaintTicket_AspNetUsers1] FOREIGN KEY([AgentId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ComplaintTicket] NOCHECK CONSTRAINT [FK_ComplaintTicket_AspNetUsers1]
GO
ALTER TABLE [dbo].[ComplaintTicket]  WITH NOCHECK ADD  CONSTRAINT [FK_ComplaintTicket_TicketTypes] FOREIGN KEY([TicketTypeId])
REFERENCES [dbo].[TicketTypes] ([Id])
GO
ALTER TABLE [dbo].[ComplaintTicket] NOCHECK CONSTRAINT [FK_ComplaintTicket_TicketTypes]
GO
ALTER TABLE [dbo].[ComplaintTicket]  WITH NOCHECK ADD  CONSTRAINT [FK_ComplaintTicket_TicketTypes1] FOREIGN KEY([ComplaintStatus])
REFERENCES [dbo].[TicketTypes] ([Id])
GO
ALTER TABLE [dbo].[ComplaintTicket] NOCHECK CONSTRAINT [FK_ComplaintTicket_TicketTypes1]
GO
ALTER TABLE [dbo].[ComplaintTicket_Details]  WITH NOCHECK ADD  CONSTRAINT [FK_ComplaintTicket_Details_ComplaintTicket] FOREIGN KEY([ComplainId])
REFERENCES [dbo].[ComplaintTicket] ([Id])
GO
ALTER TABLE [dbo].[ComplaintTicket_Details] NOCHECK CONSTRAINT [FK_ComplaintTicket_Details_ComplaintTicket]
GO
ALTER TABLE [dbo].[Deal]  WITH CHECK ADD  CONSTRAINT [FK_Deal_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([UserID])
GO
ALTER TABLE [dbo].[Deal] CHECK CONSTRAINT [FK_Deal_Vendor]
GO
ALTER TABLE [dbo].[Deal_Details]  WITH CHECK ADD  CONSTRAINT [FK_Deal_Details_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Deal_Details] CHECK CONSTRAINT [FK_Deal_Details_Product]
GO
ALTER TABLE [dbo].[Discount_AppliedToCategories]  WITH CHECK ADD  CONSTRAINT [Discount_AppliedToCategories_Source] FOREIGN KEY([Discount_Id])
REFERENCES [dbo].[Discount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Discount_AppliedToCategories] CHECK CONSTRAINT [Discount_AppliedToCategories_Source]
GO
ALTER TABLE [dbo].[Discount_AppliedToProducts]  WITH CHECK ADD  CONSTRAINT [Discount_AppliedToProducts_Source] FOREIGN KEY([Discount_Id])
REFERENCES [dbo].[Discount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Discount_AppliedToProducts] CHECK CONSTRAINT [Discount_AppliedToProducts_Source]
GO
ALTER TABLE [dbo].[Discount_AppliedToProducts]  WITH CHECK ADD  CONSTRAINT [Discount_AppliedToProducts_Target] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Discount_AppliedToProducts] CHECK CONSTRAINT [Discount_AppliedToProducts_Target]
GO
ALTER TABLE [dbo].[DiscountRequirement]  WITH CHECK ADD  CONSTRAINT [Discount_DiscountRequirements] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DiscountRequirement] CHECK CONSTRAINT [Discount_DiscountRequirements]
GO
ALTER TABLE [dbo].[DiscountUsageHistory]  WITH CHECK ADD  CONSTRAINT [DiscountUsageHistory_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DiscountUsageHistory] CHECK CONSTRAINT [DiscountUsageHistory_Discount]
GO
ALTER TABLE [dbo].[DiscountUsageHistory]  WITH CHECK ADD  CONSTRAINT [DiscountUsageHistory_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DiscountUsageHistory] CHECK CONSTRAINT [DiscountUsageHistory_Order]
GO
ALTER TABLE [dbo].[ExternalAuthenticationRecord]  WITH CHECK ADD  CONSTRAINT [ExternalAuthenticationRecord_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExternalAuthenticationRecord] CHECK CONSTRAINT [ExternalAuthenticationRecord_Customer]
GO
ALTER TABLE [dbo].[KpiDefinition]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiDefinition_KpiInstance] FOREIGN KEY([KpiInstance])
REFERENCES [dbo].[KpiInstance] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiDefinition] CHECK CONSTRAINT [FK_KpiDefinition_KpiInstance]
GO
ALTER TABLE [dbo].[KpiHistoryItem]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiHistoryItem_KpiInstance] FOREIGN KEY([KpiInstance])
REFERENCES [dbo].[KpiInstance] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiHistoryItem] CHECK CONSTRAINT [FK_KpiHistoryItem_KpiInstance]
GO
ALTER TABLE [dbo].[KpiInstance]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiInstance_KpiDefinition] FOREIGN KEY([KpiDefinition])
REFERENCES [dbo].[KpiDefinition] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiInstance] CHECK CONSTRAINT [FK_KpiInstance_KpiDefinition]
GO
ALTER TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiScorecardScorecards_KpiInstanceIndicators_Indicators] FOREIGN KEY([Indicators])
REFERENCES [dbo].[KpiInstance] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators] CHECK CONSTRAINT [FK_KpiScorecardScorecards_KpiInstanceIndicators_Indicators]
GO
ALTER TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators]  WITH NOCHECK ADD  CONSTRAINT [FK_KpiScorecardScorecards_KpiInstanceIndicators_Scorecards] FOREIGN KEY([Scorecards])
REFERENCES [dbo].[KpiScorecard] ([Oid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KpiScorecardScorecards_KpiInstanceIndicators] CHECK CONSTRAINT [FK_KpiScorecardScorecards_KpiInstanceIndicators_Scorecards]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [NewsItem_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [NewsItem_Language]
GO
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD  CONSTRAINT [NewsComment_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsComment] CHECK CONSTRAINT [NewsComment_Customer]
GO
ALTER TABLE [dbo].[NewsComment]  WITH CHECK ADD  CONSTRAINT [NewsComment_NewsItem] FOREIGN KEY([NewsItemId])
REFERENCES [dbo].[News] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsComment] CHECK CONSTRAINT [NewsComment_NewsItem]
GO
ALTER TABLE [dbo].[Poll]  WITH CHECK ADD  CONSTRAINT [Poll_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Poll] CHECK CONSTRAINT [Poll_Language]
GO
ALTER TABLE [dbo].[PollAnswer]  WITH CHECK ADD  CONSTRAINT [PollAnswer_Poll] FOREIGN KEY([PollId])
REFERENCES [dbo].[Poll] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PollAnswer] CHECK CONSTRAINT [PollAnswer_Poll]
GO
ALTER TABLE [dbo].[PollVotingRecord]  WITH CHECK ADD  CONSTRAINT [PollVotingRecord_PollAnswer] FOREIGN KEY([PollAnswerId])
REFERENCES [dbo].[PollAnswer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PollVotingRecord] CHECK CONSTRAINT [PollVotingRecord_PollAnswer]
GO
ALTER TABLE [dbo].[Product_Images_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_Images_Mapping_dbo.Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Product_Images_Mapping] CHECK CONSTRAINT [FK_dbo.Product_Images_Mapping_dbo.Product_ProductID]
GO
ALTER TABLE [dbo].[Product_Images_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Product_Images_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Product_Images_Mapping] CHECK CONSTRAINT [FK_Product_Images_Product]
GO
ALTER TABLE [dbo].[Product_Specification_Attribute_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_Specification_Attribute_Mapping_dbo.Specification_Attribute_SpecificationAttributeID] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[SpecificationAttribute] ([Id])
GO
ALTER TABLE [dbo].[Product_Specification_Attribute_Mapping] CHECK CONSTRAINT [FK_dbo.Product_Specification_Attribute_Mapping_dbo.Specification_Attribute_SpecificationAttributeID]
GO
ALTER TABLE [dbo].[Product_Specification_Attribute_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Product_Specification_Attribute_Mapping_Specification_Attribute] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[SpecificationAttribute] ([Id])
GO
ALTER TABLE [dbo].[Product_Specification_Attribute_Mapping] CHECK CONSTRAINT [FK_Product_Specification_Attribute_Mapping_Specification_Attribute]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_LPO] FOREIGN KEY([LPOID])
REFERENCES [dbo].[LPO] ([ID])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_LPO]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Supplier]
GO
ALTER TABLE [dbo].[Purchase_Items]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Items_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Purchase_Items] CHECK CONSTRAINT [FK_Purchase_Items_Product]
GO
ALTER TABLE [dbo].[Purchase_Items]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Items_Purchase] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[Purchase] ([ID])
GO
ALTER TABLE [dbo].[Purchase_Items] CHECK CONSTRAINT [FK_Purchase_Items_Purchase]
GO
ALTER TABLE [dbo].[ReturnRequest]  WITH CHECK ADD  CONSTRAINT [ReturnRequest_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReturnRequest] CHECK CONSTRAINT [ReturnRequest_Customer]
GO
ALTER TABLE [dbo].[RewardPointsHistory]  WITH CHECK ADD  CONSTRAINT [RewardPointsHistory_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RewardPointsHistory] CHECK CONSTRAINT [RewardPointsHistory_Customer]
GO
ALTER TABLE [dbo].[RewardPointsHistory]  WITH CHECK ADD  CONSTRAINT [RewardPointsHistory_UsedWithOrder] FOREIGN KEY([UsedWithOrder_Id])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[RewardPointsHistory] CHECK CONSTRAINT [RewardPointsHistory_UsedWithOrder]
GO
ALTER TABLE [dbo].[Role_Permissions_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Role_Permissions_Mapping_dbo.Permission_PermissionID] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Role_Permissions_Mapping] CHECK CONSTRAINT [FK_dbo.Role_Permissions_Mapping_dbo.Permission_PermissionID]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [Shipment_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [Shipment_Order]
GO
ALTER TABLE [dbo].[ShipmentItem]  WITH CHECK ADD  CONSTRAINT [ShipmentItem_Shipment] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipment] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShipmentItem] CHECK CONSTRAINT [ShipmentItem_Shipment]
GO
ALTER TABLE [dbo].[ShippingMethodRestrictions]  WITH CHECK ADD  CONSTRAINT [ShippingMethod_RestrictedCountries_Source] FOREIGN KEY([ShippingMethod_Id])
REFERENCES [dbo].[ShippingMethod] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShippingMethodRestrictions] CHECK CONSTRAINT [ShippingMethod_RestrictedCountries_Source]
GO
ALTER TABLE [dbo].[ShippingMethodRestrictions]  WITH CHECK ADD  CONSTRAINT [ShippingMethod_RestrictedCountries_Target] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[Country] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShippingMethodRestrictions] CHECK CONSTRAINT [ShippingMethod_RestrictedCountries_Target]
GO
ALTER TABLE [dbo].[ShoppingCartItem]  WITH CHECK ADD  CONSTRAINT [ShoppingCartItem_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCartItem] CHECK CONSTRAINT [ShoppingCartItem_Customer]
GO
ALTER TABLE [dbo].[ShoppingCartItem]  WITH CHECK ADD  CONSTRAINT [ShoppingCartItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCartItem] CHECK CONSTRAINT [ShoppingCartItem_Product]
GO
ALTER TABLE [dbo].[SpecificationAttributeOption]  WITH CHECK ADD  CONSTRAINT [SpecificationAttributeOption_SpecificationAttribute] FOREIGN KEY([SpecificationAttributeId])
REFERENCES [dbo].[SpecificationAttribute] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SpecificationAttributeOption] CHECK CONSTRAINT [SpecificationAttributeOption_SpecificationAttribute]
GO
ALTER TABLE [dbo].[StateProvince]  WITH CHECK ADD  CONSTRAINT [StateProvince_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StateProvince] CHECK CONSTRAINT [StateProvince_Country]
GO
ALTER TABLE [dbo].[User_Bank_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_User_Bank_Mapping_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[User_Bank_Mapping] CHECK CONSTRAINT [FK_User_Bank_Mapping_AspNetUsers]
GO
ALTER TABLE [dbo].[User_Roles_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles_Mapping_AspNetRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[User_Roles_Mapping] CHECK CONSTRAINT [FK_User_Roles_Mapping_AspNetRoles]
GO
ALTER TABLE [dbo].[XPWeakReference]  WITH NOCHECK ADD  CONSTRAINT [FK_XPWeakReference_ObjectType] FOREIGN KEY([ObjectType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[XPWeakReference] CHECK CONSTRAINT [FK_XPWeakReference_ObjectType]
GO
ALTER TABLE [dbo].[XPWeakReference]  WITH NOCHECK ADD  CONSTRAINT [FK_XPWeakReference_TargetType] FOREIGN KEY([TargetType])
REFERENCES [dbo].[XPObjectType] ([OID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[XPWeakReference] CHECK CONSTRAINT [FK_XPWeakReference_TargetType]
GO
