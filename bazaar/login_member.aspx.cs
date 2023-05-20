using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.Mobile;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.MobileControls;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class loginmanager : System.Web.UI.MobileControls.MobilePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["S_id1"] = 0;
        Session["member"] = 0;
    }
    protected void Form1_Activate(object sender, EventArgs e)
    {
        
       
        Label2.Text = "";
    }
    protected void Command1_Click(object sender, EventArgs e)
    {
        string a;
        string b;
        a = TextBox1.Text;
        b = TextBox2.Text;
        if (a == "manager" & b == "manager")
        {
            Session["admin"] = 1;
            Response.Redirect("admin_page.aspx");
        }
        else Label2.Text = "Invalid User Name or Password";
    
  
    }
}
