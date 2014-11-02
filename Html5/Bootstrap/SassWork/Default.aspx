<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/customcontrols/hoempage_background_image.ascx" TagPrefix="uc1" TagName="hoempage_background_image" %>
<%@ Register Src="~/customcontrols/main_search.ascx" TagPrefix="uc1" TagName="main_search" %>









<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">  
    <uc1:hoempage_background_image runat="server" ID="hoempage_background_image" />
    <uc1:main_search runat="server" ID="main_search" />
</asp:Content>