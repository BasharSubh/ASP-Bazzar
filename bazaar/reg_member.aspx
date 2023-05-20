<%@ Page Language="C#" Inherits="System.Web.UI.MobileControls.MobilePage" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void Command1_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            string connectionStr1 = WebConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionStr1);



            SqlCommand insert = new SqlCommand("insert into login (username,password) values(@username,@password)", conn);
            insert.Parameters.AddWithValue("@username", TextBox1.Text);
            insert.Parameters.AddWithValue("@password", TextBox2.Text);



            try
            {
                conn.Open();
                insert.ExecuteNonQuery();
                this.Label4.Text = "registry successfully, click on Login to start";
                this.Label1.Text = "«·œŒÊ· ··„‰ ”»Ì‰";
                this.Label2.Visible = false;
                this.Label3.Visible = false;
                this.Label4.Visible = false;
                this.Command2.Visible = true;
                this.Command1.Visible = false;
                this.TextBox1.Visible = false;
                this.TextBox2.Visible = false;


            }
            catch
            {

                this.Label4.Text = "Error when registry, the username is token try another one";
                conn.Close();
            }
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }

    protected void Command2_Click(object sender, EventArgs e)
    {

        Response.Redirect("show_producer_member.aspx");
    }


    protected void Command3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
    <mobile:form id="form1" runat="server">&nbsp;<mobile:Label ID="Label1" Runat="server" BackColor="#C0FFFF" Font-Size="Large"> ”ÃÌ· „” Œœ„ ÃœÌœ</mobile:Label> <mobile:Command ID="Command2" Runat="server" OnClick="Command2_Click" Visible="False">login to member page</mobile:Command><br /><mobile:Label ID="Label2" Runat="server" BackColor="White">«”„ «·„” Œœ„</mobile:Label> <mobile:TextBox ID="TextBox1" Runat="server">
        </mobile:TextBox> <br /><mobile:Label ID="Label3" Runat="server">ﬂ·„… «·„—Ê— </mobile:Label><br /><mobile:TextBox ID="TextBox2" Runat="server" Password="True" BackColor="Gainsboro">
        </mobile:TextBox> <mobile:Label ID="Label4" Runat="server">
        </mobile:Label> <mobile:RequiredFieldValidator Runat="server" id="RequiredFieldValidator1"
            ControlToValidate="TextBox1" 
           
            ErrorMessage="The input box cannot be empty.">
                ·« ÌÃ»  —ﬂ Õﬁ· «·«”„ ›«—€
        </mobile:RequiredFieldValidator><mobile:RequiredFieldValidator ID="RequiredFieldValidator2" Runat="server" 
        ControlToValidate="TextBox2" 
           
            ErrorMessage="The input box cannot be empty.">
                ·« ÌÃ»  —ﬂ Õﬁ· ﬂ·„… «·„—Ê— ›«—€
        </mobile:RequiredFieldValidator><br /><mobile:Command ID="Command1" Runat="server" OnClick="Command1_Click">«· ”ÃÌ·</mobile:Command><mobile:Command
            ID="Command3" Runat="server" OnClick="Command3_Click">home</mobile:Command><br /></mobile:form>
</body>
</html>
