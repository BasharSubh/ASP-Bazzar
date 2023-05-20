<%@ Page Language="C#" Inherits="System.Web.UI.MobileControls.MobilePage" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>

<script runat="server">

    protected void Command1_Click(object sender, EventArgs e)
    {
        Response.Redirect("show_producer.aspx");
    }

    protected void Command4_Click(object sender, EventArgs e)
    {
        Response.Redirect("login_admin.aspx");
    }

    protected void Command2_Click(object sender, EventArgs e)
    {
        Response.Redirect("reg_member.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
    <mobile:form id="form1" runat="server" BackColor="#E0E0E0">
        <mobile:Label ID="Label1" Runat="server" Alignment="Center" Font-Bold="True" Font-Size="Large"
            ForeColor="Green">welcome to our site</mobile:Label>
        <br />
        <mobile:Command ID="Command1" Runat="server" Alignment="Right" BackColor="#FFFFC0"
            Font-Bold="True" Font-Size="Normal" ForeColor="Blue" OnClick="Command1_Click">ÚÑÖ ÇÎÑ ÇáÈÇÒÇÑÇÊ ÈÇÎÑ ÇáÇÓÚÇÑ</mobile:Command>
        <mobile:Command ID="Command2" Runat="server" Alignment="Right" BackColor="#FFFFC0" StyleReference="subcommand" OnClick="Command2_Click">ÇáÏÎæá ááãäÊÓÈíä</mobile:Command>
        <mobile:Command ID="Command3" Runat="server" Alignment="Right" BackColor="#FFFFC0">ÊÓÌíá ãÓÊÎÏã ÌÏíÏ</mobile:Command>
        <mobile:Command ID="Command4" Runat="server" Alignment="Right" BackColor="#FFFFC0" OnClick="Command4_Click">ÇáÏÎæá ááãÏíÑ</mobile:Command>

    </mobile:form>
</body>
</html>
