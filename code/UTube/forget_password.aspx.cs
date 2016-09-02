using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace UTube
{
    public partial class forget_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSendPass_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select Pass from Users Where Email = @mail");
            cmd.Parameters.Add("@mail", SqlDbType.VarChar).Value = ForgetMail.Text;
            SendMessage.Visible = true;

            DataAccessLayer dal = new DataAccessLayer("DBCON");
            if ((string)dal.GetValue(cmd) != null)
            {
                Operations.SendMail(ForgetMail.Text, dal.GetValue(cmd).ToString(), "http://localhost:" + HttpContext.Current.Request.Url.Port.ToString() + "/login.aspx");
                SendMessage.Text = "Password has been sent to registered email";
            }
            else
            {
                SendMessage.Text = "Invalid email entered. Use a registered ID.";
            }
        }
    }
}