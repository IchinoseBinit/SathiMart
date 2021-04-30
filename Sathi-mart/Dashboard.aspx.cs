using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class DashboardModel : System.Web.UI.Page
    {
        Dashboards dashboard;
        protected void Page_Load(object sender, EventArgs e)
        {
            dashboard = new Dashboards();
            lblUnsoldGoodsCount.Text = dashboard.CountStockLongTime();
            lblInactiveUserCount.Text = dashboard.CountInactiveCustomer();
            lblInactiveItemCount.Text = dashboard.CountInactiveItem();
            lblTotalUserCount.Text = dashboard.CountTotalUser();
            if (Session["staffType"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                var isAdmin = bool.Parse(Session["staffType"].ToString());
                if (!isAdmin)
                {
                    pnlManageStaff.Visible = false;
                }
                else
                {
                    lblStaffCount.Text = dashboard.CountTotalStaff();
                }
                var sortOption = cmboSortOptions.SelectedValue;
                var sortBy = radioSortBy.SelectedValue;
                FillGridView(sortOption, sortBy);
            }
            
        }

        public void FillGridView(string sortOption, string sortBy)
        {
            
            itemLessThanTenGridView.DataSource = dashboard.SelectItemLessThanTen(sortOption, sortBy);
            itemLessThanTenGridView.DataBind();
        }

        protected void btnSort_Click(object sender, EventArgs e)
        {
            var sortOption = cmboSortOptions.SelectedValue;
            var sortBy = radioSortBy.SelectedValue;
            FillGridView(sortOption, sortBy);
        }


    }
}