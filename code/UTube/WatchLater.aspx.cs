using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTube
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["User"] == null) id = (string)Session["User"];
                else id = Request.Cookies["User"].Value;

                tbLater.Text = Operations.ConvertToJSON((new DataAccessLayer("DBCON").GetBulkRecords("SELECT A.usID as ID, A.Type, A.Path as Url, A.Name, A.Description, A.Views, U.Name as Uploader FROM Uploads A, PlayLater B, Users U WHERE A.upID=B.upID AND B.usID='" + id + "' AND U.usID=A.usID ORDER BY [When] DESC").Tables[0]));
            }
        }

        protected void btnClearHistory_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["User"] == null) id = (string)Session["User"];
            else id = Request.Cookies["User"].Value;

            (new DataAccessLayer("DBCON")).Insert(new SqlCommand("Delete from PlayLater where usID='" + id + "'"));
            Response.Redirect("~/WatchLater.aspx");
        }
    }
}