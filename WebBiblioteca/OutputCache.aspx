<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutputCache.aspx.cs" Inherits="WebBiblioteca.OutputCache" %>
<%@ OutputCache Duration="15" VaryByParam="none" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="lblFecha" runat="server" Text="Label"></asp:Label><br />
    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" Height="45px" Width="147px" OnClick="btnActualizar_Click" />

</asp:Content>
