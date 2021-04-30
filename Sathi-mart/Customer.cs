using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public class Customers
    {
        /*SqlCommand cmd = new SqlCommand();*/
        Global_Connection gc = new Global_Connection();

        public void AddCustomer(string Name, string Address, string Phone, string Email, string Mem_type)
        {
            SqlCommand cmd = new SqlCommand("Insert into customer(name,address,phone,email,memberType) values (@name,@address,@phone,@email,@member_type)", gc.cn);
            cmd.Parameters.AddWithValue("@name", Name);
            cmd.Parameters.AddWithValue("@address", Address);
            cmd.Parameters.AddWithValue("@phone", Phone);
            cmd.Parameters.AddWithValue("@email", Email);
            cmd.Parameters.AddWithValue("@memberType", Mem_type);
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }

        public DataTable SelectRecords()
        {
            string sql = "SELECT * FROM customer";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "customer");
            return ds.Tables[0];
        }

        //public DataTable FetchCustomerForDropDown()
        //{

        //    string sql = "SELECT * FROM customer";
        //    SqlDataAdapter adpt = new SqlDataAdapter(sql, gc.cn);
        //    DataTable dt = new DataTable();
        //    adpt.Fill(dt);
        //    return dt;
        //}

        public void updateCustomer(string mid, string Name, string Address, string Phone, string Email, string Mem_type)
        {
            SqlCommand cmd = new SqlCommand("Update customer set name=@name, address=@address, phone=@phone, email=@email ,memberType=@memberType where mid=@mid", gc.cn);
            cmd.Parameters.AddWithValue("@name", Name);
            cmd.Parameters.AddWithValue("@address", Address);
            cmd.Parameters.AddWithValue("@phone", Phone);
            cmd.Parameters.AddWithValue("@email", Email);
            cmd.Parameters.AddWithValue("@memberType", Mem_type);
            cmd.Parameters.AddWithValue("@mid", mid);
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }

        public void deleteCustomer(string mid)
        {
            SqlCommand cmd = new SqlCommand("Delete from customer where mid=@mid", gc.cn);
            cmd.Parameters.AddWithValue("@mid", mid);
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }





    }
}