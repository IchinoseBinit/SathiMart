using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Sathi_mart
{
    public class Supplier
    {
        Global_Connection gc = new Global_Connection();

        public void AddSupplier(string name, String email, String phone, String address)
        {
            SqlCommand cmd = new SqlCommand("Insert into supplier(supplierName, email, phone, address) values (@name, @email, @phone, @address)", gc.cn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }

        public DataTable SelectRecords()
        {
            string sql = "SELECT * FROM supplier";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "supplier");
            return ds.Tables[0];
        }

        public void updateSupplier(string supplierId, string name, String email, String phone, String address)
        {
            SqlCommand cmd = new SqlCommand("Update supplier set supplierName=@name, address=@address, phone=@phone, email=@email where supplierId=@supplierId", gc.cn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@supplierId", supplierId);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }

        public void deleteCategory(string supplierId)
        {
            SqlCommand cmd = new SqlCommand("Delete from supplier where supplierId=@supplierId", gc.cn);
            cmd.Parameters.AddWithValue("@supplierId", supplierId);
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }
    }
}