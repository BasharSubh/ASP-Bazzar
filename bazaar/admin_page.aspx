<%@ Page Language="C#" Inherits="System.Web.UI.MobileControls.MobilePage" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack)
            return;
        string sql = "SELECT producer, quality_of_5, producer_id, is_sell, first_price, last_old_price ,last_price,date_of_start_bazaar , date_of_end_bazaar from producer where is_sell ='no' ";
        string sql1 = "SELECT producer, quality_of_5, producer_id, is_sell, first_price, last_old_price ,last_price,date_of_start_bazaar , date_of_end_bazaar from producer where is_sell ='yes' ";
        string connectionStr = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionStr);
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlCommand cmd1 = new SqlCommand(sql1, con);
        try
        {
            con.Open();
            DataTable tbl = new DataTable();
            SqlDataAdapter ad = new SqlDataAdapter();
            ad.SelectCommand = cmd;
            ad.Fill(tbl);
            this.datebaselist.DataSource = tbl;
            this.datebaselist.LabelField = "producer";
            this.datebaselist.DataBind();


            
            SqlDataReader reader = cmd1.ExecuteReader();
            ObjectList1.DataSource = reader;
            ObjectList1.DataBind();
        }
        finally
        {
             con.Close();
        }
        this.ActiveForm = this.Form2;
    }

  

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        this.ActiveForm = form1;
    }

    protected void datebaselist_ItemCommand(object sender, ObjectListCommandEventArgs e)
    {
        if (e.CommandName == "btnUpdate")
        {


            this.lblUpdate.Text = this.lblUpdate.Text + e.ListItem["producer_id"].ToString();
            this.lblId.Text = e.ListItem["producer_id"].ToString();
            this.TextBox16.Text = e.ListItem["producer"].ToString();
            this.TextBox17.Text = e.ListItem["quality_of_5"].ToString();
            this.TextBox19.Text = e.ListItem["first_price"].ToString();
            this.TextBox20.Text = e.ListItem["last_old_price"].ToString();
            this.TextBox21.Text = e.ListItem["last_price"].ToString();
            this.ActiveForm = this.Form3;
        }
        else { 
             this.lblUpdate.Text = this.lblUpdate.Text + e.ListItem["producer_id"].ToString();
            this.lblId.Text = e.ListItem["producer_id"].ToString();
             this.ActiveForm = this.Form4;
        }

        }
      
    
    

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_page.aspx");
    }



   
       
         
       
    
    
    protected void btnChange_Click(object sender, EventArgs e)
    {
        int producer_id;
        int.TryParse(this.lblId.Text, out producer_id);
        string producer = this.TextBox16.Text;
        String quality_of_5 = this.TextBox17.Text;
        String first_price = this.TextBox19.Text;
        String last_old_price = this.TextBox20.Text;
        String last_price = this.TextBox21.Text;
        

     

        string sql = "update producer set producer ='" + producer + "', quality_of_5 = '" + quality_of_5 + "', first_price='" + first_price + "',last_old_price='" + last_old_price + "', last_price='" + last_price + "' where producer_id=" + producer_id.ToString() ;
        string connectionStr1 = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionStr1);

        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            this.lblStatus.Text = "update successfully";
        }
        catch
        {
            this.lblStatus.Text = "Error updating record";
        }
        finally
        {
            conn.Close();
        }        

        
    }
    protected void Command1_Click(object sender, EventArgs e)
    {
        int producer_id;
        int.TryParse(this.lblId.Text, out producer_id);
        
        
        string sql = "update producer set is_sell ='yes', date_of_end_bazaar=getdate() where producer_id=" + producer_id.ToString();
        string connectionStr1 = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionStr1);

        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            this.Label4.Text = "ended successfully";
        }
        catch
        {
                        this.Label4.Text = "ended error plz write corect date by month/day/year";
        }
        finally
        {
            conn.Close();
        }        

    }
   

    protected void Command2_Click(object sender, EventArgs e)
    {
        string connectionStr1 = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionStr1);



        SqlCommand insert = new SqlCommand("insert into producer (producer_id,producer,quality_of_5,first_price,last_old_price,last_price) values(@producer_id,@producer,@quality_of_5,@first_price,@last_old_price,@last_price)", conn);
        insert.Parameters.AddWithValue("@producer_id", TextBox7.Text);
        insert.Parameters.AddWithValue("@producer", TextBox8.Text);
        insert.Parameters.AddWithValue("@quality_of_5", TextBox9.Text);
        insert.Parameters.AddWithValue("@first_price", TextBox11.Text);
        insert.Parameters.AddWithValue("@last_old_price", TextBox12.Text);
        insert.Parameters.AddWithValue("@last_price", TextBox13.Text);
        
        

        try
        {
            conn.Open();
            insert.ExecuteNonQuery();
            this.Label22.Text = "inserted successfully";
        }
        catch
        {

            this.Label22.Text = "Error when saving on database";
            conn.Close();
        }
        TextBox7.Text = "";
        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox11.Text = "";
        TextBox12.Text = "";
        TextBox13.Text = "";
     
        
       
    }



    protected void Command3_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_page.aspx");
    }



    protected void Command4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
    <mobile:form id="form1" runat="server">&nbsp;<br />&nbsp; ---------------------------------------<br /><mobile:Label ID="Label13" Runat="server">preduce id</mobile:Label> <mobile:TextBox
        ID="TextBox7" Runat="server">
    </mobile:TextBox> <mobile:Label ID="Label14" Runat="server">preduce name</mobile:Label> <mobile:TextBox
        ID="TextBox8" Runat="server">
    </mobile:TextBox> <mobile:Label ID="Label15" Runat="server">quality of 5</mobile:Label> <mobile:TextBox
        ID="TextBox9" Runat="server">
    </mobile:TextBox><mobile:Label ID="Label17" Runat="server">first price</mobile:Label> <mobile:TextBox
        ID="TextBox11" Runat="server">
    </mobile:TextBox> <mobile:Label ID="Label18" Runat="server">last old price</mobile:Label> <mobile:TextBox
        ID="TextBox12" Runat="server">
    </mobile:TextBox> <mobile:Label ID="Label19" Runat="server">last price</mobile:Label> <mobile:TextBox
        ID="TextBox13" Runat="server">
    </mobile:TextBox>------------------------------------------<br /><mobile:Label ID="Label22"
        Runat="server">.</mobile:Label><mobile:Command ID="Command2" Runat="server" OnClick="Command2_Click">add</mobile:Command><br /><mobile:Command
            ID="Command3" Runat="server" OnClick="Command3_Click">back</mobile:Command><br />------------------------------------------<br /><br /><br />&nbsp;</mobile:form>
    
    <mobile:Form ID="Form2" Runat="server"><mobile:Label ID="Label5" Runat="server">produces in bazaar and not finsh</mobile:Label><br /><mobile:Label ID="Label1" Runat="server">click on any produce to update</mobile:Label> <mobile:ObjectList ID="datebaselist" Runat="server" CommandStyle-StyleReference="subcommand" LabelStyle-StyleReference="title" OnItemCommand="datebaselist_ItemCommand">
            <Command Name="btnUpdate" Text="Update price" />
              <Command Name="btnend" Text="end bazaar" />
            <Command Name="btnDelete" Text="" />
        </mobile:ObjectList><br />----------------------------------------------<br /><mobile:Label ID="Label2" Runat="server">produces that ended bazaar</mobile:Label><mobile:ObjectList ID="ObjectList1" Runat="server" CommandStyle-StyleReference="subcommand" LabelStyle-StyleReference="title" OnItemCommand="datebaselist_ItemCommand">
      
        <Command Name="btnDelete" Text="" />
    </mobile:ObjectList><br /><mobile:Command ID="btnReturn" Runat="server" OnClick="btnReturn_Click">add produce</mobile:Command><br /><mobile:Command
            ID="Command4" Runat="server" OnClick="Command4_Click">home page</mobile:Command></mobile:Form>
    <mobile:Form ID="Form3" Runat="server" Title="Update"><mobile:Label ID="lblUpdate" Runat="server">ID=</mobile:Label> <mobile:Label ID="lblId" Runat="server"></mobile:Label>&nbsp; --------------------------------------<br />&nbsp;<mobile:Label
                ID="Label25" Runat="server">preduce name</mobile:Label><br /><mobile:TextBox ID="TextBox16"
                    Runat="server">
                </mobile:TextBox> <mobile:Label ID="Label26" Runat="server">quality of 5</mobile:Label> <mobile:TextBox
                    ID="TextBox17" Runat="server">
                </mobile:TextBox><mobile:Label ID="Label28" Runat="server">first price</mobile:Label> <mobile:TextBox
                    ID="TextBox19" Runat="server">
                </mobile:TextBox> <mobile:Label ID="Label29" Runat="server">last old price</mobile:Label> <mobile:TextBox
                    ID="TextBox20" Runat="server">
                </mobile:TextBox> <mobile:Label ID="Label30" Runat="server">last price</mobile:Label> <mobile:TextBox
                    ID="TextBox21" Runat="server">
                </mobile:TextBox>--------------------------------<br /><mobile:Label ID="lblStatus" Runat="server"></mobile:Label><br /><mobile:Command ID="btnChange" Runat="server" BreakAfter="false" OnClick="btnChange_Click">Update</mobile:Command><br />&nbsp;<br /><mobile:Command ID="btnHome" Runat="server" BreakAfter="true" OnClick="btnHome_Click">back</mobile:Command></mobile:Form>
    <mobile:Form ID="Form4" Runat="server">&nbsp; ---------------------------------<br /><mobile:Label ID="Label4" Runat="server">
        </mobile:Label> <mobile:Command
                    ID="Command1" Runat="server" OnClick="Command1_Click">end bazaar for this preduce</mobile:Command><br /><mobile:Command ID="Command5" Runat="server" BreakAfter="true" OnClick="btnHome_Click">back</mobile:Command></mobile:Form>
</body>
</html>
