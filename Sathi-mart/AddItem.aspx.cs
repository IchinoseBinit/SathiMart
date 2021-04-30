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
    public partial class AddItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                FillDropDowns();

            }
            FillGridView();
        }


        protected void FillGridView()
        {
            itemGridView.DataSource = new Item().SelectRecords();
            itemGridView.DataBind();
        }

        private void FillDropDowns()
        {
            FillCategoryDropDown();
            FillSupplierDropDown();
        }

        protected void FillCategoryDropDown()
        {
            cmboCategory.DataSource = new Item().FetchCategories();
            cmboCategory.DataTextField = "categoryName";
            cmboCategory.DataValueField = "categoryId";
            cmboCategory.DataBind();
        }

        protected void FillSupplierDropDown()
        {
            cmboSupplier.DataSource = new Item().FetchSuppliers();
            cmboSupplier.DataTextField = "supplierName";
            cmboSupplier.DataValueField = "supplierId";
            cmboSupplier.DataBind();
        }

        protected void ClearFields()
        {
            txtItemName.Text = "";
            txtDescription.Text = "";
            txtItemQty.Text = "";
            txtItemPrice.Text = "";
            txtPurchaseDate.Text = "";
            cmboCategory.SelectedIndex = 0;
            cmboSupplier.SelectedIndex = 0;
        }

        protected void itemGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            Global_Connection gc = new Global_Connection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = gc.cn;
            string index = Convert.ToString(e.CommandArgument);
            string strData = "Select * From item Where itemId='" + index + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "item");
            DataTable dt = ds.Tables[0];
            //.Text = dt.Rows[0]["mid"].ToString();
            txtItemName.Text = dt.Rows[0]["name"].ToString();
            txtDescription.Text = dt.Rows[0]["description"].ToString();
            txtItemPrice.Text = dt.Rows[0]["price"].ToString();
            txtItemQty.Text = dt.Rows[0]["quantity"].ToString();
            txtPurchaseDate.Text = dt.Rows[0]["purchaseDate"].ToString();
            cmboCategory.SelectedValue = dt.Rows[0]["category"].ToString();
            cmboSupplier.SelectedValue = dt.Rows[0]["supplier"].ToString();
            lblId.Text = dt.Rows[0]["itemId"].ToString();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                var name = txtItemName.Text;
                var description = txtDescription.Text;
                int quantity = int.Parse(txtItemQty.Text);
                float price = float.Parse(txtItemPrice.Text);
                var purchaseDate = txtPurchaseDate.Text;
                var categoryId = int.Parse(cmboCategory.SelectedValue);
                var supplierId = int.Parse(cmboSupplier.SelectedValue);

                Item item = new Item();
                lblMessage.Text += item.addItem(name, description, quantity, price, purchaseDate, categoryId, supplierId);
                ClearFields();
                FillGridView();
            }
            catch (Exception ex)
            {
                lblMessage.Text += ex.Message;
            }
            lblMessage.Visible = true;
            



        }
    }
}