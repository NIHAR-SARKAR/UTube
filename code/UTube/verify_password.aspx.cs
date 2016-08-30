using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace UTube
{
    public partial class verify_password : System.Web.UI.Page
    {
        string id = "", hash = "", decryptCode = "", encryptCode = ""; 
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                decryptCode = Request.QueryString["xp"].ToString();
                encryptCode = Request.QueryString["rel"].ToString().Replace(" ", "+");
                id = Operations.Decrypt(encryptCode, decryptCode);
                hash = Request.QueryString["aq"].ToString().Replace(" ", "+");
                if (id == "") Response.Redirect("~/register.aspx");
            }
            catch (Exception) { Response.Redirect("~/register.aspx"); }
        }

        protected void VerifyIt_Click(object sender, EventArgs e)
        {
            DataAccessLayer dal = new DataAccessLayer("DBCON");
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCON"].ConnectionString);
            string sql = "Select * from Users where Verified = @verify and usID = @id";
            if (id != "norel")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@verify", SqlDbType.VarChar).Value = VerifyCode.Text;
                cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    cmd.CommandText = "Update Users Set Verified = @verified where usID = '" + id.ToString() + "'";
                    cmd.Parameters.AddWithValue("@verified", 0);
                    dal.Update(cmd);
                    string Path = Server.MapPath(@"\Data\Account\" + id + "\\");

                    //Creating folders
                    Directory.CreateDirectory(Path);
                    Directory.CreateDirectory(Path + "Audio");
                    Directory.CreateDirectory(Path + "Video");
                    Directory.CreateDirectory(Path + "Image");
                    Directory.CreateDirectory(Path + "DP");
                    Directory.CreateDirectory(Path + "Cover");

                    //Redirecting
                    Session["User"] = id;
                    Response.Redirect("~/settings.aspx?aq=" + hash + "&rel=" + encryptCode + "&xp=" + decryptCode);
                }
            }
            con.Close();
        }
    }
}