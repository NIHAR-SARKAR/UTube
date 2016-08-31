using System;
using System.Web;
using System.Data.SqlClient;

namespace UTube
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["User"] != null) Response.Redirect("~/account.aspx");
        }

        protected void LogIn_Click(object sender, EventArgs e)
        {
                string sql = "Select usID from Users where Email = '" + UserId.Text + "'and Pass = '" + UserPass.Text + "' and Verified='0'";
                SqlCommand cmd = new SqlCommand(sql);
                DataAccessLayer dal = new DataAccessLayer("DBCON");
                string value = (string) dal.GetValue(cmd);
                if (value != null)
                {
                    Session["User"] = value;
                    Response.Write(value);
                    if (chkrem.Checked)
                    {
                        HttpCookie Cookie = new HttpCookie("User");
                        Cookie.Value = value;
                        Cookie.Expires = DateTime.Now.AddDays(3650);
                        Response.Cookies.Add(Cookie);
                    }
                    Response.Redirect("~/account.aspx");
                }
                else
                {
                    Response.Write("Wrong input");
                }
        }
    }
}