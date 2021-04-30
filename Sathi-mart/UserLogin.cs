using Sathi_mart;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;


namespace Sathi_mart
{
    public class UserLogin
    {
        Global_Connection gc = new Global_Connection();
        public dynamic CheckUser(string username, string password)
        {
            try
            {
                string strData = "Select * From credential where username='" + username + "' ";
                SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
                DataSet ds = new DataSet();
                da.Fill(ds, "credential");
                return ds.Tables[0];
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

            /*string sql = "SELECT * FROM user";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "tbl_user");
            return ds.Tables[0];*/
        }

        public DataTable SelectUser()
        {
            string sql = "SELECT * FROM credential";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "credential");
            return ds.Tables[0];
        }


        public string AddUser(string username, string password, string email, string isAdmin)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Insert into credential(userName,password,email,isAdmin) values (@username,@password,@email,@isAdmin)", gc.cn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@isAdmin", isAdmin);
                //cmd.Parameters.AddWithValue("@username", Mem_type);
                cmd.ExecuteNonQuery();
                //con.Close();
                gc.cn.Close();
                // lbl_Msg.Text = "Data Inserted";    

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public string UpdateUser(string id, string username, string password, string email, string isAdmin)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Update credential set username=@username, password=@password, email=@email, isAdmin=@isAdmin where id=@id", gc.cn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@isAdmin", isAdmin);
                cmd.Parameters.AddWithValue("@id", id);
                //cmd.Parameters.AddWithValue("@username", Mem_type);
                cmd.ExecuteNonQuery();
                //con.Close();
                gc.cn.Close();
                // lbl_Msg.Text = "Data Inserted"; 
                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public DataTable SelectUserById(int id)
        {
            string strData = "Select * From credential Where id='" + id + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "credential");
            return ds.Tables[0];
        }


       



        public string UpdateUserByStaff(string id, string username, string password, string email)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("Update credential set username=@username, password=@password, email=@email where id=@id", gc.cn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@id", id);
                //cmd.Parameters.AddWithValue("@username", Mem_type);
                cmd.ExecuteNonQuery();
                //con.Close();
                gc.cn.Close();
                return SendEmail(username, password, email);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        protected string SendEmail(String username, String password, String email)
        {
            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("routine090@gmail.com", "rabisirrocks");
                client.EnableSsl = true;
                MailMessage msgObj = new MailMessage();
                msgObj.To.Add(email);
                msgObj.Subject = "Change Password Information";
                msgObj.Body = "Your login details was changed by the admin, so your new user name and password is " + username + " and "
                    + password + " respectively. You could proceed login with new username and new password. The personal details could be checked through logging in with new login details.";
                msgObj.From = new MailAddress("routine090@gmail.com");
                client.Send(msgObj);
                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}