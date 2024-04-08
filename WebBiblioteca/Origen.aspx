<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Origen.aspx.cs" Inherits="WebBiblioteca.Origen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="text-center" style="vertical-align: middle">
        Dato a Pasar <asp:TextBox runat="server" ID="txtDato" /> <asp:Button ID="btnEnviar" Text="Enviar" runat="server" OnClick="btnEnviar_Click" />
    </div>
</asp:Content>
