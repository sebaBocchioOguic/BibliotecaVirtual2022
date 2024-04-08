<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paises.aspx.cs" Inherits="WebBiblioteca.Paises" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div>
        Ingresar nuevo País : <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        Region : <asp:TextBox ID="txtRegion" runat="server"></asp:TextBox>
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />
        <br />
        <asp:GridView ID="gvPaises" runat="server" Caption="Lista de Paises" CellPadding="4" EmptyDataText="No hay paises" ForeColor="#333333" GridLines="None" Height="188px" Width="326px" AllowPaging="True" OnPageIndexChanging="gvPaises_PageIndexChanging" PageSize="8">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>

</asp:Content>
