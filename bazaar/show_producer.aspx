<%@ Page Language="C#" Inherits="System.Web.UI.MobileControls.MobilePage" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    { 
        if (this.IsPostBack)
            return;
        string sql = "SELECT producer, quality_of_5, producer_id,date_of_start_bazaar,last_price from producer  where is_sell = 'no' ";
        string connectionStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionStr);
        SqlCommand cmd = new SqlCommand(sql, con);
        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ObjectList1.DataSource = reader;
            ObjectList1.DataBind();
        }
        finally
        {
            con.Close();
        }
    }

    protected void Command1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
    <mobile:form id="form1" runat="server">
        <mobile:Label ID="Label1" Runat="server">«·„‰ Ã«  «·„ Ê›—… Õ«·Ì« ›Ì «·»«“«— »√Œ— ”⁄—</mobile:Label>
        <br />
       
        <mobile:ObjectList ID="ObjectList1" Runat="server" CommandStyle-StyleReference="subcommand"
            LabelStyle-StyleReference="title">
        </mobile:ObjectList>
        <mobile:Command ID="Command1" Runat="server" OnClick="Command1_Click">«·’›Õ… «·—∆Ì”Ì…</mobile:Command>
    </mobile:form>
</body>
</html>
