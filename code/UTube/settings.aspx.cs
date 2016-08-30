using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace UTube
{
    public partial class settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = "";
                if (Request.Cookies["User"] == null && Session["User"] == null) Response.Redirect("~/login.aspx");
                else if (Request.Cookies["User"] == null) id = (string)Session["User"];
                else id = Request.Cookies["User"].Value;

                FileInfo[] fi = new DirectoryInfo(Server.MapPath(@"\Data\Account\" + id + @"\DP\")).GetFiles();
                string dp = (fi.Length != 0) ? @"\Data\Account\" + id + @"\DP\" + fi[0].Name : "";
                DataTable dt = new DataAccessLayer("DBCON").GetBulkRecords("Select Name,Email,DOB,Pass from Users Where usID='" + id + "'").Tables[0];
               
                tbName.Text = (string)dt.Rows[0]["Name"];
                tbPassword.Text = (string)dt.Rows[0]["Pass"];
                lblEmail.Text = (string)dt.Rows[0]["Email"];
                lblDOB.Text = Convert.ToDateTime(dt.Rows[0]["DOB"].ToString()).ToLongDateString();
                imgDP.ImageUrl = dp;

                ViewState["Name"] = tbName.Text;
                ViewState["Pass"] = tbPassword.Text;
                ViewState["DOB"] = Convert.ToDateTime(dt.Rows[0]["DOB"]).ToShortDateString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string id = "";
            if (Request.Cookies["User"] == null) id = (string)Session["User"];
            else id = Request.Cookies["User"].Value;

            string name = ViewState["Name"].ToString(), pass = ViewState["Pass"].ToString(), dob = ViewState["DOB"].ToString();
            
            if (tbName.Text != "") name = tbName.Text;
            if (tbPassword.Text != "" && tbPassword.Text == tbConfirm.Text) pass = tbPassword.Text;
            if (ddlDay.SelectedValue != "00" && ddlMonth.SelectedValue != "00" && ddlYear.SelectedValue != "00")
                dob = ddlDay.SelectedValue + "/" + ddlMonth.SelectedValue + "/" + ddlYear.SelectedValue;

            SqlCommand cmd = new SqlCommand("Update Users SET Name=@name,Pass=@pass,DOB=@dob where usID='" + id + "'");
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
            cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value = pass;
            cmd.Parameters.Add("@dob", SqlDbType.Date).Value = dob;
            bool update = new DataAccessLayer("DBCON").Update(cmd);
            if (fuDP.HasFile && update)
            {
                fuDP.PostedFile.SaveAs(Server.MapPath(@"\Data\Account\" + id + @"\DP\" + id + ".jpg"));
                lblDOB.Text = Convert.ToDateTime(dob).ToLongDateString();
                Response.Redirect("~/settings.aspx");
            }
        }
    }
}