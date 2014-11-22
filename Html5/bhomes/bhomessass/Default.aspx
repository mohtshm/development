<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/custom_controls/templates/mainpage_background_image.ascx" TagPrefix="uc1" TagName="mainpage_background_image" %>
<%@ Register Src="~/custom_controls/templates/main_search.ascx" TagPrefix="uc1" TagName="main_search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:mainpage_background_image runat="server" ID="mainpage_background_image" />
    <uc1:main_search runat="server" ID="main_search" />
</asp:Content>

