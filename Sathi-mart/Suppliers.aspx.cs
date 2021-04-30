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
    public partial class Suppliers : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }


        protected void FillGridView()
        {
            supplierGridView.DataSource = new Supplier().SelectRecords();
            supplierGridView.DataBind();
        }

        public void clearFields()
        {
            txtSupplierName.Text = "";
            txtAddress.Text = "";
            txtPhoneNumber.Text = "";
            txtSupplierEmail.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void supplierGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            Global_Connection gc = new Global_Connection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = gc.cn;
            string index = Convert.ToString(e.CommandArgument);
            string strData = "Select * From supplier Where supplierId='" + index + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "supplier");
            DataTable dt = ds.Tables[0];
            //.Text = dt.Rows[0]["mid"].ToString();
            txtSupplierName.Text = dt.Rows[0]["supplierName"].ToString();
            txtAddress.Text = dt.Rows[0]["address"].ToString();
            txtPhoneNumber.Text = dt.Rows[0]["phone"].ToString();
            txtSupplierEmail.Text = dt.Rows[0]["email"].ToString();
            lblId.Text = dt.Rows[0]["supplierId"].ToString();
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
            var name = txtSupplierName.Text;
            var address = txtAddress.Text;
            var email = txtSupplierEmail.Text;
            var phone = txtPhoneNumber.Text;

            Supplier supplier = new Supplier();
            supplier.AddSupplier(name, email, phone, address);
            clearFields();
            FillGridView();
            //lblMessage.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var name = txtSupplierName.Text;
            var address = txtAddress.Text;
            var email = txtSupplierEmail.Text;
            var phone = txtPhoneNumber.Text;
            var mid = lblId.Text;

            Supplier supplier = new Supplier();
            supplier.updateSupplier(mid, name, email, phone, address);
            FillGridView();

            Page_Load(sender, e);
        }

        protected void View_Click(object sender, EventArgs e)
        {
            
        }
    }
}