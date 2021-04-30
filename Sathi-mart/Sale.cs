using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Sathi_mart
{
    public class Sale
    {
        Global_Connection gc = new Global_Connection();
        public DataTable getSalesById(int itemId)
        {
            //string sql = "SELECT * FROM tbl_item";
            string sql = "SELECT * FROM item where itemId='" + itemId + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "item");
            return ds.Tables[0];
        }

        public String getCategoryNameById(int categoryId)
        {
            //string sql = "SELECT * FROM tbl_item";
            string sql = "SELECT * FROM category where categoryId='" + categoryId + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "category");
            var rows = ds.Tables[0];
            String categoryName = rows.Rows[0]["categoryName"].ToString();
            return categoryName;
        }

        public String AddSale(double totalAmount, int customerId, int staffId, int itemId, int quantity)
        {
            try
            {
                DateTime date = DateTime.Today;
                Global_Connection gc = new Global_Connection();
                SqlCommand cmd = new SqlCommand("Insert into sales(totalAmount, dateTime, customerId, staffId, itemId, quantity) values(@totalAmount, @dateTime, @customerId, @staffId, @itemId, @quantity)", gc.cn);
                // cmd.Parameters.AddWithValue("@category", Category);
                cmd.Parameters.AddWithValue("@totalAmount", totalAmount);
                cmd.Parameters.AddWithValue("@dateTime", date);
                cmd.Parameters.AddWithValue("@customerId", customerId);
                cmd.Parameters.AddWithValue("@staffId", staffId);
                cmd.Parameters.AddWithValue("@itemId", itemId);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.ExecuteNonQuery();
                gc.cn.Close();
                return ChangeQuantity(itemId, quantity);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }          

        }

        public String ChangeQuantity(int itemId, int quantity)
        {
            Item item = new Item();
            int oldQuantity = item.GetQuantityById(itemId);
            int newQuantity = oldQuantity - quantity;
            return item.UpdateQuantity(itemId, newQuantity);
        }
    }
}