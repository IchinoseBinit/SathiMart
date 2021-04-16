using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Forms
{
    public class Customers
    {
        SqlCommand cmd = new SqlCommand();
        Global_Connection gc = new Global_Connection();

        public void AddCustomer(string Name, string Address, string Phone, string Email, string Mem_type)
        {
            SqlCommand cmd = new SqlCommand("Insert into tbl_customer(name,address,phone,email,member_type) values (@name,@address,@phone,@email,@member_type)", gc.cn);
            cmd.Parameters.AddWithValue("@name", Name);
            cmd.Parameters.AddWithValue("@address", Address);
            cmd.Parameters.AddWithValue("@phone", Phone);
            cmd.Parameters.AddWithValue("@email", Email);
            cmd.Parameters.AddWithValue("@member_type", Mem_type);
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }

        public DataTable SelectRecords()
        {
            string sql = "SELECT * FROM tbl_customer";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "tbl_customer");
            return ds.Tables[0];
        }



    }
}