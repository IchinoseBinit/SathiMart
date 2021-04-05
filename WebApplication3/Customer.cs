using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication3
{
    public class Customer
    {
       /* SqlCommand cmd = new SqlCommand();*/

        GlobalConnection gc = new GlobalConnection();

        public void AddCustomer(string Name, string Address, string Email, string Phone, string MemberType)
        {
            string query = "Insert into customer(name, address, phone, email, member_type) values (@name, @address, @phone, @email, @member_type)";
            SqlCommand cmd = new SqlCommand(query, gc.cn);

            cmd.Parameters.AddWithValue("@name", Name);
            cmd.Parameters.AddWithValue("@address", Address);
            cmd.Parameters.AddWithValue("@phone", Phone);
            cmd.Parameters.AddWithValue("@email", Email);
            cmd.Parameters.AddWithValue("@member_type", MemberType);

            cmd.ExecuteNonQuery();

            gc.cn.Close();


        }
    }
}