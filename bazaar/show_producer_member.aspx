<%@ Page Language="C#" Inherits="System.Web.UI.MobileControls.MobilePage" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    { 
        if (this.IsPostBack)
            return;

        string sql = "SELECT producer, quality_of_5, producer_id, is_sell, first_price, last_old_price ,last_price,date_of_start_bazaar ,date_of_end_bazaar from producer where is_sell='yes' ";
                     
 
        string connectionStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionStr);
        SqlCommand cmd = new SqlCommand(sql, con);
        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
         
            ObjectList1.DataSource = reader;
            ObjectList1.DataBind();
            this.Label2.Text = "Ã„Ì⁄ «·»«“«—«  «·ﬁœÌ„…";

          

        }
        finally
        {
            con.Close();
      
        }
   
        
    }





   
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Calendar1.SelectedDate.ToString("D");


        string connectionStr1 = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionStr1);


        
        DateLabel.Text = Calendar1.SelectedDate.ToString("MM/dd/yyyy");
        

        SqlCommand search = new SqlCommand("SELECT producer, quality_of_5, producer_id, is_sell, first_price, last_old_price ,last_price,date_of_start_bazaar, date_of_end_bazaar from producer where is_sell='yes' and date_of_end_bazaar ='" + DateLabel.Text + "' ", conn);
        try
        {
           
            conn.Open();
           
            search.ExecuteNonQuery();
            this.Label1.Text = "searched successfully";

            SqlDataReader reader = search.ExecuteReader();
            ObjectList1.DataSource = reader;
            
            this.Label2.Text = "‰ «∆Ã «·»ÕÀ";
            ObjectList1.DataBind();


        }
        catch
        {
            
            this.Label1.Text = "searched error";

        }
        finally
        {
            conn.Close();

        }
             
        
        
        ActiveForm = this.form1;
    }

  
    protected void Command1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");

    }


    protected void ObjectList1_ItemCommand(object sender, ObjectListCommandEventArgs e)
    {

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>

    <mobile:form id="form1" runat="server"><mobile:Label ID="Label2" Runat="server">Label</mobile:Label><br /><mobile:ObjectList ID="ObjectList1" Runat="server" CommandStyle-StyleReference="subcommand"
            LabelStyle-StyleReference="title" StyleReference="title" OnItemCommand="ObjectList1_ItemCommand"></mobile:ObjectList><br />&nbsp;<mobile:Label ID="Label3" Runat="server">«·»ÕÀ Õ”»  «—ÌŒ „⁄Ì‰ «Œ —  «—ÌŒ „‰ «·«”›·</mobile:Label><br /><mobile:Label
        ID="Label1" Runat="server"></mobile:Label><br /><mobile:Calendar ID="Calendar1" Runat="server" OnSelectionChanged="Calendar1_SelectionChanged">
        </mobile:Calendar> <mobile:Label ID="DateLabel" Runat="server">
        </mobile:Label><br /><mobile:Command ID="Command1" Runat="server" OnClick="Command1_Click1">home page</mobile:Command></mobile:form>&nbsp;

</body>
</html>
