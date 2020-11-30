using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Dash : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Convert.ToString(Session["user_id"])))
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    
    protected void UpdateLogin(object sender, EventArgs e)
    {
        string email = Convert.ToString(Session["user_email"]);
        string nEmail = newEmail.Text;
        string pass = currentPass.Text;
        string nPass = newPass.Text;
        string rPass = rePass.Text;
        string[] result = db_SQLServer.ExecuteSPWithParameters("PRO_UPDATE_LOGIN",
          new string[] { "@in_EMAIL", "@in_PASS", "@in_newEMAIL", "@in_newPASS", "@in_rePASS" },
          new string[] { email, pass, nEmail, nPass, rPass },
          new string[] { "@out_MESSAGE", "@out_change" });
        if (result[0] == "OK")
        {
            lblResponse.Text = "LOGIN UPDATED";
            if(result[1] == "PASSWORD")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                    "<script> alert('You changed your password');window.location.href = 'Dash.aspx';</script>", false);
                //Response.Redirect("Dash.aspx");
            }
            else if(result[1] == "EMAIL")
            {
                Session["user_email"] = nEmail;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                    "<script> alert('You changed your email'); window.location.href = 'Dash.aspx';</script>", false);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script",
                    "<script> alert('You changed your password'); window.location.href = 'Dash.aspx';</script>", false);

            }
            
        }
        else
        {
            lblResponse.Text = result[0];
        }
        
    }
    
}
