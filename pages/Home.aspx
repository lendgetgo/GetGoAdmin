<%@ Page Title="" Language="C#" MasterPageFile="~/GetGo_MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="GetGoWeb.Home" %>
<%--<%@ MasterType VirtualPath="~/GetGo_MasterPage.master" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #1B5B6B; font-size: 60px; padding-bottom: 50px; font-family: 'Arial Rounded MT'; position: fixed; top: 40%; left: 50%; text-align:center">
        Good Day
        <br />Admin!
        </h1>
    <script>
        var _ipaddress = "<%= this.ipAddress %>";
    </script>
    <script src="../scripts/Home.js?v=<%= DateTimeOffset.Now.ToUnixTimeMilliseconds() %>"></script>
</asp:Content>

