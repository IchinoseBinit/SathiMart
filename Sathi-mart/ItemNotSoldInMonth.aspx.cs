﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public partial class ItemNotSoldInMonth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }

        protected void FillGridView()
        {
            itemNotSoldInMonth.DataSource = new Dashboards().InactiveItem();
            itemNotSoldInMonth.DataBind();
        }

    }
}