using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staffId"] == null)
            {
                pnlLoginButtons.Visible = false;
                pnlNavigationBar.Visible = false;
                pnlFooter.Visible = false;
            } else
            {
                lblUsername.Text = Session["staffUsername"].ToString();

            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("login.aspx");
        }
    }
}