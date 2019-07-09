<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxQuery.aspx.cs" Inherits="Site_Build_Template_AjaxQuery" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style>
*{font-family:Tahoma;
  font-size:11px;
  margin:2px 10px 5px 2px;
}
h1
{font-size:15px;
 background-color:#eee;
 padding:5px
 }
h3
{font-weight:bold;
 font-size:12px;
 background-color:#eeeeee;
 padding:3px;}	
    </style>
</head>
<body>
<h1>Ajax Template</h1><br />
    <form id="form1" runat="server">
    <h3>Nombre de script</h3>
    <div style="background-color:#ffffcc;padding:10px;">
        <asp:Label ID="lblNombre"  runat="server" Text="Nombre"></asp:Label>
        <asp:TextBox ID="txtNombreObjeto" style="width:300px" runat="server"></asp:TextBox>
        <asp:Button ID="btnCrear" runat="server" Text="Crear" style="width:100px;background-color:#444;color:#fff;border: solid 1px #ccc;padding:3px 10px 3px 10px"
            onclick="btnCrear_Click" />
        <asp:RequiredFieldValidator ID="rqvNombre" runat="server" 
            ControlToValidate="txtNombreObjeto" ErrorMessage="Ingresar nombre"></asp:RequiredFieldValidator>
    
    </div>
    <asp:Label ID="lblError" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
    <br />
    <h3>Campos a consultar</h3>
    <div>
        <asp:Label ID="lblItem" runat="server" Text="Nombre"></asp:Label>
        <asp:TextBox ID="txtItemName" style="width:300px" runat="server"></asp:TextBox>
        <asp:Button ID="btnAddITem" runat="server" Text="Agregar" onclick="btnAddITem_Click" 
             />
        <asp:RequiredFieldValidator ID="rqvAgregarItem" runat="server" 
            ControlToValidate="txtItemName" ErrorMessage="Ingresar nombre del item"></asp:RequiredFieldValidator>
    
    </div>
    <asp:ListBox style="width:250px;height:300px" ID="lstCampos" runat="server"></asp:ListBox>
    </form>
</body>
</html> 
