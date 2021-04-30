using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class MakeSale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSale_Click(object sender, EventArgs e)
        {
            Session["itemId"] = int.Parse(txtItemId.Text);
            Session["itemQuantity"] = int.Parse(txtQuantity.Text);

            Response.Redirect("Bills.aspx");
        }
    }
}