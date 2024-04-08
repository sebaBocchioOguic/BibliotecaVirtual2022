<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoAutor.aspx.cs" Inherits="WebBiblioteca.NuevoAutor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div>
        <h2>Ingreso de Nuevo Autor</h2>
        <table style="border-style: solid; border-width: 1px; width: 100%;">
            <tr>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 294px;" class="text-right">
                    <asp:Label ID="lblApellido" runat="server" Text="Ingrese Apellido(*) : "></asp:Label>
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 502px;">
                    <asp:TextBox ID="txtApellido" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px">
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="El Campo Apellido es Obligatorio" Font-Bold="True" ForeColor="Red">Campo Obligatorio</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 294px;" class="text-right">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre(*) :"></asp:Label>
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 502px;">
                    <asp:TextBox ID="txtNombre" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="El Campo Nombre es Obligatorio" Font-Bold="True" ForeColor="Red">Campo Obligatorio</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 294px;" class="text-right">
                    <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento(dd/mm/aaaa) :"></asp:Label>
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 502px;">
                    <asp:TextBox ID="txtFechaNacimiento" runat="server" Width="254px"></asp:TextBox>
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px">
                    <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFechaNacimiento" Display="Dynamic" ErrorMessage="El Campo Fecha de Nacimiento es Obligatorio" Font-Bold="True" ForeColor="Red">Campo Obligatorio</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvFecha" runat="server" ErrorMessage="El Formato de Fecha No es Válido" Font-Bold="True" ForeColor="Red" ControlToValidate="txtFechaNacimiento" Display="Dynamic" Operator="DataTypeCheck" Type="Date">Formato Incorrecto</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 294px;" class="text-right">
                    <asp:Label ID="lblPais" runat="server" Text=" Seleccione Nacionalidad :"></asp:Label>
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 502px;">
                    <asp:DropDownList ID="ddlPaises" runat="server" Width="254px" OnSelectedIndexChanged="ddlPaises_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px"></td>
            </tr>
            <tr>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 294px;" class="text-right">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Width="273px" style="margin-left: 0" OnClick="btnEnviar_Click" />
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px; width: 502px;">
                    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                </td>
                <td style="border-style: solid; border-width: 1px; height: 40px">
                    <asp:Button ID="btnReglas" runat="server" Text="Ver Reglas de Negocio" CausesValidation="False" OnClick="btnReglas_Click" />
                </td>
            </tr>
        </table>
        (*) campos obligatorios
    </div>
    <div>
        <asp:ValidationSummary ID="vsNuevoAutor" runat="server" HeaderText="Errores Encontrados" ShowMessageBox="True" ShowSummary="False" />
    </div>
</asp:Content>
