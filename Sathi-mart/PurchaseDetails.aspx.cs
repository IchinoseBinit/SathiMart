using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class PurchaseDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ChangeLabel();
        }

        protected void ChangeLabel()
        {
            var searchType = radioSearchType.SelectedValue;
            lblInput.Text = "Enter your " + searchType;
        }

        protected void radioSearchType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeLabel();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Item item = new Item();
            var searchType = radioSearchType.SelectedValue;
            var input = txtInput.Text;
            if (searchType == "mid" )
                {
                int a;
                bool tryChange = int.TryParse(input, out a);
                if (tryChange)
                {
                    DataTable dt = item.GetSaleDetail(searchType, input);

                    if (dt != null)
                    {
                        purchaseDetailsDataGridView.DataSource = dt;
                        purchaseDetailsDataGridView.DataBind();
                        if (purchaseDetailsDataGridView.Rows.Count == 0)
                        {
                            lblError.Text = "No Customer found with the record";
                            lblError.Visible = true;
                        }
                    }
                    else
                    {
                        lblError.Text = "An Error Occurred";
                        lblError.Visible = true;
                    }
                } else
                {
                    lblError.Text = "Cannot search with id by string value";
                    lblError.Visible = true;
                }

            }
            else
            {
                DataTable dt = item.GetSaleDetail(searchType, input);

                if (dt != null)
                {
                    purchaseDetailsDataGridView.DataSource = dt;
                    purchaseDetailsDataGridView.DataBind();
                    if (purchaseDetailsDataGridView.Rows.Count == 0)
                    {
                        lblError.Text = "No Customer found with the record";
                        lblError.Visible = true;
                    }
                }
                else
                {
                    lblError.Text = "An Error Occurred";
                    lblError.Visible = true;
                }
            }
            
        }

    }
}