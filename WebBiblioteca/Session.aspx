<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Session.aspx.cs" Inherits="WebBiblioteca.Session" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="text-center">
        <asp:Label ID="lblUsuario" Text="Nombre:" runat="server" />
        <br /><br />
        <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click"></asp:Button>
    </div>
</asp:Content>

