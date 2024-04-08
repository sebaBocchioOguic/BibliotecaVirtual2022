<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AltaLibro.aspx.cs" Inherits="WebBiblioteca.AltaLibro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div>
        Ingreso de nuevo libro
        <br />
        <table border="1" class="nav-justified">
            <tr>
                <td class="text-right">
                    <asp:Label ID="lblISBN" runat="server" Text="Ingrese el ISBN (17 caracteres)"></asp:Label>
                </td>
                <td style="width: 269px" class="modal-sm">
                    <asp:TextBox ID="txtISBN" runat="server" style="margin-left: 0" Width="250px" MaxLength="17"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvISBN" runat="server" ControlToValidate="txtISBN" ErrorMessage="Dato Obligatorio" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <asp:Label ID="lblTitulo" runat="server" Text="Titulo"></asp:Label>
                </td>
                <td style="width: 269px" class="modal-sm">
                    <asp:TextBox ID="txtTitulo" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" ControlToValidate="txtTitulo" ErrorMessage="Dato Obligatorio" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <asp:Label ID="lblEdicion" runat="server" Text="Edición (AAAA)"></asp:Label>
                </td>
                <td style="width: 269px" class="modal-sm">
                    <asp:TextBox ID="txtEdicion" runat="server" Width="250px" MaxLength="4"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="cvEdicion" runat="server" ControlToValidate="txtEdicion" ErrorMessage="Formato Incorrecto" Font-Bold="True" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <asp:Label ID="lblGenero" runat="server" Text="Género"></asp:Label>
                </td>
                <td style="width: 269px" class="modal-sm">
                    <asp:DropDownList ID="ddlGenero" runat="server" Width="250px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="text-right">
                    <asp:Label ID="lblEditorial" runat="server" Text="Editorial"></asp:Label>
                </td>
                <td style="width: 269px" class="modal-sm">
                    <asp:DropDownList ID="ddlEditorial" runat="server" Width="250px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div>Autores</div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td class="modal-lg" style="width: 217px; height: 173px">
                    <asp:GridView ID="gvAutoresSeleccionados" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvAutoresSeleccionados_PageIndexChanging" OnSelectedIndexChanged="gvAutoresSeleccionados_SelectedIndexChanged" PageSize="5" Width="303px">
                        
                        <Columns>
                            <asp:BoundField DataField="IdAutor" HeaderText="Codigo" />
                            <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        </Columns>
                        
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
                </td>
                <td class="modal-sm" style="width: 156px; text-align: center; height: 173px">
                    <asp:Button ID="btnAgregar" runat="server" OnClick="Button1_Click" Text="Agregar Escritor --&gt;" />
                </td>
                <td style="height: 173px">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateDeleteButton="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" style="margin-right: 2px" Width="336px">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="modal-lg" style="width: 217px; height: 59px"></td>
                <td class="modal-sm" style="width: 156px; text-align: center; height: 59px">
                    <asp:Button ID="btnEnviar" runat="server" OnClick="btnEnviar_Click" Text="Enviar" />
                </td>
                <td style="height: 59px"></td>
            </tr>
        </table>
    </div>
</asp:Content>
