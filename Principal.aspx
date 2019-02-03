<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Principal.aspx.cs" Inherits="Principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin:auto;
        }
        #form1 {
            width: 600px;
            margin: auto;
            padding: 5px 10px;
            background-color:#0D1A26;
            border-radius:8px;
            color:#fff;
        }
        #btn_lanzar {
            border-radius:5px;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id=" content">
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Numero de paquetes:</td>
                <td class="auto-style2">A enviar:</td>
                <td class="auto-style2">Lista en oficina:</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="tb_n" runat="server" ToolTip="numero de paquetes en total"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tb_n" ErrorMessage="(1) Campo excedido" ForeColor="#CC0000" MaximumValue="50" MinimumValue="1" Type="Integer" Font-Size="Small">(1)</asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_n" ErrorMessage="(1) Campo Requerido" ForeColor="#CC0000" Font-Size="Small">(1)</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="tb_k" runat="server" ToolTip="numero de paquetes a enviar"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="tb_k" ErrorMessage="(2) Campo excedido" ForeColor="#CC0000" MaximumValue="50" MinimumValue="1" Type="Integer" Font-Size="Small">(2)</asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_k" ErrorMessage="(2) Campo requerido" ForeColor="#CC0000" Font-Size="Small">(2)</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="tb_lista" runat="server" ToolTip="lista de paquetes"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_lista" ErrorMessage="(3) Campo requerido" ForeColor="#CC0000" Font-Size="Small">(3)</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="tb_n" ErrorMessage="CustomValidator" ForeColor="#CC0000" OnServerValidate="CustomValidator1_ServerValidate" Font-Size="Small">(1)</asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="tb_k" ErrorMessage="CustomValidator" ForeColor="#CC0000" OnServerValidate="CustomValidator2_ServerValidate" Font-Size="Small">(2)</asp:CustomValidator>
                    <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Font-Size="Small"></asp:Label>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btn_lanzar" runat="server" Text="Lanzar cohete" OnClick="btn_lanzar_Click" />
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">
                    <asp:TextBox ID="tb_peso" runat="server" ToolTip="peso minimo de transporte" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
        </table>
        
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" HeaderText="Errores en los campos:" />
        
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
