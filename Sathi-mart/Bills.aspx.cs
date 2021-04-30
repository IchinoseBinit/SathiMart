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
    public partial class Bills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int itemId = int.Parse(Session["itemId"].ToString());
            int qty = int.Parse(Session["itemQuantity"].ToString());

            try
            {
                Sale s = new Sale();
                DataTable dt = s.getSalesById(itemId);
                int quantity = int.Parse(dt.Rows[0]["quantity"].ToString());
                if (quantity >= qty)
                {

                    string name = dt.Rows[0]["name"].ToString();
                    string description = dt.Rows[0]["description"].ToString();
                    double price = double.Parse(dt.Rows[0]["price"].ToString());
                    int category = int.Parse(dt.Rows[0]["category"].ToString());
                    string categoryName = s.getCategoryNameById(category);

                    double totalPrice = price * qty;

                    txtItemName.Text = name;
                    txtDescription.Text = description;
                    txtUnitPrice.Text = price.ToString();
                    txtQuantity.Text = qty.ToString();
                    txtTotalPrice.Text = totalPrice.ToString();

                    txtCategory.Text = categoryName;
                    if(!Page.IsPostBack)
                    {

                        cmboCustomer.DataSource = new Customers().SelectRecords();
                        cmboCustomer.DataTextField = "name";
                        cmboCustomer.DataValueField = "mid";
                        cmboCustomer.DataBind();
                    }

                }
                else
                {
                    lblMessage.Text = "We do not have that many items in stock";
                    lblMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
                lblMessage.Visible = true;
            }

        }
            

        

        protected void btnSale_Click(object sender, EventArgs e)
        {
            int itemId = int.Parse(Session["itemId"].ToString());
            int staffId = int.Parse(Session["staffId"].ToString());
            int customerId = int.Parse(cmboCustomer.SelectedValue);
            double totalAmount = double.Parse(txtTotalPrice.Text);
            int quantity = int.Parse(txtQuantity.Text);
            lblMessage.Text = ( new Sale().AddSale(totalAmount, customerId, staffId, itemId, quantity));
            lblMessage.Visible = true;
        }
    }

    /*Session["Iid"] = int.Parse(Txt_ItemId.Text);
    Session["qty"] = int.Parse(Txt_Qty.Text);

    Response.Redirect("bill.aspx");*/
}