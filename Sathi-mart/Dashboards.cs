using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Sathi_mart
{
    public class Dashboards
    {
        Global_Connection gc = new Global_Connection();

        public DataTable SelectItemLessThanTen(string sortOption, string sortBy)
        {
            string strData = "Select * From item Where quantity<=10 order by " + sortOption + " " + sortBy;
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "credential");
            return ds.Tables[0];
        }

        public string CountStockLongTime()
        {
            string strData = "SELECT count(*) as itemCount from item WHERE purchaseDate < DATEADD(day, -90, GETDATE())";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "item");
            return ds.Tables[0].Rows[0]["itemCount"].ToString();
        }

        public DataTable ShowStockLongTime()
        {
            string strData = "SELECT * from item WHERE purchaseDate < DATEADD(day, -90, GETDATE())";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "item");
            return ds.Tables[0];
        }

        public string DeleteById(string id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Delete from item where itemId=@id", gc.cn);
                cmd.Parameters.AddWithValue("@id", id);
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

        public string DeleteAll()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Delete from item WHERE purchaseDate < DATEADD(day, -90, GETDATE())", gc.cn);
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

        public string CountInactiveCustomer()
        {
            string strData = "select count(name) as customerCount from customer where mid not in (select customerId from sales where dateTime < DATEADD(day, 31, GETDATE()) )";
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "customer");
            return ds.Tables[0].Rows[0]["customerCount"].ToString();
        }

        public DataTable InactiveCustomer()
        {
            string strData = "select * from customer where mid not in (select customerId from sales where dateTime < DATEADD(day, 31, GETDATE()) )";
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "customer");
            return ds.Tables[0];
        }


        public string CountInactiveItem()
        {
            string strData = "select count(name) as itemCount from item where itemId not in (select itemId from sales where dateTime<DATEADD(day, 31 , GETDATE()) )";
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "item");
            return ds.Tables[0].Rows[0]["itemCount"].ToString();
        }

        public DataTable InactiveItem()
        {
            string strData = "select * from item where itemId not in (select itemId from sales where dateTime<DATEADD(day, 31 , GETDATE()) )";
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "item");
            return ds.Tables[0];
        }

        public string CountTotalUser()
        {
            string strData = "select count(name) as customerCount from customer";
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "customer");
            return ds.Tables[0].Rows[0]["customerCount"].ToString();
        }

        public string CountTotalStaff()
        {
            string strData = "select count(*) as staffCount from credential";
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "credential");
            return ds.Tables[0].Rows[0]["staffCount"].ToString();
        }

        public string CountUserByType(string type)
        {
            string strData = "select count(name) as customerCount from customer where memberType='" + type + "' ";
            //cmd.Parameters.AddWithValue("@username", Mem_type);
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "customer");
            return ds.Tables[0].Rows[0]["customerCount"].ToString();
        }


    }
}