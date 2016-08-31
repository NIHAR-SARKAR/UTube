using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace UTube
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            
            if (chk.Checked)
            {
                DataAccessLayer dal = new DataAccessLayer("DBCON");

                cmd.CommandText = "Insert into Users values ('newID', @name, @email, @sex, @dob, @pass, GETDATE(), [verified])";
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = UserName.Text;
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = UserId.Text;
                cmd.Parameters.Add("@sex", SqlDbType.VarChar, 6).Value = ddGender.SelectedItem.Text;
                if (ddlDay.SelectedValue != "0" && ddlMonth.SelectedValue != "0" && ddlYear.SelectedValue != "0")
                {
                    cmd.Parameters.Add("@dob", SqlDbType.Date).Value = ddlDay.SelectedValue + "/" + ddlMonth.SelectedValue + "/" + ddlYear.SelectedValue; 
                }

                if (UserPass.Text != UserConfPass.Text)
                {
                    Response.Write("<script>alert('Password Mismatch');</script>");
                }
                else
                {
                    cmd.Parameters.Add("@pass", SqlDbType.VarChar, 15).Value = UserConfPass.Text;
                }
                

                SqlCommand check = new SqlCommand("Select COUNT(*) from Users where Email=@email");
                check.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = UserId.Text;
                
                if ((int)dal.GetValue(check) == 1)
                {
                    //email already registered error
                    Response.Write("<script>alert('User Already Registered');</script>");
                }
                else
                {
                    string hash = Operations.GenerateVerificationCode();
                    cmd.CommandText = cmd.CommandText.Replace("[verified]", "'" + hash + "'");
                    string newID = dal.Insert("Users", "usID", "US", "newID", cmd);
                    string decrypCode = "";
                    string code = Operations.Encrypt(hash, out decrypCode);
                    string redirectLink = "verify_password.aspx?aq=" + code + "&rel=" + Operations.Encrypt(newID, out decrypCode) + "&xp=" + decrypCode;
                    Operations.SendMail(UserId.Text, hash, "http://localhost:" + HttpContext.Current.Request.Url.Port.ToString() + "/" + redirectLink, UserName.Text);
                    Response.Redirect(redirectLink);
                }
           
            }
            else
            {
                Response.Write("<script>alert('Please Agree to the Terms and Conditions to proceed');</script>");
            }
        }
    }
}