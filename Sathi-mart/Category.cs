

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Sathi_mart
{
    public class Category
    {
        /*SqlCommand cmd = new SqlCommand();*/
        Global_Connection gc = new Global_Connection();

        public void AddCategory(string name)
        {
            SqlCommand cmd = new SqlCommand("Insert into category(categoryName) values (@name)", gc.cn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }

        public DataTable SelectRecords()
        {
            string sql = "SELECT * FROM category";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "category");
            return ds.Tables[0];
        }

        public void updateCategory(string categoryId, string name)
        {
            SqlCommand cmd = new SqlCommand("Update category set categoryName=@name where categoryId=@categoryId", gc.cn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@categoryId", categoryId);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }

        public void deleteCategory(string categoryId)
        {
            SqlCommand cmd = new SqlCommand("Delete from category where categoryId=@categoryId", gc.cn);
            cmd.Parameters.AddWithValue("@categoryId", categoryId);
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();
            // lbl_Msg.Text = "Data Inserted";        
        }





    }
}
