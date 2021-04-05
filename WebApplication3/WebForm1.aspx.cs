using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var name = txtName.Text;
            var address = txtAddress.Text;
            var email = txtEmail.Text;
            var phone = txtPhone.Text;
            var memberType = dropDownMember.SelectedValue;

            Customer customer = new Customer();
            customer.AddCustomer(name, address, email, phone, memberType);
            lblMessage.Visible = true;
        }
    }
}