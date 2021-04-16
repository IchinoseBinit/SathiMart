using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Forms
{
    public class Global_Connection
    {
        public SqlConnection cn;
        public Global_Connection()
        {
            string sqlcon = System.Configuration.ConfigurationManager.AppSettings.Get("MyConnection").ToString();
            cn = new SqlConnection(sqlcon);
            cn.Open();
        }
      
    }
}