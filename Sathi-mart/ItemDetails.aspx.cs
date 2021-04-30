using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class ItemDetails : System.Web.UI.Page
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

        protected void btnViewDetails_Click(object sender, EventArgs e)
        {
            Item item = new Item();
            var searchType = radioSearchType.SelectedValue;
            var input = txtInput.Text;
            if (searchType == "itemId")
            {
                int a;
                bool tryChange = int.TryParse(input, out a);
                if (tryChange)
                {
                    DataTable dt = item.GetItemDetail(searchType, input);

                    if (dt != null)
                    {
                        itemDetailsDataGridView.DataSource = dt;
                        itemDetailsDataGridView.DataBind();
                        if (itemDetailsDataGridView.Rows.Count == 0)
                        {
                            lblError.Text = "No Item found with the record";
                            lblError.Visible = true;
                        } else
                        {
                            lblItemId.Visible = false;
                            lblItemName.Visible = false;
                            lblItemPrice.Visible = false;
                            lblItemDescription.Visible = false;
                            lblItemQuantity.Visible = false;
                            lblHead.Visible = false;
                            itemDetailsDataGridView.Visible = true;
                        }
                    }
                    else
                    {
                        lblError.Text = "An Error Occurred";
                        lblError.Visible = true;
                    }
                }
                else
                {
                    lblError.Text = "Cannot search with id by string value";
                    lblError.Visible = true;
                }

            }
            else
            {
                DataTable dt = item.GetItemDetail(searchType, input);

                if (dt != null)
                {
                    itemDetailsDataGridView.DataSource = dt;
                    itemDetailsDataGridView.DataBind();
                    if (itemDetailsDataGridView.Rows.Count == 0)
                    {
                        lblError.Text = "No Item found with the record";
                        lblError.Visible = true;
                    } else
                    {
                        lblItemId.Visible = false;
                        lblItemName.Visible = false;
                        lblItemPrice.Visible = false;
                        lblItemDescription.Visible = false;
                        lblItemQuantity.Visible = false;
                        lblHead.Visible = false;
                        itemDetailsDataGridView.Visible = true;

                    }
                }
                else
                {
                    lblError.Text = "An Error Occurred";
                    lblError.Visible = true;
                }
            }

        }

        protected void btnAvailable_Click(object sender, EventArgs e)
        {
            Item item = new Item();
            var searchType = radioSearchType.SelectedValue;
            var input = txtInput.Text;
            if (searchType == "itemId")
            {
                int a;
                bool tryChange = int.TryParse(input, out a);
                if (tryChange)
                {
                    DataTable dt = item.GetItemDetail(searchType, input);

                    if (dt != null)
                    {
                        lblHead.Text = "Item Availability Details";
                        lblHead.Visible = true;
                        lblItemId.Text = "Id: " + dt.Rows[0]["itemId"].ToString();
                        lblItemName.Text = "Name: " + dt.Rows[0]["name"].ToString();
                        lblItemPrice.Text = "Price: "+dt.Rows[0]["price"].ToString();
                        lblItemDescription.Text = "Description: " + dt.Rows[0]["description"].ToString();
                        int quantity= int.Parse(dt.Rows[0]["quantity"].ToString());
                        if(quantity == 0)
                        {
                            lblItemQuantity.Text = "Available Quantity: Out of stock";
                        } else if(quantity <= 10)
                        {
                            lblItemQuantity.Text = "Available Quantity: Running low on stock";
                        }
                        else
                        {
                            lblItemQuantity.Text = "Available Quantity: "+quantity.ToString();
                        }
                        itemDetailsDataGridView.Visible = false;
                        lblItemId.Visible = true;
                        lblItemName.Visible = true;
                        lblItemPrice.Visible = true;
                        lblItemDescription.Visible = true;
                        lblItemQuantity.Visible = true;
                    }
                    else
                    {
                        lblError.Text = "An Error Occurred";
                        lblError.Visible = true;
                    }
                }
                else
                {
                    lblError.Text = "Cannot search with id by string value";
                    lblError.Visible = true;
                }

            }
            else
            {
                DataTable dt = item.GetItemDetail(searchType, input);

                if (dt != null)
                {
                    lblHead.Text = "Item Availability Details";
                    lblHead.Visible = true;
                    lblItemId.Text = "Id: " + dt.Rows[0]["itemId"].ToString();
                    lblItemName.Text = "Name: " + dt.Rows[0]["name"].ToString();
                    lblItemPrice.Text = "Price: " + dt.Rows[0]["price"].ToString();
                    lblItemDescription.Text = "Description: " + dt.Rows[0]["description"].ToString();
                    int quantity = int.Parse(dt.Rows[0]["quantity"].ToString());
                    if (quantity == 0)
                    {
                        lblItemQuantity.Text = "Available Quantity: Out of stock";
                    }
                    else if (quantity <= 10)
                    {
                        lblItemQuantity.Text = "Available Quantity: Running low on stock";
                    }
                    else
                    {
                        lblItemQuantity.Text = "Available Quantity: " + quantity.ToString();
                    }
                    itemDetailsDataGridView.Visible = false;

                    lblItemId.Visible = true;
                    lblItemName.Visible = true;
                    lblItemPrice.Visible = true;
                    lblItemDescription.Visible = true;
                    lblItemQuantity.Visible = true;
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