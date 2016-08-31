using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UTube
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["User"] == null) id = (string)Session["User"];
                else id = Request.Cookies["User"].Value;

                tbHistory.Text = Operations.ConvertToJSON((new DataAccessLayer("DBCON").GetBulkRecords("SELECT A.Type, A.Path as Url, A.Name, A.Description, U.Name as Uploader FROM Uploads A, History B, Users U WHERE A.upID=B.upID AND B.usID='" + id + "' AND U.usID=A.usID ORDER BY [When] DESC")).Tables[0]);
            }
        }

        protected void btnClearHistory_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["User"] == null) id = (string)Session["User"];
            else id = Request.Cookies["User"].Value;

            (new DataAccessLayer("DBCON")).Insert(new SqlCommand("Delete from History where usID='" + id + "'"));
            Response.Redirect("~/history.aspx");
        }
    }
}