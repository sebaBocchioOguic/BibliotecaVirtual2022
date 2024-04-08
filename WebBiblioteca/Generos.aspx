<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Generos.aspx.cs" Inherits="WebBiblioteca.Generos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    Nombre del Género <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    <asp:Button ID="btnAgregar" runat="server" Text="Enviar" OnClick="btnAgregar_Click" />
    <br />
    Id: <asp:Label ID="lblId" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" /><br />
    <asp:Button ID="btnBorrar" runat="server" Text="Borrar" OnClick="btnBorrar_Click" />

    <div class="text-center" style="height: 230px">
        <asp:GridView ID="gvGeneros" runat="server" AllowPaging="True" Caption="Lista de Géneros" CaptionAlign="Top" CellPadding="4" ForeColor="#333333" GridLines="None" Height="192px" OnPageIndexChanging="gvGeneros_PageIndexChanging" OnSelectedIndexChanged="gvGeneros_SelectedIndexChanged" PageSize="5" Width="363px" AutoGenerateSelectButton="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
</asp:Content>
