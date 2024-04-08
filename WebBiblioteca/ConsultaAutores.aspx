<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaAutores.aspx.cs" Inherits="WebBiblioteca.ConsultaAutores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div>Seleccione el país 
        <asp:DropDownList ID="ddlPaises" runat="server" Width="159px" AutoPostBack="True" OnSelectedIndexChanged="ddlPaises_SelectedIndexChanged"></asp:DropDownList><asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
    </div>
    <div>
        <asp:GridView ID="gvAutores" runat="server" Caption="Lista de Autores" CellPadding="4" EmptyDataText="Sin Autores" ForeColor="#333333" GridLines="None" Height="202px" OnSelectedIndexChanged="gvAutores_SelectedIndexChanged" Width="514px" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvAutores_PageIndexChanging" PageSize="8">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <Columns>
                <asp:BoundField DataField="IdAutor" HeaderText="Codigo" />
                <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="FechaNacimiento" HeaderText="Fecha Nac." DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Pais" HeaderText="Nacionalidad" />
            </Columns>
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
