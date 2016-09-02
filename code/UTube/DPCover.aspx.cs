using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace UTube
{
    public partial class DPCover : System.Web.UI.Page
    {
        string id = "", decrypCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try 
            {
                decrypCode = Request.QueryString["xp"].ToString();
                id = Operations.Decrypt(Request.QueryString["rel"].ToString().Replace(" ", "+"), decrypCode);
                if (id == "") Response.Redirect("~/register.aspx");
            }
            catch { Response.Redirect("~/register.aspx"); }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            FileInfo fi;
            if (fuDP.HasFile)
            {
                fi = new FileInfo(fuDP.PostedFile.FileName);
                fuDP.PostedFile.SaveAs(Server.MapPath(@"\Data\Account\" + id + @"\DP\" + id + fi.Extension));
            }

            if (fuCover.HasFile)
            {
                fi = new FileInfo(fuCover.PostedFile.FileName);
                fuCover.PostedFile.SaveAs(Server.MapPath(@"\Data\Account\" + id + @"\Cover\" + id + fi.Extension));
            }

            Session["User"] = id;
            Response.Redirect("~/account.aspx");

        }
    }
}