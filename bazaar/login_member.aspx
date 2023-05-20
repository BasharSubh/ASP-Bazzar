<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login_member.aspx.cs" Inherits="loginmanager" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
     <mobile:Form id="Form1" runat="server" OnActivate="Form1_Activate"><mobile:Label
         ID="Label1" Runat="server">йслМА онФА гАцзжга</mobile:Label><br />------------------------------<br />User name:<strong><BR /></strong><mobile:TextBox
            ID="TextBox2" Runat="server">
        </mobile:TextBox>Password:<br /><mobile:TextBox ID="TextBox1" Runat="server" BackColor="#E0E0E0"
            Font-Size="Small" Password="True">
        </mobile:TextBox> <mobile:Command ID="Command1" Runat="server" OnClick="Command1_Click">Login</mobile:Command>------------------------------<br /><mobile:Label
                ID="Label2" Runat="server" ForeColor="Red"> </mobile:Label></mobile:Form>
    
</body>
</html>
