using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class InactiveCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }

        protected void FillGridView()
        {
            inactiveCustomerGridView.DataSource = new Dashboards().InactiveCustomer();
            inactiveCustomerGridView.DataBind();
        }
    }
}