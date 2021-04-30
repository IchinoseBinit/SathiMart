using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Visible = true;

                UserLogin u = new UserLogin();
                /*lblError.Text = u.CheckUser(txtUsername.Text, txtPassword.Text);*/
                DataTable dt = u.CheckUser(txtUsername.Text, txtPassword.Text);

                if (dt.Rows.Count > 0)
                {
                    string username = dt.Rows[0]["username"].ToString();
                    string password = dt.Rows[0]["password"].ToString();
                    int staffId = int.Parse(dt.Rows[0]["id"].ToString());
                    string staffType = dt.Rows[0]["isAdmin"].ToString();

                    if (username.Equals(txtUsername.Text) && password.Equals(txtPassword.Text))
                    {
                        Session["staffId"] = staffId;
                        Session["staffUsername"] = username;
                        Session["staffType"] = staffType;
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        lblError.Text = "Incorrect password";

                    }
                }
                else
                {
                    lblError.Text = "Your Username does not exists";

                }

            }
            catch (Exception ex)
            {

                lblError.Text = ex.Message;
            }
        }
    }
}