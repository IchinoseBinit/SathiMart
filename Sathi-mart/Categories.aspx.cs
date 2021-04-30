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
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }


        protected void FillGridView()
        {

            categoryGridView.DataSource = new Category().SelectRecords();
            categoryGridView.DataBind();
        }

        public void clearFields()
        {
            txtCategoryName.Text = "";
        }

        protected void categoryGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Global_Connection gc = new Global_Connection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = gc.cn;
            string index = Convert.ToString(e.CommandArgument);
            string strData = "Select * From category Where categoryId='" + index + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "category");
            DataTable dt = ds.Tables[0];
            //.Text = dt.Rows[0]["mid"].ToString();
            txtCategoryName.Text = dt.Rows[0]["categoryName"].ToString();
            lblId.Text = dt.Rows[0]["categoryId"].ToString();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var name = txtCategoryName.Text;

            Category customer = new Category();
            customer.AddCategory(name);
            clearFields();
            FillGridView();
            //lblMessage.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var name = txtCategoryName.Text;
            var categoryId = lblId.Text;

            Category category = new Category();
            category.updateCategory(categoryId, name);
            FillGridView();

            Page_Load(sender, e);
        }


        //    protected void Button1_Click(object sender, EventArgs e)
        //    {
        //        /*var mid = lblId.Text;
        //        Customers customers = new Customers();
        //        customers.deleteCustomer(mid);
        //        clearFields();

        //        FillGridView();*/

        //    }

        //    protected void btnUpdate_Click(object sender, EventArgs e)
        //    {
        //        var name = txtCustomerName.Text;
        //        var address = txtCustomerAddress.Text;
        //        var email = txtEmail.Text;
        //        var phone = txtPhone.Text;
        //        var memberType = cmboMember.SelectedValue;
        //        var mid = lblId.Text;

        //        Customers customers = new Customers();
        //        customers.updateCustomer(mid, name, address, phone, email, memberType);
        //        FillGridView();

        //        Page_Load(sender, e);
        //    }
        //}
    }
}