using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class ChangePassoword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {

                int id = int.Parse(Session["staffId"].ToString());
                DataTable dt = new UserLogin().SelectUserById(id);
                txtUsername.Text = dt.Rows[0]["username"].ToString();
                txtPassword.Text = dt.Rows[0]["password"].ToString();
                txtEmail.Text = dt.Rows[0]["email"].ToString();
            }
        }

        protected void btnProfileUpdate_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;
            lblSuccess.Visible = false;
            int id = int.Parse(Session["staffId"].ToString());
            var username = txtUsername.Text;
            var password = txtPassword.Text;
            var email = txtEmail.Text;
            
            string message = new UserLogin().UpdateUserByStaff(id.ToString(), username, password, email);
            if (message.Length == 0)
            {
                lblSuccess.Text = "Successfully Updated";
                lblSuccess.Visible = true;
            } else
            {
                lblError.Text = message;
                lblError.Visible = true;
            }

        }
    }
}