using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace UTube
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = "";
                if (Request.Cookies["User"] == null && Session["User"] == null) Response.Redirect("~/login.aspx");
                else if (Request.Cookies["User"] == null) id = (string)Session["User"];
                else
                {
                    id = Request.Cookies["User"].Value;
                    Response.ClearHeaders();
                    Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                    Response.AddHeader("Pragma", "no-cache");
                }

                try
                {
                    FileInfo[] fi = new DirectoryInfo(Server.MapPath(@"\Data\Account\" + id + @"\DP\")).GetFiles();
                    profile_image.ImageUrl = @"\Data\Account\" + id + @"\DP\" + fi[0].Name;
                    imhSmall.ImageUrl = @"\Data\Account\" + id + @"\DP\" + fi[0].Name;

                    //Setting JSON data on page
                    DataAccessLayer dal = new DataAccessLayer("DBCON");
                    DataTable dt =  dal.GetBulkRecords("SELECT usID, Name,Email,Sex FROM Users WHERE usID='" + id + "'").Tables[0];
                    tbPersonal.Text = Operations.ConvertToJSON(dt);
                    tbRecentImages.Text = Operations.ConvertToJSON(dal.GetBulkRecords("SELECT TOP 4 [Path] from Uploads WHERE usID='" + id + "' AND Type='Image' ORDER BY Uploaded DESC").Tables[0]);
                    tbRecentVideos.Text = Operations.ConvertToJSON(dal.GetBulkRecords("SELECT TOP 4 Name, [Path] from Uploads WHERE usID='" + id + "' AND Type='Video' ORDER BY Uploaded DESC").Tables[0]);
                    tbSubscribers.Text = DBWorks.GetSubscribers(id);
                }
                catch { }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if(tbSearch.Text != "") Response.Redirect("~/search.aspx?search="+tbSearch.Text.Replace(' ', '+'));
        }
    }
}