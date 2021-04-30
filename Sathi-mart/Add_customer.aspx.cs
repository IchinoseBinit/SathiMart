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
    public partial class Add_customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }


        protected void FillGridView()
        {
            customerGridView.DataSource = new Customers().SelectRecords();
            customerGridView.DataBind();
        }

        public void clearFields()
        {
            txtCustomerName.Text = "";
            txtCustomerAddress.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            cmboMember.SelectedIndex = 0;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void customerGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            Global_Connection gc = new Global_Connection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = gc.cn;
            string index = Convert.ToString(e.CommandArgument);
            string strData = "Select * From customer Where mid='" + index + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "tbl_customer1");
            DataTable dt = ds.Tables[0];
            //.Text = dt.Rows[0]["mid"].ToString();
            txtCustomerName.Text = dt.Rows[0]["name"].ToString();
            txtCustomerAddress.Text = dt.Rows[0]["address"].ToString();
            txtPhone.Text = dt.Rows[0]["phone"].ToString();
            txtEmail.Text = dt.Rows[0]["email"].ToString();
            cmboMember.Text = dt.Rows[0]["memberType"].ToString();
            lblId.Text = dt.Rows[0]["mid"].ToString();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            /*var mid = lblId.Text;
            Customers customers = new Customers();
            customers.deleteCustomer(mid);
            clearFields();

            FillGridView();*/

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var name = txtCustomerName.Text;
            var address = txtCustomerAddress.Text;
            var email = txtEmail.Text;
            var phone = txtPhone.Text;
            var memberType = cmboMember.SelectedValue;

            Customers customer = new Customers();
            customer.AddCustomer(name, address, phone, email, memberType);
            clearFields();
            FillGridView();
            //lblMessage.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var name = txtCustomerName.Text;
            var address = txtCustomerAddress.Text;
            var email = txtEmail.Text;
            var phone = txtPhone.Text;
            var memberType = cmboMember.SelectedValue;
            var mid = lblId.Text;

            Customers customers = new Customers();
            customers.updateCustomer(mid, name, address, phone, email, memberType);
            FillGridView();

        }
    }
}