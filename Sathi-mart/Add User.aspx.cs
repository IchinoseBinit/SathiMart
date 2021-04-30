using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class Add_User : System.Web.UI.Page
    {
        List<string> usernameList = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }
        private void ClearFields()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtEmail.Text = "";
            checkIsAdmin.Checked = false;
        }

        protected void FillGridView()
        {
            txtPassword.Attributes["type"] = "password";
            userGridView.DataSource = new UserLogin().SelectUser();
            userGridView.DataBind();
            DataTable dt = new UserLogin().SelectUser();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                usernameList.Add(dt.Rows[i]["username"].ToString());
            }
        }


        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            lblError.Visible = true;

            foreach (var user in usernameList) 
            {
                if(user == txtUsername.Text.Trim())
                {
                    lblError.Text = "Username already exists";
                    return;
                }
            }
                lblError.Visible = true;

                var username = txtUsername.Text;
                var password = txtPassword.Text;
                var email = txtEmail.Text;
                var isAdmin = checkIsAdmin.Checked;

                UserLogin userLogin = new UserLogin();
                lblError.Text = userLogin.AddUser(username, password, email, isAdmin.ToString());
                if (lblError.Text.Length == 0)
                {
                    ClearFields();
                    Response.Redirect("Login.aspx");
                }

            
        }

        protected void userGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            Global_Connection gc = new Global_Connection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = gc.cn;
            string index = Convert.ToString(e.CommandArgument);
            string strData = "Select * From credential Where id='" + index + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "credential");
            DataTable dt = ds.Tables[0];
            //.Text = dt.Rows[0]["mid"].ToString();
            txtUsername.Text = dt.Rows[0]["username"].ToString();
            txtEmail.Text = dt.Rows[0]["email"].ToString();
            txtPassword.Text = dt.Rows[0]["password"].ToString();
            checkIsAdmin.Checked = bool.Parse(dt.Rows[0]["isAdmin"].ToString());
            lblId.Text = dt.Rows[0]["id"].ToString();
            btnAddUser.Visible = false;
            btnUpdate.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblError.Visible = true;
            foreach (var user in usernameList)
            {
                if (user == txtUsername.Text.Trim())
                {
                    lblError.Text = "Username already exists";
                    return;
                }
            }
            var username = txtUsername.Text;
            var password = txtPassword.Text;
            var email = txtEmail.Text;
            var isAdmin = checkIsAdmin.Checked;
            var id = lblId.Text;

            UserLogin userLogin = new UserLogin();
            lblError.Text = userLogin.UpdateUser(id, username, password, email, isAdmin.ToString());
            if (lblError.Text.Length > 0)
            {
                lblError.Visible = true;
            }
            FillGridView();
            ClearFields();
            btnAddUser.Visible = true;
            btnUpdate.Visible = false;
        }
    }
}