using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class StockForLongTime : System.Web.UI.Page
    {
        Dashboards dashboards = new Dashboards();
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }

        protected void FillGridView()
        {
            noStockGridView.DataSource = new Dashboards().ShowStockLongTime();
            noStockGridView.DataBind();
        }

        protected void noStockGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            lblSuccess.Visible = false;
            lblError.Visible = false;
            string index = Convert.ToString(e.CommandArgument);
            var message = dashboards.DeleteById(index);
            if (message.Length == 0)
            {
                lblSuccess.Text = "Successfully deleted";
                FillGridView();
                lblSuccess.Visible = true;
            }
            else
            {
                lblError.Text = message;
                lblError.Visible = true;
            }
        }

        protected void btnDeleteAll_Click(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            lblError.Visible = false;
            var message = dashboards.DeleteAll();
            if (message.Length == 0)
            {
                lblSuccess.Text = "Successfully deleted all items";
                FillGridView();
                lblSuccess.Visible = true;
            }
            else
            {
                lblError.Text = message;
                lblError.Visible = true;
            }
        }
    }
}