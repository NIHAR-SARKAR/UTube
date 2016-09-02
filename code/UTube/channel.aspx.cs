using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTube
{
    public partial class useraccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                   string id = "";
                   if (Request.Cookies["User"] == null && Session["User"] == null) Response.Redirect("~/login.aspx");
                   else if (Request.Cookies["User"] == null) id = (string)Session["User"];
                   else id = Request.Cookies["User"].Value;

                    string user = (string)Request.QueryString["rel"];
                    if (user == null || user == (string)Session["User"])
                        Response.Redirect("~/account.aspx");

                    FileInfo[] fi = new DirectoryInfo(Server.MapPath(@"\Data\Account\" + user + @"\DP\")).GetFiles();
                    FileInfo[] fi1 = new DirectoryInfo(Server.MapPath(@"\Data\Account\" + id + @"\DP\")).GetFiles();
                    profile_image.ImageUrl = @"\Data\Account\" + user + @"\DP\" + fi[0].Name;
                    imhSmall.ImageUrl = @"\Data\Account\" + id + @"\DP\" + fi1[0].Name;

                    DataAccessLayer dal = new DataAccessLayer("DBCON");
                    DataTable dt = dal.GetBulkRecords("SELECT usID,Name,Email,Sex FROM Users WHERE usID='" + user + "'").Tables[0];
                    string sub = dal.GetValue(new SqlCommand("select COUNT(*) from Subscriptions where usID='" + id + "' and subID='" + user + "'")).ToString();

                    if (dt.Rows.Count == 0)
                        Response.Redirect("~/account.aspx");

                    tbPersonal.Text = Operations.ConvertToJSON(dt);
                    tbRecentImages.Text = Operations.ConvertToJSON(dal.GetBulkRecords("SELECT Name,[Path],[Description] from Uploads WHERE usID='" + user + "' AND Type='Image' ORDER BY Uploaded DESC").Tables[0]);
                    tbRecentVideos.Text = Operations.ConvertToJSON(dal.GetBulkRecords("SELECT Name, [Path],[Description] from Uploads WHERE usID='" + user + "' AND Type='Video' ORDER BY Uploaded DESC").Tables[0]);
                    tbRecentAudio.Text = Operations.ConvertToJSON(dal.GetBulkRecords("SELECT Name, [Path],[Description] from Uploads WHERE usID='" + user + "' AND Type='Audio' ORDER BY Uploaded DESC").Tables[0]);
                    tbSubscribers.Text = DBWorks.GetSubscribers(user);

                    string script = "ID=\"" + id +"\"; Name=\"" + (string)dt.Rows[0]["Name"] + "\"; uID=\"" + user + "\"; subscribed=\"" + sub + "\"";
                    Operations.AddJavaScript((Page)HttpContext.Current.Handler, script, true);
                    ViewState["uID"] = user;
            }
        }

        protected void addSubs_Click(object sender, EventArgs e)
        {
            string id = "";
            if (Request.Cookies["User"] == null) id = (string)Session["User"];
            else id = Request.Cookies["User"].Value;
            
            DBWorks.AddSubscriber(id, ViewState["uID"].ToString());
        }
    }
}