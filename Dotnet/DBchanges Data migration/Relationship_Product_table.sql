USE [SnacCommerce-DataTest]
GO

ALTER TABLE [dbo].[Product_Images_Mapping] DROP CONSTRAINT [FK_dbo.Product_Images_Mapping_dbo.Product_ProductID]
GO


ALTER TABLE [dbo].[Product_Specification_Attribute_Mapping] DROP CONSTRAINT [FK_dbo.Product_Specification_Attribute_Mapping_dbo.Product_ProductID]
GO


ALTER TABLE [dbo].[Product_Images_Mapping] DROP CONSTRAINT [FK_Product_Images_Product]
GO

ALTER TABLE [dbo].[Product_Specification_Attribute_Mapping] DROP CONSTRAINT [FK_Product_Specification_Attribute_Mapping_Product]
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