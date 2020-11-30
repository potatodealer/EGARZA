using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["user_id"] = null;
        Session["user_name"] = null;
        Session["user_email"] = null;
    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text;
        string password = txtPassword.Text;
        string[] result = db_SQLServer.ExecuteSPWithParameters("PRO_LOGIN",
          new string[] { "@in_EMAIL", "@in_PASSWORD" },
          new string[] { email, password },
          new string[] { "@out_MESSAGE", "@out_USER_ID", "@out_USER_NAME", "@out_USER_EMAIL" });
        if (result[0] == "OK")
        {
            Session["user_id"] = result[1];
            Session["user_name"] = result[2];
            Session["user_email"] = result[3];
            Response.Redirect("Dash.aspx");
        }
        else
        {
            lblMessage.Text = result[0];
        }
    }
}