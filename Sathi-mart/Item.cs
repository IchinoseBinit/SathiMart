using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Sathi_mart
{
    public class Item
    {

        Global_Connection gc = new Global_Connection();

        public DataTable FetchCategories()
        {
            string sql = "SELECT * FROM category";
            SqlDataAdapter adpt = new SqlDataAdapter(sql, gc.cn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            return dt;
        }

        public DataTable FetchSuppliers()
        {
            string sql = "SELECT * FROM supplier";
            SqlDataAdapter adpt = new SqlDataAdapter(sql, gc.cn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            return dt;
        }

        public DataTable SelectRecords()
        {
            string sql = "SELECT * FROM item";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "item");
            return ds.Tables[0];
        }

        public int GetQuantityById(int itemId)
        {
            string strData = "Select quantity From item Where itemId='" + itemId + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "quantity");
            DataTable dt = ds.Tables[0];
            string quantity = dt.Rows[0]["quantity"].ToString();
            return int.Parse(quantity);
        }

        public String UpdateQuantity(int itemId, int newQuantity)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Update item set quantity=@quantity where itemId=@itemId", gc.cn);
                cmd.Parameters.AddWithValue("@quantity", newQuantity);
                cmd.Parameters.AddWithValue("@itemId", itemId);
                //cmd.Parameters.AddWithValue("@username", Mem_type);
                cmd.ExecuteNonQuery();
                //con.Close();
                gc.cn.Close();
                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
           
        }

        public string GetCategoryById(string id)
        {
            int categoryId = int.Parse(id);
            string strData = "Select categoryName From category Where categoryId='" + categoryId + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "category");
            DataTable dt = ds.Tables[0];
            string name = dt.Rows[0]["categoryName"].ToString();
            return name;
        }

        public string GetSupplierById(string id)
        {
            int supplierId = int.Parse(id);
            string strData = "Select supplierName From supplier Where supplierId='" + supplierId + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "category");
            DataTable dt = ds.Tables[0];
            string name = dt.Rows[0]["supplierName"].ToString();
            return name;
        }

        public DataTable GetItemDetail(string type, string input)
        {
            string sql = "select * from item"+
                      " where " + type + " ='" + input + "'";
            SqlDataAdapter da = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "item");
            return ds.Tables[0];

        }

        public DataTable GetSaleDetail(string type, string input)
        {
                string sql = "select invoiceNumber, customer.name as customerName, customer.mid as customerId, credential.userName as staffName, item.name as itemName, totalAmount, dateTime, sales.quantity from sales" +
                          " join customer on customer.mid = sales.customerId" +
                          " join item on item.itemId = sales.itemId" +
                          " join credential on credential.id = sales.staffId" +
                          " where dateTime<DATEADD(day, 31 , GETDATE()) and customer."+type+" ='"+ input + "'";
                SqlDataAdapter da = new SqlDataAdapter(sql, gc.cn);
                DataSet ds = new DataSet();
                da.Fill(ds, "item");
                return ds.Tables[0];
            /*}
            catch (Exception ex)
            {
                return new DataTable();
            }*/
            
        }

        


        public String addItem(String name, String description, int quantity, float price, string purchaseDate, int categoryId, int supplierId)
        {
            try{
                SqlCommand cmd = new SqlCommand("Insert into item(name, description, price, quantity, purchaseDate, category, supplier) values (@name, @description, @price ,@quantity, @purchaseDate, @category, @supplier)", gc.cn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@purchaseDate", purchaseDate);
                cmd.Parameters.AddWithValue("@category", categoryId);
                cmd.Parameters.AddWithValue("@supplier", supplierId);
                //cmd.Parameters.AddWithValue("@username", Mem_type);
                cmd.ExecuteNonQuery();
                //con.Close();
                gc.cn.Close();
                return "Data Inserted";

            }
            catch (Exception ex)
            {
                return ex.Message;

            }
        }

        public void UpdateItem(string id, string name, string description, int quantity, float price, string purchaseDate, int categoryId, int supplierId)
        {
            SqlCommand cmd = new SqlCommand("Update item set name=@name, description=@description, price=@price, quantity=@quantity ,purchaseDate=@purchaseDate, category=@category, supplier=@supplier where itemId=@id", gc.cn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@purchaseDate", purchaseDate);

            cmd.Parameters.AddWithValue("@category", categoryId);
            cmd.Parameters.AddWithValue("@supplier", supplierId);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            //con.Close();
            gc.cn.Close();      
        }

        public void DeleteItem(string id)
        {
                SqlCommand cmd = new SqlCommand("Delete from item where itemId=@id", gc.cn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                //con.Close();
                gc.cn.Close(); 
        }

    }
}